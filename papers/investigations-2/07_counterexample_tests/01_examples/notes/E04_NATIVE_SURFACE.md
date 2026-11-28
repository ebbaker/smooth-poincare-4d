# WEX-E04 · A disk through two sections of the first cap

28 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Frozen E04 revision 1 at checkout `e171829f1c59a8a1fc66a2f1bd7ff42b2037aa6b`. The request designates GPT-6.2 Sol / ultra. The executing helper's exact serving variant and effort are unavailable. This is a working smooth construction for the one original outward-oriented minus Miller–Schupp presentation sphere \(\Sigma_P\) in its specified puncture. It uses the given mark, and requires neither a metric nor a chirality choice. [Frozen request](../research-progress/handoffs/REQUEST_E04_R1.md) · [B02](../brainstorm/notes/B02_SURFACE_TEMPLATE.md) · [WEX-E02](E02_PUNCTURE_INPUT.md)

The constructed proper disk meets the first cap in \(D^2\times\{n(1/32),n(-1/32)\}\), with opposite signs against its oriented sphere fiber. Its marked boundary is the crossing-free circle
\[
 J(\alpha)=\left(-\frac{\sqrt{55}}8\cos\alpha,\ \frac{\sqrt{55}}8\sin\alpha,\ \frac38,\ 0\right),
 \qquad \alpha\in\mathbb R/2\pi\mathbb Z
\]
with increasing \(\alpha\). In particular the native genus upper bound for this marked unknot is zero.

## Fixed pieces and core arc

Use the oriented pole chart \(\chi(y)\) with \(y=(X,Y,y_3,y_4)\), \(\rho=|y|\), and sphere-point component \(\cos \nu\,e_3+\operatorname{sinc}(\nu)(y_3,y_4,0)\) for \(\nu=\sqrt{y_3^2+y_4^2}\). The removed ball is \(\chi(\rho\le r)\) for \(r=1/16\), and \(W=\Sigma_P\setminus\chi(\rho<r)\). The outward boundary mark is \(u\mapsto\chi(rR(u))\), with \(R(u)=(-u_1,u_2,u_3,u_4)\). It preserves orientation from the standard outward \(S^3\) because \(W\) has outward normal toward decreasing \(\rho\). Write \(\phi\) for the polar angle measured from the north pole, and \(\theta\) for the longitude with local real lift near zero. In these variables the physical sphere point is \(P(\phi,\theta)=(\sin\phi\cos\theta,\sin\phi\sin\theta,\cos\phi)\). [POLE B04, specimen](../../../01_chiral_transfer_and_pole_forms/brainstorm/notes/B04_MARKED_PILOT_20261127.md#the-specimen) · [POLE E07, marked chart](../../../01_chiral_transfer_and_pole_forms/notes/E07_MARKED_ATLAS.md#4-marked-chart-and-compact-cover)

Let \(A\) be the first-cap ball. Put \(s_0=1/16\), \(v_0=1/32\), \(\epsilon=1/16\), \(\lambda=\epsilon(1+s_0)=17/256\), \(\phi_1=\pi/3\), and \(n(v)=(\sin v,0,-\cos v)\). Parametrize \(A\) by \((\zeta,v)\) with \(|\zeta|\le1+s_0\) and \(|v|\le v_0\). At \(|\zeta|\le1\) use \((\zeta,n(v))\in C_1\). At \(\zeta=(1+s)m(t)\) with \(s\ge0\) use
\[
 \Phi_1(t,(1+s)n(v))=
 \left(c_1(t)+\epsilon(1+s)(\sin v,0),\
 P\big(\phi_1-\epsilon(1+s)\cos v,2\pi t\big)\right).
\]
In the original signed chart the equation is \(n=n(v)\) on both sides of \(s=0\). The common seam map and inverse retain \(t,n\), so the pieces glue smoothly. The cap-center parametrization is Cartesian in \(\zeta\). Injectivity follows from that of the cap and the exterior tube chart, whose inverse recovers \(t=\theta/(2\pi)\) modulo one and \(w=\epsilon^{-1}(q-c_1(t),\phi-\phi_1)\), then \(s=|w|-1\), \(n=w/|w|\). Use the untouched original attachment and inverse on the second component. Give \(A\) the orientation of its disk followed by \(dv\), locally \(ds\wedge dt\wedge dv\) up to a positive factor. [CERT E06, attachment and inverse](../../../05_certificates/notes/E06_PRESENTATION_HANDLES.md#framed-handles-and-the-two-collar-identifications) · [POLE E07, signed coordinates](../../../01_chiral_transfer_and_pole_forms/notes/E07_MARKED_ATLAS.md#2-cartesian-caps-and-signed-seams)

Let \(B\) be the local 3-ball \(y_4=0\), \(X^2+Y^2+(y_3-a)^2\le a^2\), with \(a=1/12\). Give \(B\) the orientation \(dX\wedge dY\wedge dy_3\). Its northern tip is \(y_3=2a\) and the ball lies in \(\rho\le2a<1/4\). The exterior part of \(A\) has \(\phi\ge\phi_1-\lambda>2a\), so the balls are disjoint. The prescribed core arc is \(q=0,\theta=0,\ 2a\le\phi\le\phi_1-\lambda\), traveling from \(B\) to \(A\). The cap endpoint is \(s=s_0,t=v=0\) because the original planar path satisfies \(c_1(0)=0\).

## A handle with explicit endpoint frames

Use physical variables \((X,Y,\phi,\theta)\) on the sphere face around the core. Set \(x=X\) and \(\eta=Y-c_{1Y}(\theta/2\pi)\). In the following chart the two endpoint faces are graphs over different coordinate planes. Define
\[
 b(x,\eta)=a+\sqrt{a^2-x^2-\eta^2},\qquad
 d(x,\theta)=\phi_1-\sqrt{\lambda^2-(x-c_{1X}(\theta/2\pi))^2}.
\]
Use \(|x|,|\eta|,|\theta|<1/1024\), \(-1/1024<h<1+1/1024\), and set
\[
 G(h,x,\eta,\theta)=\left(
 x,\ \eta+c_{1Y}(\theta/2\pi),\
 b(x,\eta)+h\big(d(x,\theta)-b(x,\eta)\big),\
 \theta\right)
\]
in physical coordinates. All quantities are evaluated in the original smooth circle lift. Here \(0<d-b<1\). In fact \(|c_1(\theta/2\pi)|<1/4096\) on this interval. The normalized slot parameter is within \(1/512\) of an endpoint, and the flat step has \(\min(H,1-H)\le e^{-510}\) there. Each of the two original unit-radius circles satisfies \(|L_j(u)|=2|\sin(\pi u)|\), which gives the bound. Thus \(|x-c_{1X}|<1/512\), \(b\le2a<\phi_1-\lambda\le d\), and \(d\le\phi_1-\lambda+1/512<1-1/1024\). The chart is invertible by reading \(x,\theta,\eta\) and then \(h=(\phi-b)/(d-b)\).

Choose the flat turning function \(\beta(h)=(\pi/2)H(2h-1/2)\), extending the original \(H\) by zero to the left and one to the right. The embedded 3-dimensional 1-handle is
\[
 (h,x,z)\longmapsto G\big(h,x,z\cos\beta(h),z\sin\beta(h)\big),
 \qquad 0\le h\le1,\qquad x^2+z^2\le (1/4096)^2 .
\]
The chart inverse followed by \(z=\eta\cos\beta(h)+\theta\sin\beta(h)\) recovers the parameters. Its \(x,z\) differential is injective and the \(h\)-coordinate is preserved. At the core \(x=z=0\) it follows the prescribed arc with increasing \(\phi\). Near \(h=0\) its transverse planes have \(\theta=0\) and at \(h=0\) the disk is on \(\phi=b(x,\eta)\), the northern sheet of \(\partial B\). Near \(h=1\) the planes have \(\eta=0\) and at \(h=1\) the disk is on \(\phi=d(x,\theta)\), the side \(s=s_0\) of \(A\). At the two center points the transverse frames in physical coordinates are \((\partial_X,\partial_Y)\) and \((\partial_X,\partial_\theta)\), respectively. The second equality uses \(c_1'(0)=0\). The nonconstant \(c_1\) corrections in \(G\) match the entire end disk.

Here are the disjointness checks. In the whole auxiliary handle chart \(\phi>a>r\) and \(\phi<1\), with \(|q|<1/256\). The pole coordinate norm, where in its chart, satisfies \(\rho\ge\phi\), since the spherical distance from the north pole equals \(\phi\). The second enlarged tube begins at \(\phi=2\pi/3-5/64>1\). There are no original side or rounded faces in this chart because \(q\) stays more than \(1/2\) from \(\partial F\) and the chart stays on the sphere face. Where \(\theta=0\), membership in \(B\) requires \(\phi\le b(x,\eta)\), hence \(h\le0\). At \(\theta\ne0\) the chart has \(y_4\ne0\) if it is in the pole chart. For the first tube, whenever \(h<1\) one has \(\phi<d\), hence
\[
  (x-c_{1X})^2+(\phi-\phi_1)^2>\lambda^2 .
\]
This clears even radius \(1+s_0\) in \(w\), regardless of \(\eta\). At \(h=1,\eta=0\) the inequality is an equality, and \(|v|<v_0\). In the slightly extended end chart \(1\le h<1+1/1024\), the two-coordinate norm on the left before squaring exceeds \(\lambda-1/1024=67/1024>\epsilon\). There \(|(x-c_{1X})/(\epsilon(1+s))|<2/67<\sin v_0\) when \(\eta=0\). The cap ball is consequently on the side \(h\ge1,\eta=0\) near that attaching disk, with \(s>3/64\). The handle meets each ball precisely in its attaching disk and avoids the two removed unit tubes. Its terminal segment passes through the auxiliary radius-\(5/4\) first-tube chart, which includes these retained exterior points. The core enters that chart at \(\phi=\phi_1-5/64\), strictly before the endpoint \(\phi_1-17/256\). If tube clearance is imposed for that entire auxiliary chart, the prescribed arc itself fails that stronger condition.

The handle orientation \(dh\wedge dx\wedge dz\) agrees with both 3-ball orientations in their shared endpoint slices. At \(B\) the pullback of \(dX\wedge dY\wedge dy_3\) in the slice is \((d-b)\,dh\wedge dx\wedge dz\). At the \(A\) center \(s_h=-(d-b)/\epsilon<0\), \(t_z=1/(2\pi)>0\), and \(v_x=1/\lambda>0\). The pullback of \(ds\wedge dt\wedge dv\) has sign \(-s_h t_z v_x>0\) in order \((h,x,z)\). The common slice coordinate change is nonsingular on a neighborhood of the disk, since there it is exactly the change to the original tube polar coordinates on \(n_2=0,n_3<0\). Its sign is constant on that connected neighborhood. These extensions through each endpoint provide compatible outward collar gluing and a single orientation on the union.

## Rounding and the puncture

Each attachment rim lies in a common smooth 3-dimensional slice because \(\beta\) is constant near the ends. In that slice let \(t'\) be the parameter toward the handle (\(h\) or \(1-h\)), and \(u=\sqrt{x^2+z^2}-1/4096\) near the rim. In \((t',u)\) the joined region is \(\{t'\le0\}\cup\{u\le0\}\). The rotated coordinates \(p'=(t'-u)/\sqrt2\), \(q'=(t'+u)/\sqrt2\) describe its boundary by \(q'=|p'|\). Replace the absolute value by its convolution with a smooth even probability bump supported on \((-\omega,\omega)\), taking \(\omega=(1/4096)/64\). This is a smooth graph equal to \(|p'|\) for \(|p'|\ge\omega\). Where the region changes, \(|t'|,|u|\le3\omega/\sqrt2\), inside the common slice chart and all the preceding clearance margins. At the cap rim this gives \(|x|<5/16384\) and hence \(|v|<1/64\) by the same bound on \(|x-c_{1X}|/(\epsilon(1+s))\). The remaining original corners of \(A\) are \(s=s_0,v=\pm v_0\). Near each one the local region is the intersection of two negative half-planes. Use the negative of the same rounded absolute value for its right-angle graph. The supports can be taken within \(|s-s_0|,|\pm v-v_0|<1/1024\), disjoint from the cap seam, the rim roundings and the puncture. The actual sections in \(C_1\) therefore stay fixed.

The oriented boundary of the rounded union is a smooth embedded sphere. Topologically it is the two sphere boundaries of the 3-balls with one open disk deleted from each, joined by the annulus on the side of the handle. The local graph roundings preserve that description and occur away from the puncture. The sphere meets the first cap in the full two sections at \(v=\pm v_0\). Against the fiber \(\{0\}\times S^2\subset C_1\) with its standard sphere orientation, they are transverse with signs \(+1\) at \(+v_0\) and \(-1\) at \(-v_0\). Indeed outward-first on \(A\) gives the disk orientation at \(+v_0\) and its reverse at \(-v_0\), and the ambient cap orientation is disk followed by sphere. The sphere misses the second cap.

Only the unchanged local sphere \(\partial B\) meets \(\rho=r\). Its equations there come from \(y_4=0\) and \(\rho^2=2ay_3\). For \(0<\rho<2a\), a parametrization near the puncture is
\[
 y=\rho\left(
  \sqrt{1-(\rho/2a)^2}\cos\alpha,
  \sqrt{1-(\rho/2a)^2}\sin\alpha,
  \rho/(2a),\ 0\right).
\]
Thus \(\partial B\cap\{\rho\le r\}\) is a closed disk, and \(\rho\) is a submersion on the sphere near its boundary circle. To determine orientation, write \(y_3=a-a\cos\gamma\), \((X,Y)=a\sin\gamma(\cos\alpha,\sin\alpha)\), so \(\rho=2a\sin(\gamma/2)\). In the ordered \((X,Y,y_3)\) space the determinant of the outward radius vector of \(B\), \(\partial_\gamma\) and \(\partial_\alpha\) is \(-a^3\sin\gamma\). The sphere orientation near \(\rho=r\) is therefore \(-d\rho\wedge d\alpha\), up to a positive factor. The outward direction for the remaining surface at its puncture is \(-\partial_\rho\), giving increasing \(\alpha\) on its boundary. Applying \(R^{-1}=R\) to the unit vector \(y/r\) gives the stated \(J\). In stereographic coordinates from \(u=(0,0,0,1)\) it is a circle in the plane \(u_3=3/8\), with clockwise projection to \((u_1,u_2)\).

Use the following angular chart near this circle to straighten the collar before applying \(R\).
\[
 \frac{y}{\rho}
  =\big(\sqrt{1-\xi^2}\cos\psi\cos\alpha,
         \sqrt{1-\xi^2}\cos\psi\sin\alpha,
         \sqrt{1-\xi^2}\sin\psi,\ \xi\big).
\]
The sphere has \(\xi=0\), \(\psi=\psi_*(\rho)=\arcsin(\rho/2a)\). Use the angular flow of a smooth cutoff times \(\partial_\psi\), with the cutoff equal to one on \(\xi=0\) for all latitudes between \(\psi_*(r-1/128)\) and \(\psi_*(r+1/128)\), and supported inside this angular coordinate band enlarged slightly on both sides. At radius \(\rho\), take flow time
\[
  f(\rho)\big(\psi_*(r)-\psi_*(\rho)\big),
\]
where \(f=1\) near \(r\) and has support in \(|\rho-r|<1/128\). Use the identity outside the support. This defines a smooth ambient diffeomorphism preserving \(\rho\) and fixing the marked puncture sphere pointwise. It turns the surface into the radial product over the exact circle for \(\rho\ge r\) near \(r\), and leaves the cap sections and all rim roundings away from this annulus. The resulting surface in \(W\) is the boundary sphere with the interior of the coordinate disk removed. It is a connected smooth proper disk, with the boundary orientation and collar above.

## Inspectability

The equations for the core, endpoints, full handle and collar straightening give the smooth joins and clearances in the original coordinate data. Source SHA-256 prefixes are R1 `13956a9a2b9ce9e0`, B02 `6b980a4cac4311d6`, WEX-E02 `f1e6e75d0af37e82`, CERT E06 `0718114604f51a00`, its [ordered JSON](../../../05_certificates/numerics/e06_handles.json) `f898a23925988690`, [CERT E09](../../../05_certificates/reviews/E09_FORMAT_HANDLE_REPLAY.md) `abeae6b620db0bfc`, POLE B04 `d87dc4f71886074e` and POLE E07 `ea60a02278bd296a`. This packet verifies the local and exterior geometry directly in those marked inputs. The construction and orientations await non-author replay.
