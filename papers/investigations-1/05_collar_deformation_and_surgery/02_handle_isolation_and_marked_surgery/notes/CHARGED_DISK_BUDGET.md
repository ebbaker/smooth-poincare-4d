# The budget of a matched face on a charged disk

26 November 2026 · Prepared for Edward B. Baker III with OpenAI Codex assistance. CDS-E01a / SUR-B03, revision 1. The frozen request records a GPT-6.2 Sol/ultra helper assignment. Actual serving model and effort are unavailable to this helper. Inputs are the branch plans, overviews and registers at `c8fb08dcf2e39ae68d4c9d9ebd6a69893ce9cce4` and the passages identified in the [versioned source table](../../references/README.md#working-inputs). This return rederives the finite comparison and the fixed-source exact-face exclusion using the master's positivity and disk-selection results. [Frozen request](../../research-progress/handoffs/ACTIVATION_20261126.md)

## The original disk and its exterior

Let $M$ be a closed oriented smooth homotopy four-sphere and $g_i$ the supplying smooth volume-one positive Yamabe metrics, with $e_i=E_+(g_i;M)=E_-(g_i;M)\to I=I^+(M)<2T$, $d_i=e_i-I$, and $T=4\pi^2$. Use the Hilbert–Schmidt norms of the two Weyl operators on real two-forms and keep the orientation of $M$ on all subsets and capped manifolds. On a hypothetical nonstandard type, the selected subsequence in `thm:band-disk-residual` supplies a parametrized standard closed disk $D_i$, its marked bicollar, a fixed sign $s_*$, and constants $a,b>0$ such that

$$
m_i^{s_*}=E_{s_*}(g_i;D_i)\ge a,\qquad
v_i^{s_*}=E_{s_*}(g_i;V_i)\ge b,\qquad V_i=M\setminus\operatorname{int}D_i.
$$

In each chirality $\sigma$, $m_i^\sigma+v_i^\sigma=e_i$. The fixed positive lower bounds are in the selected sign on the two *complete* sides. The disk-side bound includes its original inner collar. The direct comparison below uses $m_i^{s_*}\ge a$. [Thresholds, signature and disk selection, `thm:band-disk-residual`](../../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex)

Fix $i$ with $e_i<2T$. Suppose a smooth joined path from $g_i$ has peak $H_i=\sup_\lambda E_+(g_{i,\lambda};M)<2T$ and ends at $h_i$ with a round product germ in the disk marking, up to smooth positive conformal factor. Strip off the factor near the face and stretch the product inside its cylinder by any finite length. Each stretch is a path on the same $M$ and preserves the endpoint energy $e_i'=E_\pm(h_i;M)$, as the cylinder is conformally flat. The wall `eq:zero-wall` keeps the path positive. Gauss–Bonnet on each positive Yamabe representative gives $Y\ge\sqrt{48(2T-H_i)}>0$, uniformly in stretching length at this index. A compactly supported Yamabe test on the retained exterior with half-infinite round cylinder extends by zero to a sufficiently long joined metric with the same quotient. Use a conformal factor equal to $e^{-u}$ for large outgoing product length $u$ and the disk radius $r=e^{-u}$. This fills the end smoothly and conformally flatly in the given angular marking. Smooth tests avoiding the added point are dense in $H^1$ by the vanishing capacity of a point in dimension four. Conformal covariance gives the same positive Yamabe lower bound on the capped exterior. A conformal adjustment within $V_i$ does not change either Weyl measure. [Joined wall and stretching, `prop:short-cut`](../../../../master/manuscript/variational_comparison.tex)

The actual disk parametrization extends the attaching marking over the original $D_i$, and the cap extends that same marking in its radial ball coordinates. With the collar identifications this gives an oriented reassembly on $M$ relative to the retained exterior away from its gluing collar. The cap orientation is the orientation of the replaced disk. For the signed change $\Delta_{V,i}^\sigma=E_\sigma(h_i;V_i)-v_i^\sigma$, the resulting smooth metric $\widehat g_{V,i}$ satisfies

$$
E_\sigma(\widehat g_{V,i};M)=e_i-m_i^\sigma+\Delta_{V,i}^\sigma\ge I,\qquad
m_i^\sigma\le d_i+\Delta_{V,i}^\sigma\quad(\sigma=+,-).
$$

The competitor has the same total in either chirality. In particular its two exterior increments satisfy the exact identity

$$
\Delta_{V,i}^+-\Delta_{V,i}^-=m_i^+-m_i^-.
$$

At one index an upper bound $G_i^\sigma$ for the full signed exterior change gives a contradiction if $m_i^\sigma-G_i^\sigma>d_i$. If $e_i-m_i^\sigma+G_i^\sigma\le T$, positivity gives direct recognition, including equality. At the minimizing excess the bound permits equality of the competitor energy with $I$. The competitor is the capped exterior. The disk-side change enters the joined peak. [Direct exterior replacement and recognition, `prop:exterior-replacement` and `prop:recognition`](../../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex)

For example, in the supplied fixed oriented annulus of `weak:splice`, let $c_i^\sigma,c_{V,i}^\sigma$ be the raw energies on the changed strip and its exterior half, respectively. An $L^2$ error of at most $\eta_i^\sigma$ on the full strip and $\eta_{V,i}^\sigma$ on the exterior half bounds the joined increment by $P_i^\sigma=2\sqrt{c_i^\sigma}\eta_i^\sigma+(\eta_i^\sigma)^2$ and the exterior increment by $G_i^\sigma=2\sqrt{c_{V,i}^\sigma}\eta_{V,i}^\sigma+(\eta_{V,i}^\sigma)^2$. This follows from the triangle inequality with the leading density multiplier in $[0,1]$. The joined increment agrees in both signs by closed signature, so $e_i+\min_\sigma P_i^\sigma<2T$ is sufficient for the cap's positivity. The exterior increments can differ and test their respective disk masses. The annular estimates require the source metric in that chart, including differentiated control and the genuine support widths. [Fixed annular splice](../../../../master/manuscript/first_order_splice.tex) · [Physical marking and collar costs](../../../../master/01_fixed_type_variational_descent/manuscript/disk_collar_comparison.tex)

## The exact face test at one physical index

Assume on the fixed $(g_i,D_i)$ that the induced metric on $\partial D_i$ is conformal to the unit round metric in the actual disk marking and that $K^\circ=0$. Take the normal $\nu$ pointing from $D_i$ into $V_i$ and $K=\frac12\partial_t h_t|_{t=0}$ in its Gaussian chart. For $\widehat g_i=e^{2f}g_i$, the face second fundamental form is $e^f(K+\nu(f)h_0)$. Prescribe $f|_{\partial D_i}$ to make the intrinsic metric unit round and $\nu(f)|_{\partial D_i}=-\operatorname{tr}_{h_0}(K)/3$. The prescribed value and derivative extend smoothly across the bicollar, with a cutoff away from the face. The new normal flow transports the same angular marking. Choose its compact subchart inside the supplied bicollar, with positive available widths on both sides. In this chart $\widehat g_i=dt^2+h_t$, with $h_0=\gamma_{\rm rd}$ and $\partial_t h_0=0$. [Exact face conventions and sources](../../01_collar_deformation_and_adapted_coordinates/research-overview/OVERVIEW.md#the-exact-model-and-the-first-approximate-one)

For arbitrary sufficiently small widths $w_D,w_V>0$ in this chart use $\chi(-t/w_D)$ for $t<0$ and $\chi(t/w_V)$ for $t>0$, where the fixed smooth $\chi$ is one near zero, zero near one, and takes values in $[0,1]$. These glue smoothly. With $\psi$ the glued cutoff, use the tangential metric $\gamma_{\rm rd}+(1-\lambda\psi)(h_t-\gamma_{\rm rd})$. It is positive by convexity, equals the source near each outer face, and equals $\gamma_{\rm rd}$ on a middle strip at $\lambda=1$. Multiplying back by $e^{-2f}$ makes the path start at $g_i$ and preserves its two chiral energies. The endpoint is then product up to the prescribed conformal factor.

On either strip of width $w$, smooth Taylor estimates in $t$ for the mismatch and its tangential derivatives give $O_i(w^2)$, $O_i(w)$ and $O_i(1)$ after zero, one and two normal derivatives. The factors $O(w^{-1})$, $O(w^{-2})$ from differentiating $\psi$ are paired with those vanishing jets. The interpolated metrics have uniformly bounded curvature and a uniformly bounded volume density there, since all derivatives through order two and the inverse metric are bounded in a fixed finite cover of the compact chart. For a constant $C_i$ fixed independently of these subwidths and of $\lambda$,

$$
H_i\le e_i+C_i(w_D+w_V),\qquad
|\Delta_{V,i}^\sigma|\le C_i w_V,\qquad
|E_\sigma(h_i;D_i)-m_i^\sigma|\le C_i w_D\quad(\sigma=+,-).
$$

For example, at a tested $i$ with $m_i^\sigma>d_i$, choose the widths so that $C_i(w_D+w_V)<2T-e_i$ and $C_iw_V<m_i^\sigma-d_i$. Both choices are strictly feasible at that one index, which gives a positive competitor below $I$. More generally, shrinking both subwidths at fixed $i$ within the strict joined headroom proves the necessary conditions

$$
\boxed{\ m_i^+=m_i^-\le d_i\ }.
$$

The equality of the two raw masses follows from the exterior signature identity and the vanishing exterior increments. The upper bound is inclusive and follows by comparing actual positive metrics at positive widths, then taking their energy bounds to the limit. In particular an attained subcritical minimizer with such a face has zero Weyl mass on the entire disk in either sign. On the supplied charged-disk subsequence, choose $i_0$ so that $d_i<a$ and $e_i<2T$ for all $i\ge i_0$ in the subsequence. The exact compatible conformally round and umbilic face is excluded on **each** original disk at these indices. Take the width limit at each individual smooth source before using the sequence, with the gauged chart and curvature bound allowed to depend on $i$. The equality of the raw signed masses is also a preliminary obstruction at any tested exact face, even if both measured masses are small.

## Balanced enlargement and the core

Let $Q_i$ be the outer disk enclosing the original bicollar. In the master construction, for any fixed integer $k\ge1$ the enlarged parametrized disk $B_i$ contains $Q_i$. At each bisection an auxiliary standard ball captures the four raw measures up to tolerance in the exterior of the current disk. Restricted to its ball chart, one hyperplane bisects the four measures. Approximate one half smoothly and join it to the current disk by one thin tube. The resulting boundary connected sum is a standard disk, the protected original bicollar stays inside it, and the lost mass of each measure in the approximations and tube can be chosen arbitrarily small at this source. Iteration at fixed $k$ gives the formula below with $r_i^\sigma\to0$ for both signs. Here $V_i^B=M\setminus\operatorname{int}B_i$, $q_i^\sigma=E_\sigma(g_i;Q_i)$, $v_i^{B,\sigma}=E_\sigma(g_i;V_i^B)$ and $b_i^\sigma=E_\sigma(g_i;B_i)$.

$$
v_i^{B,\sigma}=2^{-k}(e_i-q_i^\sigma)+r_i^\sigma,\qquad
b_i^\sigma=(1-2^{-k})e_i+2^{-k}q_i^\sigma-r_i^\sigma.
$$

Accept the four-measure selection of `prop:balanced-disk-saving` with its physical full curvature and spectral measures as well. Its small raw collar mass is a measure estimate on an already selected boundary. The late index and the raw thin-strip tolerance are independent of any matched metric deformation. [Balanced selection and disk-side budget](../../../../master/manuscript/balanced_disk.tex)

If a joined path with peak $H_i<2T$ ends at an exactly matched germ in the *enlarged* disk marking, cap its exterior by the direct construction above. For $S_i^\sigma=b_i^\sigma-E_\sigma(h_i;B_i)$ and $\Delta_{V^B,i}^\sigma=E_\sigma(h_i;V_i^B)-v_i^{B,\sigma}$, the finite comparisons are

$$
\begin{aligned}
\Delta_{V^B,i}^\sigma &\ge I-v_i^{B,\sigma}=b_i^\sigma-d_i,\\
S_i^\sigma&\ge b_i^\sigma+I-H_i>b_i^\sigma+I-2T,\\
\Delta_{V^B,i}^\sigma&=S_i^\sigma+e_i'-e_i\ge S_i^\sigma-d_i.
\end{aligned}
$$

The second line uses $E_\sigma(h_i;V_i^B)\ge I$ and $e_i'\le H_i$. The strict wall lower bound is $(1-2^{-k})e_i+2^{-k}q_i^\sigma+I-2T-r_i^\sigma$. At $k=1$ and $I=4T/3$ its lower limit is at least $a/2$ for $s_*$, since $q_i^{s_*}\ge a$. At $k=1$ the raw retained exterior in both signs is eventually below $T$, since $v_i^{B,\sigma}\le e_i/2+|r_i^\sigma|$ and $I<2T$. The positive exterior cap must increase its energy to at least $I$. For any fixed $k$ with $2^{-k}(T+\varepsilon_*)\le\varepsilon_*$, the wall lower bound has lower limit at least $(2-2^{-k})I-2T>\varepsilon_*$ in both signs, by $I>T+\varepsilon_*$. [Uniform recognition gap](../../../../master/manuscript/recognition_gap.tex)

A path changing only the final seam strip can save at most the raw disk-side mass of that strip, since the endpoint mass there is nonnegative. Thus if those strip masses tend to zero, a matched path with strict peak below $2T$ is excluded at every sufficiently late index for this fixed $k$. Even with a larger modification, if the whole $Q_i$ is held fixed up to conformal gauge, the peak must satisfy $H_i\ge I+\max_\sigma q_i^\sigma$. This follows because $E_\sigma(h_i;B_i)\ge q_i^\sigma$ and the exterior cap consumes at least $I$ in the same sign. In particular preservation of that core is incompatible with the strict ceiling if one raw core mass is at least $2T-I$ at the tested index.

## Return to SUR-B03

The exact-face model gives a conditional exclusion on the original physical disks throughout the selected late subsequence. The balanced enlargement gives a separate finite lower bound on any matched disk-side saving and a necessary exterior change. A new finite comparison needs a chart or coupled deformation on one actual source with its marking and inverse, both native widths, two complete signed side costs, and the joined peak. The supplying theorem gives neither these geometric data nor an identification of the charged disk with a handle interaction. An approximately round face or small raw shell measure requires a measured splice estimate in that same physical marking. [Physical benchmark and escalation](../research-plan/PLAN.md)
