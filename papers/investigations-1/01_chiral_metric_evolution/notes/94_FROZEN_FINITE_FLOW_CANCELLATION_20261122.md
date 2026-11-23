# SP4-CME-E94 — Exact finite-flow cancellation in the frozen shear

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch was configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I did not author E91.
Its frozen digest matched the [request][req] before use.
This packet computes only the autonomous flow of its explicit
horizontal vector field. No new primary source was used.
[B55][b55]. [E91][e91]. [Return][ret].

## Shear conjugation and exact trajectories

Use the flat oriented torus \(M=(\mathbb R/2\pi\mathbb Z)^4\),
with flat coordinate fields \(e_i\) and covectors \(dx^i\).
For each positive integer \(n\), set
\[
 f_n(s)=\frac{\epsilon_n}{n}\sin(ns),\qquad
 \epsilon_n=n^{-3/4},\qquad
 u_n=e_1-f_n'(x^1)e_2=e_1-\epsilon_n\cos(nx^1)e_2 .
\]
The formulas hold for every such \(n\); the E91 sequence for
comparison with the full-pair critical norm is dyadic.
Let \(N=e_2\otimes dx^1\), so \(N^2=0\) and \(|N|=1\)
in the flat operator norm. Define the shear and translation
on the universal cover by
\[
 \Psi_n(x)=x+f_n(x^1)e_2,\qquad R_t(x)=x+t e_1.
\]
They commute with the \(2\pi\mathbb Z^4\) deck translations.
The inverse shear is \(x-f_n(x^1)e_2\), since \(x^1\) is
unchanged. Thus on the torus \(\Psi_n\) is a diffeomorphism.
Its derivative is \(I+f_n'(x^1)N\) with determinant one.
Because \(D\Psi_n(x)u_n(x)=e_1\), the pullback of the
constant vector field \(e_1\) by \(\Psi_n\) is exactly \(u_n\).
[E91, fixed shear and exact horizontal output][e91].

The autonomous flow and the inverse at time \(t\) are
\[
 \begin{split}
 \Phi_{n,t}(x)
   &=\Psi_n^{-1}R_t\Psi_n(x)
     =(x^1+t,\ x^2+f_n(x^1)-f_n(x^1+t),\ x^3,\ x^4),\\
 \Phi_{n,t}^{-1}(x)
   &=\Phi_{n,-t}(x)
     =(x^1-t,\ x^2+f_n(x^1)-f_n(x^1-t),\ x^3,\ x^4).
 \end{split}                                                          \tag{1}
\]
Indeed \(\Phi_{n,0}=\operatorname{id}\) and differentiation
gives \(\partial_t\Phi_{n,t}
=e_1-f_n'(x^1+t)e_2=u_n(\Phi_{n,t})\).
The first, third and fourth coordinates solve the constant
coordinate equations. The second integrates
\(\dot x^2=-f_n'(x^1+t)\), which proves uniqueness directly.
These formulas are global in \(t\). The inverse follows from
the conjugation, and both maps preserve flat volume.

## Exact displacement and derivative norms

In (1) use the displayed lifts on \(\mathbb R^4\) which
start at the identity at \(t=0\). The corresponding lift of
the inverse is \(\Phi_{n,-t}\). To compare with translation,
subtract the corresponding lift of \(R_t\) or \(R_{-t}\).
The differences \(\Delta_{n,\pm t}=\Phi_{n,\pm t}-R_{\pm t}\)
are periodic vector-valued functions of \(x\), so their
flat sup norms and derivative norms are unambiguous.
For the forward lift,
\[
 \Delta_{n,t}(x)
  =-\frac{2\epsilon_n}{n}\sin(nt/2)
       \cos(nx^1+nt/2)e_2 .
\]
The inverse lift uses \(t\) replaced by \(-t\). For each
integer \(k\ge0\), with \(D^0\Delta=\Delta\) and with
the flat tensor derivative norms, the exact equality is
\[
 \|D^k\Delta_{n,t}\|_\infty
   =\|D^k\Delta_{n,-t}\|_\infty
   =2\epsilon_n n^{k-1}|\sin(nt/2)|.                                  \tag{2}
\]
Only \(x^1\) derivatives occur, and the remaining sine or
cosine attains absolute value one on the torus. In particular,
using the sum \(C^1\) norm of the displacement,
\[
 \begin{split}
 \|\Delta_{n,\pm t}\|_\infty
     &\le 2n^{-7/4},\\
 \|D\Delta_{n,\pm t}\|_\infty
     &\le 2n^{-3/4},\\
 \|\Delta_{n,\pm t}\|_{C^1}
     &=2n^{-3/4}(1+n^{-1})|\sin(nt/2)|.
 \end{split}                                                          \tag{3}
\]
These are uniform for all real times. For every fixed \(T>0\),
when \(n\ge\pi/T\) the upper envelopes are attained on
\([0,T]\) at \(t=\pi/n\). In particular for each \(k\ge2\),
\[
 \sup_{0\le t\le T}\|D^k\Delta_{n,\pm t}\|_\infty
       =2n^{k-7/4}\quad(n\ge\pi/T).
\]
This is an interval supremum. At a prescribed time the
sine factor matters. For example at \(t=2\pi\) it vanishes
for every integer \(n\), and all the displacement derivatives
then vanish.

## Integrated generator size and cancellation

Use the E91 convention
\(\|u\|_{C^1}=\|u\|_\infty+\|Du\|_\infty\).
Since \(Du_n=n\epsilon_n\sin(nx^1)N\) and
\(|u_n|^2=1+\epsilon_n^2\cos^2(nx^1)\), the autonomous generator
satisfies on each fixed \([0,T]\), \(T>0\),
\[
 \begin{split}
 \int_0^T\|u_n\|_{C^1}\,dt
      &=T\big(\sqrt{1+n^{-3/2}}+n^{1/4}\big)\ \longrightarrow\ \infty,\\
 \int_0^T\|Du_n\|_\infty\,dt&=Tn^{1/4},\\
 \int_0^T\|u_n-e_1\|_{C^1}\,dt
      &=T(1+n)n^{-3/4}\ \longrightarrow\ \infty .
 \end{split}                                                          \tag{4}
\]
Along each trajectory, the first coordinate advances at unit
speed. In the variational equation for \(D\Phi_{n,t}\),
the coefficient is
\(Du_n(\Phi_{n,t}(x))=n\epsilon_n\sin(n(x^1+t))N\).
Since \(N^2=0\), its solution is directly
\[
 D\Phi_{n,t}(x)=I+\epsilon_n
             \big(\cos(nx^1)-\cos(n(x^1+t))\big)N .
\]
The oscillation therefore integrates before taking its modulus.
Equation (4) instead takes the spatial sup norm of the
derivative before integrating. The latter diverges even
though (3) bounds both the flow and its inverse relative
to translation.

The E91 reference uses an independently prescribed
nonzero definite two-form triple with the flat exterior
derivative \(d\) on internal sections. It is not a
curvature-compatible connection reference, since \(d^2=0\)
and an actual adjoint \(\mathrm{SO}(3)\) derivative has
\(d_A^2=[F_A,\cdot]\). The computed cancellation applies
to this explicit autonomous field. It does not settle
finite slice placement for actual curved connections or
supply a general finite-flow theorem.

[req]: ../research-progress/handoffs/SP4-CME-E94_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E94_RETURN_v1.md
[b55]: ../brainstorm/notes/B55_FINITE_FLOW_CANCELLATION_TEST_20261122.md
[e91]: 91_FROZEN_HORIZONTAL_DERIVATIVE_TEST_20261122.md
