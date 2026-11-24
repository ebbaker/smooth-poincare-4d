# SP4-FOT-SEC-E26 · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper configuration was
gpt-6.2-sol / ultra. Actual backend model and effort are unavailable
for independent verification. The author-selected lead was retained,
with actual identifier and effort unavailable here.
[Request v1](SP4-FOT-SEC-E26_REQUEST_v1.md)

**The robust buffer bound holds independently of exterior data.**
If \(D_+u=tf+e\) on the unit ball \(B\), with the prescribed B16
seed and \(e\in L^2(B)\), then on \(A=\{2/3<|x|<1\}\)
\[
 \|D_-u\|_{L^2(A)}+\|e\|_{L^2(B)}\ge |t|d,\qquad
 d=\sqrt{12\pi^2}\,\operatorname{dist}_{L^2((2/3,1),\rho^3d\rho)}
 \left(\frac{6}{\pi^2}(M_0\rho^{-4}-2M_2\rho^{-6}),
       \operatorname{span}\{\rho^4,\rho^6\}\right)>0.
\]
The derivation gives the explicit Gram matrix and verifies the
Hilbert–Schmidt and sphere measure factors. The global \(L^2\)
particular fields for \(tf\) and the zero extension of \(e\)
leave a smooth biharmonic residual throughout \(B\).
Its projection onto \(M(x/|x|)Z\) has only the two regular radial
powers. The distance is optimal for the relaxed biharmonic
approximation. Sharpness for actual metric responses remains
unproved. [Derivation](../../notes/SEC_E26_20261124.md)

The conformal transfer preserves the constant exactly on the round
patch in its curvature \(L^2\) norms. For a supplied \(C^2\)-small
fixed-volume chart metric with exact \(F_{r,+}(h)=t f_r\) there,
Taylor expansion gives
\(\|W^-_{g_h}\|_{L^2(A,g_h)}\ge |t|d-C\|h\|_{C^2(B,r)}^2\).
Obtaining such a metric or a family controlled on an arbitrary
exterior remains a separate premise.
[B18 decision](../../brainstorm/notes/SEC_B18_LOCAL_RESPONSE_AND_EXTERIOR_CONTROLS_20261124.md)

Observed HEAD e76752648b69969b1234d0295530c87fce9fcdcb and verified
all three B18 pins, all sixteen B16 pins and the seven setup pins.
The derivation identifies the E21–E23 passages used. Evidence is
exact local analysis, with the nonlinear estimate conditional on
the supplied exact local positive source.
