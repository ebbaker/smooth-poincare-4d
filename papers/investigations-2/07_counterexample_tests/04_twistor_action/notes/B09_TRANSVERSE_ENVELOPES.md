# A circular Fourier mode with transverse envelopes

28 November 2026, America/New_York, for Edward B. Baker III, with OpenAI Codex assistance. Author-selected GPT-6.2 Astra/ultra lead, independent serving telemetry unavailable. Checkout `7c6bbab9a0a6`. Use the [E14 frame](E14_FIRST_NEGATIVE_MODE.md) and the finite-amplitude [E26 inequality](E26_FINITE_HELIX.md). The product, chirality and full normalized end data are those of [B09](B09_GLOBAL_AMPLITUDE.md).

Let \(y=(x_2,x_3)\), \(k=\pm2\pi\), and \(a,c\) be arbitrary smooth \(\mathbb C_{\mathbf i}\)-valued functions of \((t,y)\). At the ends prescribe \(a=1,c=0\). At \(b=51\pi/16\), every admissible
\[
 h=a(t,y)+e^{\mathbf i k x_1} c(t,y)\mathbf j
\]
has \(S(e^{bt}h)\ge9b^4/8\), with equality exactly at \(h=1\). Its trace-free variations can change both amplitudes and phases across the two transverse directions. Its norm \(R^{1/2}=(|a|^2+|c|^2)^{1/2}\) is independent of \(x_1\) and positive throughout. Indeed a zero would contain a full \(x_1\) circle.

To prove the comparison, split the derivative array of \(\psi=e^{bt}h\) into the rows \((t,x_1)\) and \((x_2,x_3)\), denoted by \(N,E\). In the squared projected norm the gradient cross term is zero. The remaining cross pairing is that of their two Dirac contractions. Before left multiplication by \(\mathbf j,\mathbf k\), derivatives of the constant Fourier component take values in \(\mathbb C_{\mathbf i}\), while derivatives of the rotating component lie in \(\mathbb C_{\mathbf i}\mathbf j\). Left multiplication by \(1,\mathbf i\) preserves these planes and left multiplication by \(\mathbf j,\mathbf k\) interchanges them. At each component the pairing therefore vanishes, and the two between-component pairings average to zero by the nonzero Fourier frequency. Conjugation of the exponential by a transverse unit still gives a nonzero frequency. The denominator is constant on the averaging circle. It follows that
\[
 \langle Q\rangle_{x_1}=Q_N+\langle |\Pi E|^2/|\psi|^2\rangle_{x_1}\ge Q_N,
 \quad Q_N=|\Pi N|^2/|\psi|^2.
\]
Here \(Q_N\) is independent of \(x_1\). The projection formula on two nonzero rows even gives \(|\Pi E|^2\ge |E|^2/2\). Jensen yields \(\langle Q^2\rangle_{x_1}\ge Q_N^2\).

For each fixed \(y\), square completion gives
\[
 Q_N=\frac{3}{4R}\left(|a_t+ba|^2+|c_t+(b-k/3)c|^2+
                \frac{8k^2}{9}|c|^2\right).
\]
For real \(s\), \(|z'+s z|^2\ge ((|z|)'+s|z|)^2\) a.e. for smooth complex \(z\), by the real part of the Hermitian pairing, including a.e. on its zero set. Replace the two coefficients by their moduli. Write \((|a|,|c|)=\sqrt R(\cos\theta,\sin\theta)\). The angle in the closed first quadrant is Lipschitz since \(R\) has positive minimum. It vanishes at both ends and \(u=\frac12\log R\) has zero traces. The resulting \(Q_N\) is exactly the E26 one-dimensional density. Its estimate holds for Lipschitz angles and amplitudes by zero-trace smooth approximation strongly in \(W^{1,4}\) on the interval, hence uniformly with convergence of the actions and of the terms used for rigidity. Apply E26 for every \(y\) and integrate.

Equality requires \(|a|=1,c=0\) on every slice by E26 and continuity. At these moduli \(Q_N=(3/4)(b^2+|a_t|^2)\), so equality and the full end traces also fix the phase of \(a\). The same proof works for spatial rotations permuting the marked periodic coordinate axes. For a fixed helical angle depending only on time, a separate Jensen averaging in all three directions also allows the log amplitude to be an arbitrary function of all four variables. [E27](E27_POLAR_DEFECT.md)
