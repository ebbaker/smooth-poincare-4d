# E81 · The fibre-preserving Gluck change on the marked prism exterior

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance. Frozen bounded request E81 R1, baseline 72068cef1973d23aee808fe66476c44ed4b99cc5. The handoff requests gpt-6.2-sol/ultra. Actual serving settings are unavailable. Inputs are the [marked prism and puncture](../notes/MARKED_PRISM_17.md), the [normal angle in the round model](../notes/E39_PRISM_FILLINGS.md), and the [quaternionic reversing involution](E71_FIRST_GROUP.md).

**Result.** A smooth self-diffeomorphism of this punctured-prism exterior that maps fibres to fibres cannot induce an odd Gluck change on its boundary. This holds for either orientation of the base circle. The obstruction uses the relative monodromy class, allowing an arbitrary initial diffeomorphism of the punctured fibre. It leaves recognition of the odd filling by arbitrary four-dimensional diffeomorphisms open.

## 1. Frame evaluation on the closed fibre

Use unit quaternions with the round orientation. Write \(Y=S^3/\Gamma\) with \(\Gamma=Q_8\times C_{17}\), \(z=e^{2\pi i/17}\), and \((u,z^r)q=uqz^{-r}\). Left translation frames \(S^3\). A lifted oriented orthonormal frame is a pair \((q,v)\in S^3\times SU(2)\), with rotation \(\operatorname{Ad}_v\) in the left trivialization. The deck action on these pairs is
\[
 (u,z^r,\epsilon)(q,v)=(uqz^{-r},\,\epsilon z^r v),
 \qquad \epsilon\in\{\pm1\}.
\]
Indeed the differential of \(q\mapsto uqz^{-r}\) acts by \(\operatorname{Ad}_{z^r}\) in the left trivialization, and the sign is the twofold spin covering of rotations. Thus
\[
 \pi_1\operatorname{Fr}^{+}(Y)\simeq Q_8\times C_{17}\times C_2,
 \qquad \kappa=(1,1,-1).
\]
Here \(\kappa\) is a full \(2\pi\) frame rotation at a fixed point. In particular the central frame-bundle extension of \(\Gamma\) splits. Positive linear and orthonormal frames have the same homotopy type by Gram–Schmidt orthonormalization.

In the spin isometry convention \((a,c)q=aqc^{-1}\), the full preimage of the deck group is \(\widehat\Gamma=Q_8\times C_{34}\), where \(C_{34}=\langle e^{i\pi/17}\rangle\) on the right. Indeed passing from the preceding split coordinates to these deck coordinates takes \((u,z^r,\epsilon)\) to \((\epsilon u,\epsilon z^r)\). The oriented isometry normalizer lifts to \(2O\times\operatorname{Pin}(2)\) with \(2O=N_{SU(2)}(Q_8)\) on the left and \(\operatorname{Pin}(2)=S_i^1\cup S_i^1 j\) on the right. The left normalizer lifts the rotational signed permutations of the three imaginary coordinate axes. The right normalizer preserves the circle axis up to sign. Quotienting by \(\widehat\Gamma\) gives the oriented isometry group with components \(S_3\times C_2\). An orientation-reversing round isometry lifts to an orientation-reversing orthogonal map of \(S^3\). Composing with quaternion inversion yields an oriented map, so such a normalizer would have to exchange the two spin-factor deck projections up to conjugacy. Their orders are eight and thirty-four, which precludes this.

The identity component consists of right rotations \(q\mapsto q e^{i\theta}\), with least positive period \(\pi/17\) on \(Y\). Along that loop the derivative takes \(v\) to \(e^{-i\theta}v\). Since \(e^{i\pi/17}=-z^{-8}\), the evaluated frame loop represents \((-1,z^8,-1)\) in the split coordinates and \((1,e^{-i\pi/17})\) in the spin coordinates. Its image is the whole right \(C_{34}\) in the latter coordinates. Its projection to \(\Gamma\) also has order 34, so its image contains no nontrivial fixed-point frame rotation. Bamler–Kleiner's generalized Smale theorem applies to the closed round quotient \(Y\). In particular every identity-component diffeomorphism loop has frame evaluation in this same subgroup, and every component of the full diffeomorphism group has an isometric representative. Thus there is also no orientation-reversing fibre diffeomorphism. [Bamler–Kleiner, *Ricci flow and contractibility of spaces of metrics*, Theorem 1.3](https://arxiv.org/pdf/1909.08710)

## 2. Relative mapping classes and the sphere twist

Let \(B\subset Y\) be the cap ball and \(P=Y\setminus\operatorname{int} B\). Restriction to \(B\) gives a fibration with fibre \(\operatorname{Diff}^+(Y\ {\rm rel}\ B)\) over the space of oriented ball embeddings. Evaluation of an embedding at the center with its derivative identifies that base up to weak equivalence with the space of positive linear frames. One can shrink each member of a compact family of embedded balls into an exponential coordinate chart and interpolate its rescaled map to its derivative there. The shrinkage can be chosen uniformly over the family, and small exponential balls give the converse construction. Thus all homotopy groups used here can be computed with frames. A class of diffeomorphisms of \(P\) fixing its boundary can be straightened on a collar before extending by identity across \(B\). Parametric collar straightening gives the same identification for relative isotopies. [Palais, *Local Triviality of the Restriction Map for Embeddings*, Theorem B and §5](https://www.e-periodica.ch/cntmng?pid=com-001%3A1960%3A34%3A%3A24)

There is a corresponding exact sequence of evaluation and relative classes
\[
 \pi_1\operatorname{Diff}^+(Y)\ \longrightarrow\
 \pi_1\operatorname{Fr}^{+}(Y)\ \xrightarrow{\partial}\
 \pi_0\operatorname{Diff}^+(P\ {\rm rel}\ \partial P)\
 \longrightarrow\ \pi_0\operatorname{Diff}^+(Y)\ \longrightarrow\ 1 .
\]
The kernel of capping is \(Q_8\), because the evaluated loop group is the right \(C_{34}\) upstairs. The class \(T=\partial\kappa\) is its central element \(-1\) of order two. To see the collar description of \(T\), rotate the cap ball in a full loop and taper its ambient extension in the collar of \(P\). At the end the ball is fixed and the collar has a sphere twist. The choice of connecting-map sign is immaterial for this order-two class.

The group structure on the entire relative mapping class group can also be computed. Form the topological group of pairs consisting of a diffeomorphism of \(Y\) and a lift of its action on the full positive linear frame bundle to the universal frame cover. A lift is specified by the image of one reference lifted frame. The group is therefore the pullback of the universal frame cover under evaluation, as a space. A diffeomorphism fixing \(B\) has a distinguished lift fixing the reference lifted frame. This is multiplicative and induces an isomorphism on path components. In fact, the pullback using the universal cover of the ball-embedding space has the same components by the frame evaluation equivalence, and restriction over that simply connected base identifies its components with those of the fibre. Passing from diffeomorphisms to isometries also gives an isomorphism on components of the lifted groups by the generalized Smale theorem and covering-space lifting. Over isometries the lift group is precisely \(2O\times\operatorname{Pin}(2)\), acting on lifted round frames. The full linear frame lift is determined by its restriction to orthonormal frames in this isometric case. We obtain
\[
 \pi_0\operatorname{Diff}^+(P\ {\rm rel}\ \partial P)
 \simeq 2O\times C_2,\qquad
 T\longleftrightarrow(-1,+1).
\]
Capping quotients by \(Q_8\times\{+1\}\). In these conventions a sphere twist is therefore detected even though it becomes isotopic to the identity after capping.

## 3. The obstruction for a family of fibre diffeomorphisms

Use the suspension convention \((t+1,q)\sim(t,Jq)\) with \(J(q)=bqj^{-1}\) and \(b=(1+i+j+k)/2\). In a product boundary framing write \(\phi\) for the resulting monodromy on \(P\), taken to fix a collar. The cap-ball correction is an ambient isotopy of \(Y\), so the capped component of \(\phi\) is that of \(J\). It is a three-cycle in \(S_3\) and odd in the right \(C_2\). The left component of the relative lift thus lies in \(Q_8 b\). All elements of \(Q_8 b\) have real part \(1/2\) or \(-1/2\), by direct multiplication by the eight quaternion units. Reversing the convention uses the inverse coset, with the same real-part property.

A bundle self-map covering an orientation-preserving map of the base can first be reduced to covering the identity. In suspension coordinates an increasing lift of the base map gives the bundle map obtained by reparametrizing time. On the product boundary it only changes the circle coordinate and extends over \(D^2\times S^2\). The remaining bundle map can be written as \(F_t\in\operatorname{Diff}^+(P)\) on the unit interval, with
\[
 F_1=\phi^{-1}F_0\phi .
\]
Its boundary restriction is a loop in \(\operatorname{Diff}^{+}(S^2)\). Normalize \(F_0|_{\partial P}\) to the identity by composing with a constant collar-supported map, obtained by interpolating that boundary diffeomorphism to the identity in depth. This map commutes with \(\phi\) and its boundary action extends over the cap. The loop gives the odd Gluck boundary change exactly when it is the generator of \(\pi_1\operatorname{Diff}^{+}(S^2)=C_2\). The generator is the usual full rotation by Smale's theorem. [Smale, *Diffeomorphisms of the 2-Sphere*, Theorem A](https://www.jstor.org/stable/2033664)

Extend the normalized boundary loop to a collar isotopy \(g_t\), starting at the identity. For an odd loop the relative class of \(g_1\) is \(T\), by the preceding rotation calculation and isotopy extension for a homotopy of loops. The family \(g_t^{-1}F_t\) is a relative isotopy. Its endpoints would give
\[
 [\phi^{-1}F_0\phi F_0^{-1}]=T .
\]
In the left \(2O\) factor this would conjugate the left component of \(\phi\) to its negative. Quaternionic conjugation preserves the real part, so this is impossible. The contradiction allows any relative component for \(F_0\).

The same obstruction follows using only the kernel and the capped group from the exact sequence. The centralizer of the capped class \((3\text{-cycle},-1)\) in \(S_3\times C_2\) is generated by that class, which has order six. The projected commutator condition thus permits replacing \([F_0]\) by its product with an inverse power of \([\phi]\), leaving the commutator unchanged and putting \([F_0]\) in the \(Q_8\) kernel. Conjugation by \([\phi]\) cycles the three nonzero elements of \(Q_8/\{\pm1\}\), since its capped left class is the indicated three-cycle. A commutator equal to the central \(T\) then forces \([F_0]\) into \(\{\pm1\}\), which commutes with \([\phi]\). The commutator is consequently the identity.

## 4. Reversal of the actual base and boundary parity

Use the same prism lift with \(n=(i+j+k)/\sqrt3\) and take \(p\) with \(p j p^{-1}=n\) and \(p i p^{-1}=A=(i-j)/\sqrt2\). Set \(d=\pi/6\). The section is \(c(t)=pe^{jdt}\), and \(J c(t+1)=c(t)\). The local transvection is
\[
 T_\theta(q)=p e^{j\theta/2}p^{-1}q e^{j\theta/2}.
\]
Let \(R_j(\eta)\) denote rotation about \(j\) through angle \(\eta\) in the tangent coordinates based at \(p\). In \(p\)-coordinates \(J\) acts by left \(e^{j\pi/3}\) and right \(e^{-j\pi/2}\). Hence \(JT_d\) fixes \(p\) and has derivative \(R_j(5\pi/6)\). The framing
\[
 S_t=dT_{dt}|_p\, R_j(-5\pi t/6)
\]
therefore satisfies \(dJ\,S_{t+1}=S_t\). Round exponential charts in these frames provide a periodic framed tube and an identity collar for the puncture monodromy.

The lifted monodromy in this specific frame is also determined. Locally the moving charts apply the rotation \(R_j(-5\pi t/6)\) in the source coordinates followed by the transvection \(T_{dt}\). In spin factors this path is
\[
 L_t=\bigl(p e^{-j\pi t/3}p^{-1},\,e^{-j\pi t/2}\bigr),\qquad L_0=1,\quad L_1=(b^{-1},j^{-1}).
\]
Extend the moving charts to an ambient isotopy \(\Psi_t\) on \(Y\). Evaluation on the reference frame of the lifted isotopy follows \(L_t\), because the two families agree near \(p\). The monodromy \(\phi=J\Psi_1\) has a lift fixing that reference lifted frame obtained by composing the path lift of \(\Psi_1\) with \((b,j)\). The path lift lies in the identity component of the lift group, so the relative class of \(\phi\) is exactly \((b,-1)\) for this framing. Changing the framing by an odd loop multiplies the relative class by \(T\).

The map \(I(q)=Aqi^{-1}\) normalizes \(\Gamma\) and has \(IJI^{-1}=J^{-1}\). Indeed \(A\) acts by a signed permutation on the left quaternion generators and \(A b A^{-1}=b^{-1}\), while \(i\) fixes the right cyclic axis and conjugates \(j\) to \(-j\). In the local charts \(I\) fixes \(p\), sends \(c(t)\) to \(c(-t)\), and conjugates \(T_\theta\) to \(T_{-\theta}\). Its derivative at \(p\) is \(R_i(\pi)\) in the chosen tangent coordinates. That rotation conjugates \(R_j(\eta)\) to \(R_j(-\eta)\). Thus the complete frame calculation gives
\[
 dI\, S_t=S_{-t}R_i(\pi).
\]
It follows that \((t,q)\mapsto(-t,Iq)\) is a smooth reversing self-map of the actual exterior. Its boundary map reverses the circle and applies a constant sphere rotation. This extends over \(D^2\times S^2\) by complex conjugation of the disk and the same rotation. Composing any base-reversing bundle comparison with this one reduces to §3. Time reversal inverts the boundary loop class, which leaves its \(C_2\) parity unchanged.

The odd boundary class also interchanges the two spin structures on \(S^1\times S^2\). At a pole on the rotation axis the \(S^1\) is fixed and the tangent two-plane of the sphere rotates once, so the derivative along that circle has a nonclosed spin lift. The product cap has \(H^1(D^2\times S^2;\mathbb Z/2)=0\) and a unique spin structure. An extendible boundary map must preserve its boundary spin structure. This identifies the parity obstruction independently of simultaneous relabelling of the two framings.

The identity-component frame calculation excludes a diffeomorphism loop of the closed fibre that performs just the full normal rotation at a fixed cap center. The relative monodromy calculation excludes the broader family of twisted paths on the punctured bundle, even though their initial and terminal maps need only be conjugate by monodromy. Neither calculation constrains an arbitrary diffeomorphism of the filled four-manifold that does not preserve this exterior and fibration.
