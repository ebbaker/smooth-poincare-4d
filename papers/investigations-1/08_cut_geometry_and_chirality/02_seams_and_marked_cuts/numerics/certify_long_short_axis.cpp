// Fixed-profile interval certificate for SP4-CUT-SEAM-E18.
// Build with C++20 and ordinary IEEE round-to-nearest scalar instructions.
// The exact decimal coefficient strings are read from E13's REPLAY_PROFILE.
#include <algorithm>
#include <array>
#include <bit>
#include <cfenv>
#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <limits>
#include <sstream>
#include <stdexcept>
#include <string>
#include <vector>

namespace {

static_assert(std::numeric_limits<double>::is_iec559);
static_assert(std::numeric_limits<double>::digits == 53);

double down(double x) {
    if (!std::isfinite(x)) throw std::runtime_error("nonfinite rounding input");
    if (x == 0.0) return -std::numeric_limits<double>::denorm_min();
    auto bits = std::bit_cast<std::uint64_t>(x);
    bits = x > 0.0 ? bits - 1 : bits + 1;
    return std::bit_cast<double>(bits);
}

double up(double x) {
    return -down(-x);
}

struct Interval {
    double lo, hi;
    explicit Interval(double value = 0) : lo(value), hi(value) {}
    Interval(double lower, double upper) : lo(lower), hi(upper) {
        if (!(lower <= upper)) throw std::runtime_error("invalid interval");
    }
};

Interval operator+(Interval a, Interval b) {
    return {down(a.lo + b.lo), up(a.hi + b.hi)};
}
Interval operator-(Interval a) {
    return {-a.hi, -a.lo};
}
Interval operator-(Interval a, Interval b) {
    return a + (-b);
}
Interval operator*(Interval a, Interval b) {
    auto [lower, upper] = std::minmax({a.lo*b.lo, a.lo*b.hi, a.hi*b.lo, a.hi*b.hi});
    return {down(lower), up(upper)};
}
Interval operator/(Interval a, Interval b) {
    if (b.lo <= 0 && b.hi >= 0) throw std::runtime_error("division by a zero-containing interval");
    return a * Interval(down(1 / b.hi), up(1 / b.lo));
}
Interval operator+(double a, Interval b) { return Interval(a) + b; }
Interval operator+(Interval a, double b) { return a + Interval(b); }
Interval operator-(double a, Interval b) { return Interval(a) - b; }
Interval operator-(Interval a, double b) { return a - Interval(b); }
Interval operator*(double a, Interval b) { return Interval(a) * b; }
Interval operator/(double a, Interval b) { return Interval(a) / b; }
Interval operator/(Interval a, double b) { return a / Interval(b); }

Interval sq(Interval a) {
    if (a.lo >= 0) return {a.lo == 0 ? 0 : down(a.lo*a.lo), up(a.hi*a.hi)};
    if (a.hi <= 0) return sq(-a);
    return {0, up(std::max(a.lo*a.lo, a.hi*a.hi))};
}
Interval cube(Interval a) { return a * sq(a); }

Interval sqrt_enclose(Interval a) {
    if (a.lo < 0) throw std::runtime_error("negative square-root interval");
    if (a.hi == 0) return Interval(0);
    double lower = std::sqrt(a.lo);
    double upper = std::sqrt(a.hi);
    while (lower > 0 && up(lower*lower) > a.lo) lower = down(lower);
    while (down(upper*upper) < a.hi) upper = up(upper);
    return {lower, upper};
}

Interval rational(std::uint64_t numerator, std::uint64_t denominator) {
    if (denominator == 0) throw std::runtime_error("zero decimal denominator");
    const double n = static_cast<double>(numerator);
    const double d = static_cast<double>(denominator);
    return Interval(down(n), up(n)) / Interval(down(d), up(d));
}

Interval decimal(const std::string& token) {
    bool negative = false, fractional = false;
    std::uint64_t numerator = 0, denominator = 1;
    for (std::size_t i = 0; i < token.size(); ++i) {
        char ch = token[i];
        if (i == 0 && ch == '-') { negative = true; continue; }
        if (!fractional && ch == '.') { fractional = true; continue; }
        if (ch < '0' || ch > '9') throw std::runtime_error("unexpected coefficient syntax");
        if (numerator > (UINT64_MAX-9)/10 || (fractional && denominator > UINT64_MAX/10))
            throw std::runtime_error("coefficient exceeds exact integer parser");
        numerator = 10*numerator + (ch-'0');
        if (fractional) denominator *= 10;
    }
    Interval result = rational(numerator, denominator);
    return negative ? -result : result;
}

std::vector<Interval> coefficients(const std::string& path) {
    std::ifstream input(path);
    if (!input) throw std::runtime_error("cannot read E13 source");
    std::ostringstream content;
    content << input.rdbuf();
    auto source = content.str();
    const std::string marker = "REPLAY_PROFILE = (";
    auto start = source.find(marker);
    if (start == std::string::npos) throw std::runtime_error("missing REPLAY_PROFILE");
    start += marker.size();
    const auto end = source.find(')', start);
    std::istringstream tokens(source.substr(start, end-start));
    std::vector<Interval> result;
    std::string token;
    while (std::getline(tokens, token, ',')) {
        token.erase(std::remove_if(token.begin(), token.end(), [](unsigned char c) {
            return c == ' ' || c == '\n' || c == '\r' || c == '\t';
        }), token.end());
        if (!token.empty()) result.push_back(decimal(token));
    }
    if (result.size() != 45) throw std::runtime_error("expected exactly 45 coefficients");
    return result;
}

const auto inverse_factorials = [] {
    std::array<Interval, 33> result;
    result[0] = Interval(1);
    for (unsigned i = 1; i < result.size(); ++i) result[i] = result[i-1] / i;
    return result;
}();

const auto reciprocals = [] {
    std::array<Interval, 40> result;
    for (unsigned i = 1; i < result.size(); ++i) result[i] = rational(1, i);
    return result;
}();

Interval exp_point(double t) {
    unsigned shifts = 0;
    while (std::abs(t) > 0.25) {
        t *= 0.5;
        if (++shifts > 20) throw std::runtime_error("exponential range exceeds certificate");
    }
    Interval value = inverse_factorials[14];
    for (int i = 13; i >= 0; --i) value = inverse_factorials[i] + t*value;
    // |tail| <= 2*(1/4)^15/15! < 2^-64.
    const double remainder = 0x1p-64;
    value = value + Interval(-remainder, remainder);
    while (shifts-- > 0) value = sq(value);
    return value;
}

Interval exp_enclose(Interval a) {
    return {exp_point(a.lo).lo, exp_point(a.hi).hi};
}

Interval log_mantissa(Interval m) {
    auto y = (m-1) / (m+1);
    auto Y = sq(y);
    if (Y.hi > 0.125) throw std::runtime_error("logarithm range reduction failed");
    Interval polynomial = reciprocals[39];
    for (int j = 18; j >= 0; --j) polynomial = reciprocals[2*j+1] + Y*polynomial;
    // Use |y| <= 1/2 and y^2 <= 1/8: tail <= (1/8)^20/(41*(1-1/8)) < 2^-64.
    return 2*y*polynomial + Interval(-0x1p-64, 0x1p-64);
}

Interval log_point(double a) {
    if (!(a > 0)) throw std::runtime_error("logarithm argument is not positive");
    static const Interval log_two = log_mantissa(Interval(2));
    int exponent;
    double mantissa = std::frexp(a, &exponent) * 2;
    return log_mantissa(Interval(mantissa)) + (exponent-1)*log_two;
}

Interval log_enclose(Interval a) {
    return {log_point(a.lo).lo, log_point(a.hi).hi};
}

Interval log_relative_point(double t) {
    if (t == 0.) return Interval(1);
    if (!(t > 0)) throw std::runtime_error("log-relative argument is negative");
    if (t > 0.25) return log_enclose(1+Interval(t)) / t;
    Interval p = reciprocals[21];
    for (int j = 19; j >= 0; --j) {
        auto value = reciprocals[j+1];
        p = (j % 2 ? -value : value) + t*p;
    }
    // Alternating series next term bounded by (1/4)^21/22 < 2^-46.
    return p + Interval(-0x1p-46, 0);
}

Interval log_relative(Interval a) {
    if (a.lo < 0) throw std::runtime_error("log-relative interval is negative");
    // log(1+t)/t = integral_0^1 (1+t*y)^(-1) dy decreases in t.
    return {log_relative_point(a.hi).lo, log_relative_point(a.lo).hi};
}

Interval exp_relative_point(double t) {
    if (std::abs(t) > 0.25) return (exp_point(t)-1) / t;
    Interval p = inverse_factorials[15];
    for (int j = 13; j >= 0; --j) p = inverse_factorials[j+1] + t*p;
    // |tail| <= 2*(1/4)^15/16! < 2^-64.
    return p + Interval(-0x1p-64, 0x1p-64);
}
Interval exp_relative(Interval a) {
    // (e^t-1)/t = integral_0^1 e^(t*y) dy increases in t.
    return {exp_relative_point(a.lo).lo, exp_relative_point(a.hi).hi};
}

Interval sinh_tail(Interval y) {
    Interval Y = sq(y);
    if (Y.hi > 16) throw std::runtime_error("sinh-tail argument exceeds four");
    Interval p = inverse_factorials[27];
    for (int j = 11; j >= 0; --j) p = inverse_factorials[2*j+3] + Y*p;
    // The omitted terms have ratio below 1/2; the first is Y^13/29!.
    Interval omitted = inverse_factorials[29];
    for (int j = 0; j < 13; ++j) omitted = omitted * Y;
    return p + Interval(0, (2*omitted).hi);
}

struct Jets {
    Interval value, first, second;
};

Jets operator+(Jets a, Jets b) {
    return {a.value+b.value, a.first+b.first, a.second+b.second};
}
Jets operator*(Jets a, Jets b) {
    return {a.value*b.value,
            a.first*b.value+a.value*b.first,
            a.second*b.value+2*a.first*b.first+a.value*b.second};
}
Jets operator*(Interval a, Jets b) {
    return {a*b.value, a*b.first, a*b.second};
}

struct Trial {
    static constexpr unsigned count = 22;
    const Interval scale = rational(1, 250);
    const Interval anisotropy = rational(3, 20);
    const Interval width = rational(5, 84);
    const Interval coord_scale = log_enclose(Interval(251));
    const Interval endpoint_a = 1 / sqrt_enclose(sqrt_enclose(Interval(3)));
    const Interval endpoint_u = log_enclose(Interval(3)) / 4;
    const Interval length;
    const Interval p_zero = 4*length;
    const Interval linear = sq(p_zero/endpoint_a);
    const Interval axial_value = log_enclose(1+1/linear)/2;
    const Interval axial_slope = -1/(2*(1+linear));
    const Interval transverse_value = endpoint_u - endpoint_u/sqrt_enclose(1+anisotropy);
    const Interval transverse_slope = -endpoint_u/2 + endpoint_u/(2*(1+anisotropy)*sqrt_enclose(1+anisotropy));
    const std::vector<Interval> params;

    explicit Trial(std::vector<Interval> input)
        : length(rational(19,20)+rational(4,5)/(1+exp_enclose(-input[0]))),
          params(std::move(input)) {}

    struct Bounds { Interval energy, robin; };

    Bounds evaluate(Interval x) const {
        Interval q = sq(x);
        Interval one_minus = 1-q;
        Interval one_minus_squared = sq(one_minus);
        Interval q_scaled = q + scale;
        Interval coordinate = log_enclose(1+q/scale)/coord_scale;
        Interval first_offset = 1/(coord_scale*q_scaled*width);
        Interval second_offset = -first_offset/q_scaled;
        Jets gauss_axial, gauss_transverse;
        for (unsigned i = 0; i < count; ++i) {
            Interval centre = i == 0 ? Interval(0) : (i == 21 ? Interval(1) : rational(i, 21));
            Interval offset = (coordinate-centre)/width;
            Interval gaussian = exp_enclose(-sq(offset));
            Interval rate = -2*offset*first_offset;
            Interval rate_change = -2*(sq(first_offset)+offset*second_offset);
            Jets source{gaussian, gaussian*rate, gaussian*(sq(rate)+rate_change)};
            gauss_axial = gauss_axial+params[i+1]*source;
            gauss_transverse = gauss_transverse+params[i+count+1]*source;
        }

        Jets envelope{one_minus_squared, -2*one_minus, Interval(2)};
        Jets bolt{q/q_scaled, scale/sq(q_scaled), -2*scale/cube(q_scaled)};
        Interval den = 1+linear*q;
        Jets w_base{-log_enclose(den)/2+axial_value*q*(2-q)+axial_slope*q*(q-1),
                    -linear/(2*den)+2*axial_value*one_minus+axial_slope*(2*q-1),
                    sq(linear/den)/2-2*axial_value+2*axial_slope};
        Jets w = w_base + gauss_axial*envelope*bolt;
        Interval linear_q = linear*q;
        linear_q.lo = std::max(0.0, linear_q.lo);  // Both factors are nonnegative.
        Interval w_over_q = -linear*log_relative(linear_q)/2
            + axial_value*(2-q)+axial_slope*(q-1)+one_minus_squared*gauss_axial.value/q_scaled;
        Interval r_den = q+anisotropy;
        Interval r_inv_sqrt = 1/sqrt_enclose(r_den);
        Jets r_base{endpoint_u*r_inv_sqrt+transverse_value+transverse_slope*(q-1),
                    -endpoint_u*r_inv_sqrt/(2*r_den)+transverse_slope,
                    3*endpoint_u*r_inv_sqrt/(4*sq(r_den))};
        Jets r = r_base + gauss_transverse*envelope;

        Interval p = p_zero*exp_enclose(w.value);
        Interval p_tail = p_zero*w_over_q*exp_relative(w.value);
        Interval a = x*p, u = x*r.value;
        Interval a_s = p*(1+2*q*w.first)/length;
        Interval u_s = (r.value+2*q*r.first)/length;
        Interval length_squared = sq(length);
        Interval a_ss_a = (6*w.first+4*q*(sq(w.first)+w.second))/length_squared;
        Interval u_ss = x*(6*r.first+4*q*r.second)/length_squared;

        Interval H1 = sinh_tail(u), H2 = sinh_tail(2*u), H4 = sinh_tail(4*u);
        Interval P = exp_enclose(2*u)+exp_enclose(-2*u);
        Interval d = 4*u+16*cube(u)*H2;
        Interval r_cubed = cube(r.value);
        Interval d_a = 4*(r.value+4*q*r_cubed*H2)/p;
        Interval d_remainder = 16*x*r_cubed*H2/sq(p);
        Interval pd_remainder = 128*x*r_cubed*H4/sq(p);
        Interval ratio_derivative = 2*x*(r.first-r.value*w.first)/(length*p);
        Interval cancellation = x*(-r.value*(1+p_zero/p)*(p_tail/p)
                                  -2*(r.first+r.value*w.first+2*q*r.first*w.first))/length_squared;
        Interval scalar_half = -a_ss_a+2*P-sq(a)-sq(d_a)-sq(u_s);
        Interval tangent = 2*P-3*sq(a)+sq(d_a)+sq(u_s);
        Interval tangent_difference = -4*d+4*pd_remainder+2*cancellation;
        Interval magnetic = -2*a_s+2*d_a*u_s;
        Interval magnetic_difference =
            16*x*sq(r.value)*sq(1+sq(u)*H1)*u_s/p
            +8*ratio_derivative-2*d_remainder*a_s-2*a*u_s;
        Interval axial_plus = (-a_ss_a+tangent)/2-scalar_half/6+magnetic;
        Interval transverse_plus = u_ss+tangent_difference/2+magnetic_difference;

        Interval q_cubed = cube(q);
        Interval phi = 1+q_cubed*(1-3*q/4);
        Interval laplacian_numerator = 36*sq(q)-48*q_cubed+12*q_cubed*one_minus*w.first;
        Interval quotient = 2*scalar_half-6*laplacian_numerator/(length_squared*phi);
        Interval energy = length*a*(3*sq(axial_plus)+sq(transverse_plus))/8;
        return {energy, quotient};
    }
};

} // namespace

int main(int argc, char** argv) {
    try {
        if (argc != 3 || std::fegetround() != FE_TONEAREST) {
            std::cerr << "usage: certify_long_short_axis E13_SOURCE_PATH POWER_OF_TWO_CELLS\n";
            return 2;
        }
        volatile double subnormal = std::numeric_limits<double>::denorm_min();
        if (!(subnormal > 0 && subnormal+subnormal > subnormal))
            throw std::runtime_error("binary64 subnormals are unavailable");
        auto cells = std::stoul(argv[2]);
        if (cells < 16 || cells > (1u<<22) || (cells & (cells-1)))
            throw std::runtime_error("cell count must be a power of two from 16 to 2^22");
        Trial trial(coefficients(argv[1]));
        Interval total;
        Interval terminal;
        Interval final_eighth;
        double lower_robin = std::numeric_limits<double>::infinity();
        double upper_of_minimum = std::numeric_limits<double>::infinity();
        unsigned failed_cell = 0;
        for (unsigned i = 0; i < cells; ++i) {
            auto b = trial.evaluate(Interval(double(i)/cells, double(i+1)/cells));
            total = total+b.energy;
            if (i >= 13*cells/16) terminal = terminal+b.energy;
            if (i >= 7*cells/8) final_eighth = final_eighth+b.energy;
            if (b.robin.lo < lower_robin) {
                lower_robin = b.robin.lo;
                failed_cell = i;
            }
            upper_of_minimum = std::min(upper_of_minimum, b.robin.hi);
        }
        total = total/double(cells);
        terminal = terminal/double(cells);
        final_eighth = final_eighth/double(cells);
        std::cout << std::setprecision(17)
                  << "cells " << cells << '\n'
                  << "L [" << trial.length.lo << ", " << trial.length.hi << "]\n"
                  << "E_plus/pi^2 [" << total.lo << ", " << total.hi << "]\n"
                  << "E_plus/pi^2 on x in [13/16, 1] [" << terminal.lo << ", " << terminal.hi << "]\n"
                  << "E_plus/pi^2 on x in [7/8, 1] [" << final_eighth.lo << ", " << final_eighth.hi << "]\n"
                  << "min(L_phi/phi) [" << lower_robin << ", " << upper_of_minimum
                  << "], worst lower cell " << failed_cell << '\n'
                  << "exact comparisons: E_plus > 3/2 " << (total.lo > 1.5)
                  << ", E_plus < 4 " << (total.hi < 4.0)
                  << ", Robin lower > 0 " << (lower_robin > 0)
                  << ", final-eighth E_plus > 3/2 " << (final_eighth.lo > 1.5) << '\n';
        if (total.lo > 1.5 && total.hi < 4.0 && lower_robin > 0.0 && final_eighth.lo > 1.5) return 0;
        return 1;
    } catch (const std::exception& error) {
        std::cerr << "certificate stopped: " << error.what() << '\n';
        return 2;
    }
}
