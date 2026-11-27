"""Exact crossings and Alexander minors for the fixed E68 surgery diagram."""

from fractions import Fraction as Q
from itertools import combinations

def square(radius):
    return [(radius,-radius,0),(radius,radius,0),(-radius,radius,0),(-radius,-radius,0)]

def components():
    # B runs upward through the disks of the two counterclockwise squares.
    # In the straight part of the solid torus, base and height coordinates
    # (x, y, h) map to the positively oriented chart (6+x, h, -y).
    outer=[(0,0,-10),(0,0,10),(0,-12,10),(0,-12,-10)]
    base=[(0,0),(1,1),(2,0),(1,-1),(0,0),(-1,1),(-2,0),(-1,-1)]
    heights=[0,1,2,3,4,3,2,1]
    knot=[(6+x,Q(height,8),-y) for (x,y),height in zip(base,heights)]
    return [outer,square(7),square(5),knot]

def det(a,b):
    return a[0]*b[1]-a[1]*b[0]

def crossing_diagram(links, shear):
    a,b=shear
    names=[]
    for comp, points in enumerate(links):
        for j,p in enumerate(points):
            q=points[(j+1)%len(points)]
            projected=(p[0]+a*p[2],p[1]+b*p[2],p[2])
            target=(q[0]+a*q[2],q[1]+b*q[2],q[2])
            names.append((comp,j,projected,tuple(y-x for x,y in zip(projected,target))))
    records=[]
    for (i,m,p,v),(j,n,q,w) in combinations(names,2):
        if i==j and (m-n)%len(links[i]) in (1,len(links[i])-1):
            continue
        d=det(v,w)
        delta=tuple(y-x for x,y in zip(p,q))
        if not d:
            if not det(delta,v):
                coord=0 if v[0] else 1
                pvals=sorted([p[coord],p[coord]+v[coord]])
                qvals=sorted([q[coord],q[coord]+w[coord]])
                if min(pvals[1],qvals[1])>=max(pvals[0],qvals[0]):
                    raise ValueError("projected overlap")
            continue
        t=det(delta,w)/d
        u=det(delta,v)/d
        if not (0<=t<=1 and 0<=u<=1):
            continue
        if t in (0,1) or u in (0,1):
            raise ValueError("projection hits vertex")
        hp=p[2]+t*v[2]
        hq=q[2]+u*w[2]
        if hp==hq:
            raise ValueError("spatial intersection")
        sign=1 if d>0 else -1
        first=(i,m+t)
        second=(j,n+u)
        if hp>hq:
            records.append((first,second,sign))
        else:
            records.append((second,first,-sign))
    if len({(point[0],point[1]) for crossing in records for point in crossing[:2]})!=2*len(records):
        raise ValueError("higher crossing")
    return records

def presentation(cs):
    from bisect import bisect_right
    component_words = [[] for _ in range(4)]
    rels=[]
    meridians=[]
    arc_for_comp=[]
    offset=0
    for comp in range(4):
        uc=sorted(p for _,(j,p),_ in cs if j==comp)
        arc_for_comp.append((uc,offset))
        meridians.append(offset+1)
        offset+=len(uc)
    for comp in range(4):
        current=[]
        writhe=0
        for (oi,ox),(ui,ux),sgn in sorted(cs,key=lambda item:item[1]):
            if ui!=comp:
                continue
            holes,shift=arc_for_comp[oi]
            jover=shift+bisect_right(holes,ox)%len(holes)+1
            holes,shift=arc_for_comp[ui]
            before=shift+holes.index(ux)+1
            after=shift+(holes.index(ux)+1)%len(holes)+1
            assert after==before+1 or after==meridians[ui]
            # Positive over-under determinant gives the positive factor
            # in the based longitude and inverse conjugation of the meridian.
            rels.append([-jover*sgn,before,jover*sgn,-after])
            current.append(jover*sgn)
            if ui==oi:
                writhe+=sgn
        if writhe:
            current.extend([-meridians[comp]*(1 if writhe>0 else -1)]*abs(writhe))
        component_words[comp]=current
    return meridians,component_words,rels

def inverse(w):
    return [-x for x in reversed(w)]

def reduced_presentation(cs):
    ms,ls,rs=presentation(cs)
    # A relation ending in the inverse of a new generator solves for that generator.
    selected=[6,2,0,4,7]
    replacements={}
    def subst(word):
        ans=[]
        for x in word:
            rep=replacements.get(abs(x),[abs(x)])
            for y in rep if x>0 else inverse(rep):
                if ans and ans[-1]==-y:
                    ans.pop()
                else:
                    ans.append(y)
        return ans
    for row in selected:
        relation=rs[row]
        assert relation[-1]<0 and -relation[-1] not in map(abs,relation[:-1])
        replacements[-relation[-1]]=subst(relation[:-1])
    reduced=[subst(r) for idx,r in enumerate(rs) if idx not in selected]
    for m,l,p in zip(ms[:3],ls[:3],[2,-2,-2]):
        reduced.append(subst([m]*3+(l if p>0 else inverse(l))*abs(p)))
    return reduced

def add(f,g):
    a=f.copy()
    for k,c in g.items():
        a[k]=a.get(k,0)+c
        if not a[k]:
            del a[k]
    return a

def scale(f,c):
    return {k:b*c for k,b in f.items() if b*c}

def mul(f,g):
    a={}
    for j,c in f.items():
        a=add(a,{j+k:c*d for k,d in g.items()})
    return a

def det3(rows):
    from itertools import permutations
    ans={}
    for p in permutations(range(3)):
        inversions=sum(p[j]>p[k] for j in range(3) for k in range(j+1,3))
        prod=mul(mul(rows[0][p[0]],rows[1][p[1]]),rows[2][p[2]])
        ans=add(ans,scale(prod,(-1)**inversions))
    return ans

def derivative(word, exponent, columns):
    row=[{} for _ in columns]
    prefix=0
    for x in word:
        n=exponent[abs(x)]
        if x<0:
            prefix-=n
        if abs(x) in columns:
            col=columns.index(abs(x))
            row[col]=add(row[col],{prefix:1 if x>0 else -1})
        if x>0:
            prefix+=n
    assert prefix==0
    return row

def monic(f):
    return scale(f,Q(1,f[max(f)])) if f else {}

def remainder(f,g):
    high=max(g)
    f=f.copy()
    while f and max(f)>=high:
        k=max(f)
        f=add(f,{j+k-high:-a*Q(f[k], g[high]) for j,a in g.items()})
    return f

def pgcd(f,g):
    while g:
        f,g=g,remainder(f,g)
    return monic(f)

def quotient(f,g):
    high=max(g)
    f=f.copy()
    ans={}
    while f and max(f)>=high:
        k=max(f)
        coef=Q(f[k],g[high])
        ans[k-high]=coef
        f=add(f,{j+k-high:-a*coef for j,a in g.items()})
    assert not f
    return ans

def maximal_minor_gcd(rows):
    from math import gcd, lcm
    rational_gcd={}
    content=0
    triples = list(combinations(range(len(rows[0])), 3))
    for indices in combinations(range(len(rows)),3):
        for columns in triples:
            minor=det3([[rows[i][j] for j in columns] for i in indices])
            if not minor:
                continue
            initial=min(minor)
            content=gcd(content,*minor.values())
            rational_gcd=pgcd(rational_gcd,{j-initial:a for j,a in minor.items()})
    denom=lcm(*(d.denominator for d in rational_gcd.values()))
    coefficients={i:int(a*denom)*content for i,a in rational_gcd.items()}
    return content,rational_gcd,coefficients

def alexander(cs):
    exponents={1:0,3:-2,5:2,7:3}
    rels=reduced_presentation(cs)
    rows=[derivative(r,exponents,[1,3,5,7]) for r in rels]
    boundary=[add({exponent:1},{0:-1}) for exponent in exponents.values()]
    for row in rows:
        total={}
        for entry, factor in zip(row,boundary):
            total=add(total,mul(entry,factor))
        assert not total
    _,_,polynomial=maximal_minor_gcd(rows)
    content,minor_gcd,_=maximal_minor_gcd([row[:3] for row in rows])
    assert quotient(minor_gcd,{0:1,1:1,2:1}) == monic(polynomial)
    return content,minor_gcd,polynomial

def main():
    crossings = crossing_diagram(components(), (Q(1,3), Q(1,7)))
    assert len(crossings) == 9
    counts = [[0]*4 for _ in range(4)]
    for (over,_),(under,_),sign in crossings:
        counts[over][under] += sign
    assert counts == [[0,1,1,0],[1,0,0,-1],[1,0,0,1],[0,-1,1,-1]]
    meridians, longitudes, _ = presentation(crossings)
    assert meridians == [1,3,5,7]
    assert longitudes == [[4,6],[-8,1],[7,1],[-3,6,-7,7]]
    content, minor_gcd, polynomial = alexander(crossings)
    assert content == 1
    assert minor_gcd == {0:1,1:Q(12,5),2:Q(17,5),3:Q(12,5),4:1}
    assert polynomial == {0:5,1:7,2:5}
    for i, entry in enumerate(crossings, start=1):
        print("Crossing", i, entry)
    print("Alexander polynomial centered at zero: 5/t + 7 + 5*t")


if __name__ == "__main__":
    main()
