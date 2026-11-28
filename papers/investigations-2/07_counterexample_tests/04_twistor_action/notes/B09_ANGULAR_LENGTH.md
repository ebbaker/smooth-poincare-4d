# A necessary angular length bound and a nonzero-degree trial

28 November 2026, America/New_York. For Edward B. Baker III with OpenAI Codex assistance. Selected lead GPT-6.2 Astra/ultra, independent serving telemetry unavailable. Checkout `7c6bbab9a0a6`. Inputs are the [global polar current inequality](B09_UNRESTRICTED_SLOPE.md) and the [spatial symbol](E17_POLAR_LOWER_BOUND.md).

Keep the same marked cylinder at \(b=51\pi/16\), put \(k=2\pi\), \(D=2\), and let \(p=-\int K_0\). A strictly cheaper competitor must have \(p>0\). Set \(T_t=\int_M|\partial_t g|^2\) and \(X=\int_M|d_x g|^2\). The spatial Dirac spectrum, with all nonzero spatial lengths at least \(k\), gives \(X\ge kp\). Inequality (2) of the global note therefore gives the following necessary condition for strict improvement:
\[
 T_t < (3b/4-k)p-p^2/(8D)
       \le 2D(3b/4-k)^2=2D(25\pi/64)^2 .
\]
In particular the length in the spatial \(L^2\) metric of the path of angular fields satisfies
\[
 L(g)=\int_{-1}^1\|\partial_tg(t,\cdot)\|_{L^2(Y)}\,dt
          < 25\sqrt2\,\pi/32 .
\]
At equality of the action, the same inequalities with weak signs hold. These estimates concern arbitrary smooth amplitudes. They restrict the temporal motion of an angular map even when its spatial Fourier support is unrestricted.

For a test outside the homotopy class of the radial angular map, use \(A=e^{\mathbf i kx_1}\mathbf j\), \(B=e^{\mathbf i kx_2}\). In four successive time intervals take the shorter great-circle interpolations between the following pairs of quaternion-valued maps:
\[
 (1,A),\qquad(A,B),\qquad(B,\mathbf j),\qquad(\mathbf j,1).
\]
Each pair is pointwise orthogonal. Use \(\cos\theta\,U+\sin\theta\,V\) on the corresponding interval, with any smooth increasing \(\theta\) from 0 to \(\pi/2\) flat to all orders at its ends. The resulting smooth unit field has full traces \(1\) and is independent of \(x_3\). The integral of its pullback of the oriented unit-quaternion volume form over \([-1,1]\times T^2_{12}\), divided by \(2\pi^2\), has absolute value one. Only the second interval has dependence on both circles. There the two orthogonal complex lines have polar radii \(\cos\theta,\sin\theta\), their phases each sweep one circle, and the absolute pullback integral is \((2\pi)^2\int_0^{\pi/2}\sin\theta\cos\theta\,d\theta=2\pi^2\), with constant orientation sign. Constant end values make this a relative degree.

For every such timing the path has \(L=4(\pi/2)=2\pi\). Hence it costs *strictly more* than the radial field for every smooth zero-end log amplitude, even if the amplitude depends on \(x_3\) as well. Alternatively the exact mean lower bound gives
\[
 \int Q-2Cb^2\ \ge\ \tfrac23\big[T_t-2D(25\pi/64)^2\big]
 \ \ge\ \tfrac23\big[2\pi^2-4(25\pi/64)^2\big]>0.
\]
The length estimate excludes the four specified rotations with any timing. Other representatives of the same relative degree need not have this length.
