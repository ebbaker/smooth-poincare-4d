# GST cut groups and marked two-knot exteriors

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance, SP4-CUT-SLIDE-E02 packet B. Requested helper routing GPT-6.2 Sol/ultra. Actual serving model and reasoning effort were unavailable. Inputs read at `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`. This is an exact replay of the five representations and a smooth oriented handle and gluing calculation on the native markings. The construction gives flat bundle holonomy. It supplies no Riemannian realization in the entering band.

## The cut and the side that carries the representation

Use the native zero-framed $L_{3,1}=Q\cup V_3$, with $Q$ the square knot and $V_3=T_{3,4}\#\overline{T}_{3,4}$. The simultaneous outlet is $Z=\#_2(S^1\times S^2)$. Use the two oriented belts of the actual upper body $H=\natural_2(S^1\times D^3)$ and the carried identification of $Z$ with $\partial H$ from GST Figure 9. The two individual reverse attaching words are

\[
r=yxy(xyx)^{-1}\quad (V_3^*),\qquad s=x^4y^{-3}\quad (Q^*).
\]

Keep the assignment to the individual components. In the primary diagram read the two ordinary dual meridians of Figure 9 right through Figures 10–13 into the two forward tubes. GST §7 gives these words with $w=yx$ and identifies the outgoing $S^3$ components. In the square-knot-first comparison $V_3$ moves by framed isotopy in the $Q$-filled level, which preserves its surgery co-core. Scharlemann §7.1 and Lemma 7.1 compute the single $V_3^*$ group as the braid group. To distinguish the two words, put $p=xyx$ and $q=xy$ in the quotient by $r$. Then $p^2=q^3$, $x=q^{-1}p$ and $y=p^{-1}q^2$. The quotients of the two candidate groups by their centers are $C_2*C_3$ and $C_4*C_3$. Their abelianizations have orders six and twelve. This disambiguates the co-core assignment in the native marking. [GST, published §7, pp. 2329–2333, Figures 9–13 and Question 2](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf#page=25) · [Scharlemann, arXiv:1208.1299v3, §7.1 and Lemma 7.1, pp. 27–29](https://arxiv.org/pdf/1208.1299v3#page=27) · [05 diagram and basings](../../../05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/notes/GST_DUAL_WORD_AND_BAND_20261126.md)

Let $M_J=S^3_0(J)$ be the cut after attaching only the forward handle on $J\in\{Q,V_3\}$. Write $W_J$ for the upper side of that cut and $G_r=F(x,y)/\langle\!\langle r\rangle\!\rangle$, $G_s=F(x,y)/\langle\!\langle s\rangle\!\rangle$.

| First forward handle $J$ | Cut | Reverse description of $W_J$ | $\pi_1 W_J$ | Reverse word remaining when the cut is filled |
| --- | --- | --- | --- | --- |
| $Q$ | $M_Q$ | $H\cup h^*_{V_3}$ | $G_r=\langle x,y\mid xyx=yxy\rangle$ | $s$ |
| $V_3$ | $M_{V_3}$ | $H\cup h^*_Q$ | $G_s=\langle x,y\mid x^4=y^3\rangle$ | $r$ |

The map from $\pi_1(Z)$ into $W_J$ is the indicated one-relator quotient by the reverse 2-handle. In the forward direction $W_J$ is built from a collar of $M_J$ by the remaining 2-handle and then the 3- and 4-handles. Thus $\pi_1(M_J)\twoheadrightarrow\pi_1(W_J)$ as well. It kills the remaining *forward attaching curve in $M_J$*. This curve is distinct from the remaining *reverse word* in the table. The reverse word is represented on $Z$ by the other native reverse attaching circle. The lower side of $M_J$ is $D^4\cup h_J^2$ and is simply connected. Each $W_J$ has the integral homology of a circle, by its two reverse 1-handles and the one 2-handle with primitive abelianization row. Both native cuts $M_J$ are zero surgeries on fibered connected sums, with closed fibers of genera two and six, respectively. Neither is $S^1\times S^2$. [05 native-cut calculation and peripheral markings](../../../05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/notes/SQUARE_KNOT_NATIVE_TEST_20261126.md)

## Five exact evaluations

Write $\xi=\rho(x)$ and $\upsilon=\rho(y)$ in the unit quaternions with Hamilton units $i,j,k$. Number the samples in the order of the fourth-slide note. Samples 1 and 2 are the third-slide witnesses.

| Sample | $\xi$ | $\upsilon$ | Killed word |
| --- | --- | --- | --- |
| 1 | $(1-i)/\sqrt2$ | $(2+i+\sqrt{11}\,j)/4$ | $s$ |
| 2 | $(6+5i+\sqrt{39}\,k)/10$ | $(6+5i-\sqrt{39}\,k)/10$ | $r$ |
| 3 | $(1-i)/\sqrt2$ | $(16-i+\sqrt{767}\,j)/32$ | $s$ |
| 4 | $(1-i)/\sqrt2$ | $(8-13i+\sqrt{23}\,j)/16$ | $s$ |
| 5 | $(-17+10i+\sqrt{11}\,k)/20$ | $(-17+10i-\sqrt{11}\,k)/20$ | $r$ |

For samples 1, 3 and 4 the quaternions have unit norm and scalar parts $1/\sqrt2$ and $1/2$. Thus $\xi^4=\upsilon^3=-1$. For samples 2 and 5 use $p=i$ and $q=(5+6i+\sqrt{39}\,j)/10$ or $(10-17i+\sqrt{11}\,j)/20$, respectively. These have $p^2=q^3=-1$. With $\xi=q^{-1}p$ and $\upsilon=p^{-1}q^2$, one finds $\xi\upsilon=q$ and $\xi\upsilon\xi=\upsilon\xi\upsilon=p$.

For the noncommutation and the surviving words, multiply $(a,U)(b,V)=(ab-U\cdot V,aV+bU+U\times V)$ and invert unit quaternions by $(a,U)^{-1}=(a,-U)$. This gives these exact values in the stated marking.

| Sample | $\xi\upsilon-\upsilon\xi$ | $\operatorname{Re}(\xi\upsilon)$ | $\operatorname{Re}\rho$ of surviving word |
| --- | --- | --- | --- |
| 1 | $-\sqrt{22}\,k/4$ | $3/(4\sqrt2)$ | $41\sqrt2/64$ ($r$) |
| 2 | $\sqrt{39}\,j/5$ | $1/2$ | $64893/78125$ ($s$) |
| 3 | $-\sqrt{1534}\,k/32$ | $15/(32\sqrt2)$ | $20209\sqrt2/32768$ ($r$) |
| 4 | $-\sqrt{46}\,k/16$ | $-5/(16\sqrt2)$ | $2573\sqrt2/4096$ ($r$) |
| 5 | $\sqrt{11}\,j/10$ | $1/2$ | $-13854473/20000000$ ($s$) |

The products in each row are distinct and cannot be negatives since their common scalar part is nonzero. Consequently the images of $x,y$ fail to commute even under $\operatorname{Ad}:SU(2)\to SO(3)$, whose kernel is $\{\pm1\}$. Each has scalar part different from $0,\pm1$, so each adjoint rotation has angle different from $0,\pi$ and its centralizer consists of the rotations about its axis. The distinct axes have trivial common rotation centralizer. This excludes a nontrivial connected group of parallel fiberwise rotations covering the identity in the associated flat normal-$S^2$ bundle. The existence of circle actions on the underlying manifold is a separate question. The exact sample replay does not use the slide-history enumeration. [Third-slide note](../../../05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/notes/GST_THIRD_SLIDE_QUOTIENTS.md) · [third-slide reader](../../../05_collar_deformation_and_surgery/reviews/THREE_SLIDE_QUATERNION_READER.md) · [fourth-slide note](../../../05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/notes/GST_FOURTH_SLIDE_QUOTIENTS.md) · [fourth-slide reader](../../../05_collar_deformation_and_surgery/reviews/FOURTH_SLIDE_READER.md)

## Genuine one-tube exteriors from the native disks

In the native reverse picture set $B=H\cup h_Q^*\cup h_{V_3}^*$. GST §8 identifies this particular $B$ as a standard smooth ball and exhibits the two disjoint disks bounded by the Figure 9 meridians. Write $D_J$ for the disk bounded by the original forward $J$. In reverse handle coordinates $D^2_u\times D^2_v$ for $h_J^*$, it is the co-core $\{0\}\times D_v^2$ (the forward core in the inverted handle), and its normal disk has coordinate $u$. Let $C_J$ be its compact exterior in $B$. In the excised handle the remaining radial annulus in $u$ times $D^2_v$ is a product collar attached to $W_J$ on its original outer face. Thus $C_J$ identifies with $W_J$ up to adding a collar and rounding corners, keeping the marking on $H$. Its boundary is the knot exterior $E(J)=S^3\setminus\operatorname{int}\nu J$ joined to $S^1_u\times D^2_v$ with the native zero longitude as filling slope. A normal meridian $S^1_u\times\{v_0\}$ lies in this collar and transports to the attaching word of $h_J^*$ on $\partial H$. It represents $s$ for $J=Q$ and $r$ for $J=V_3$, up to conjugacy and reversal. [GST §8, p. 2334, especially the paragraph after Figure 14](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf#page=30)

Double this actual disk in $B\cup_{S^3}\overline B$ using the identity in its boundary coordinates. The double is $S^4$ because $B$ is a smooth ball. Collars give a smooth two-sphere $K_J$ with trivial normal bundle. Its compact exterior is

\[
\mathcal E_J=C_J\cup_{E(J)}\overline C_J,
\qquad \partial\mathcal E_J\cong S^1_\mu\times S^2 .
\]

The map $\pi_1(E(J))\to\pi_1 C_J$ is onto because it factors through two surjections. The first, onto $\pi_1(M_J)$, is the Dehn-filling quotient. The second, onto $\pi_1 W_J$, follows from the forward handle order. On the two copies the maps are identical in the chosen markings. Van Kampen gives the pushout of two copies of $\pi_1 C_J$ over this same surjection, which is again $\pi_1 C_J$. The explicit isomorphism is induced by folding the second copy onto the first. The peripheral inclusion $\pi_1(S^1_\mu\times S^2)\to\pi_1(\mathcal E_J)$ therefore sends $1\in\mathbb Z$ to $s\in G_r$ for $J=Q$ and $r\in G_s$ for $J=V_3$, up to basing and orientation. The two words have primitive abelianizations in their respective quotients, so the peripheral inclusions are injective. Pulling back by the folding map gives samples 2 and 5 on $\mathcal E_Q$ and samples 1, 3 and 4 on $\mathcal E_{V_3}$. These are two marked exterior constructions, each taken separately.

In these coordinates the product closing attaches $D_u^2\times (D_{v,+}^2\cup_{S_v^1}\overline{D_{v,-}^2})$ along $S_u^1$ times that doubled disk, matching the $u$ and $v$ coordinates on both faces. It restores the deleted normal disk bundle, giving the double of $B$ with the original identity on $S^3$. Equivalently form $N_J=\mathcal E_J\cup_{S^1\times S^2}(S^1\times D^3)$ with the product circle aligned with $\mu$ and boundary sphere matched to the doubled $v$-disk. The inclusion of the gluing boundary induces an isomorphism onto $\pi_1(S^1\times D^3)$, so $\pi_1(N_J)\cong\pi_1(\mathcal E_J)$ and the surgery core represents $\mu$. Product-framed surgery on that circle gives the stated closing. The cap meridian is the surviving word. Its principal $SO(3)$ rotation angle is $2\arccos|\operatorname{Re}\rho(\mu)|$, with the exact scalar in the last column of the table. Each angle lies in $(0,\pi)$. The representations therefore have nontrivial meridional holonomy in both $SU(2)$ and $SO(3)$ and do not extend flatly over this filling. [Parent manuscript, §6, one-tube form](../../manuscript/cuts_of_subcritical_conformal_classes.tex)

## Scope of these maps

- **Original split lower zero.** In a terminal presentation with a lower $0$-handle and initial zero-framed unknot $A$ forming $T=S^2\times D^2$, the actual exterior of that core is built from $S^1\times S^2$ by the remaining forward 2-handles and the 3- and 4-handles. Its fundamental group is a quotient of $\mathbb Z$. Its first homology is $\mathbb Z$ by the Mayer–Vietoris sequence of the homotopy sphere, so its group is $\mathbb Z$. The five nonabelian images cannot occur on that particular exterior. This argument uses the actual initial $A$ and also applies when the remaining forward handles run nonlocally before localization.
- **Native $L_{n,1}$ with $n\geq3$.** The $Q$-first side has the same literal $r$, so samples 2 and 5 apply throughout the native family. For samples 1, 3 and 4 to kill $s_n=x^{n+1}y^{-n}$ after $SO(3)$ projection, the two powers must both be central in $SU(2)$ because their axes are distinct. Thus $4\mid n+1$ and $3\mid n$, or $n=3+12t$. The central signs are then $(-1)^{1+3t}$ and $(-1)^{1+4t}$. They agree precisely when $t$ is even. Hence these samples kill $s_n$ in $SU(2)$ precisely for $n\equiv3\pmod{24}$ and in $SO(3)$ precisely for $n\equiv3\pmod{12}$. In particular the separate native rank-two $L_{4,1}$ returned by 05 carries samples 2 and 5 on its $Q$-first upper side, with remaining word $s_4$. Passing through further attachments, a replacement trace, or a distinct penultimate cut requires the actual induced map of cut and side. A comparison that transports only the final outlet does not provide it. [05 manuscript, sections on the knotted opposite completion and the native reverse family](../../../05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/manuscript/recognition_from_marked_handle_cuts.tex)
- **Cut and metric implications.** The native cut representatives come from $\pi_1(M_J)\twoheadrightarrow\pi_1 W_J\to SU(2)$. Nonabelian image alone gives no PSC obstruction for a general three-manifold, as the round quotient $S^3/Q_8$ demonstrates. The separate cut argument requires its degree or topology hypotheses. The flat bundles over the doubled-disk exteriors are genuine holonomy candidates with marked meridians. A geometric Fuchsian exterior model, an umbilic boundary in an entering metric, a cap, positivity of the doubles and energy estimates would require separate constructions.

SHA-256 prefixes identify the 05 manuscript (`556753cbb5f4d73b`), native marking note (`e2f0489e842f2e0c`), native cut note (`636fa201982a211c`), third and fourth slide notes (`afa42bf7e139ac41` and `15027a80860a3a84`), their readers (`eb5872d61d02e984` and `e957a210a45cd6e8`), and the 08 parent manuscript (`ccb52d6a2548fb8f`). Checked primary passages on 27 November 2026 were the published GST §§7–8 and the Scharlemann v3 §7.1 passage linked above. The assigned scope is recorded in [issue revision 1](../research-progress/handoffs/E02_ISSUE_20261127.md). The exterior marking answers the request from [tubes and exteriors](../../03_tubes_and_exteriors/research-progress/handoffs/TO_SLIDE_MARKED_REPRESENTATIONS_20261127.md).
