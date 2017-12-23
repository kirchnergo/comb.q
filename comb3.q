/// Representing and Generating Graphs

// Data Structures

gl:{[n]([v:til n];e:asc each {[n;i](neg i)?til n}[n] each (n?(n div 2)))}
show gl1:gl 20
gl1

gm:{[n] (n,n)#((n*n)?2)}
show gm1:gm 20
gm1

gp:{[n] r:first 1?(n*n div 4); asc {[n;i](-2)?n}[n] each (til r)}
show gp1:gp 20
gp1

gm2l:{[m] `v xkey flip `v`e!(til1 count m; {where 1 =x} each m)}
gm2l gm1

gl2p:{[l] $[0 = count l; 0j$(); flip value flip ungroup l]}
gl2p gl1

gm2p:{[m] gl2p gm2l m}
gm2p gm1

gp2l:{[p] select e by v from (`v xkey flip `v`e!flip p) }
gp2l gp1
all all each gp1 = gl2p gp2l gp1
all first flip select (all each e) from (gl1 = gp2l gl2p gl1)

gl2m:{[n;l] $[0 = count l; (n,n)#0 ; {[l;n;x] r:n#0; w:value l[x]; @[r;w;:;1]}[l;n] each til n]}
gl2m[20;gl1]
value gl1[2]
all first flip select (all each e) from (gl1 = gm2l gl2m[20; gl1])
gl2m[20;(gp2l gp1)]

gp2m:{[n;p] gl2m[n; gp2l p]}
gp2m[20;gp1]

/ Empty Case
show gl2:flip `v`e!(0j$();0j$())
gl2
count gl2
gp2:gl2p gl2
count gp2
gl2m[20;gl2]
gp2m[20;gp2]


// Combining Graphs

// Trees

// Random Graphs

// Relations & Functional Graphs