// Permutations
permQ:{all p = til count p:asc x}
permQ 3 2 1 0 4 6 5 /1b

permute:{x[y]}
permute[4 3 2 1 0; 4 0 1 3 2] /0 4 3 1 2
permute["abcd"; 0 1 3 2]      /"abdc"

perms1:{[N;l] $[N=1;l;raze .z.s[N-1;l]{x,/:y except x}\:l]}
perms:{[l] perms1[count l; l]}
perms 1 2 3 4
perms "abcd"

fac:{$[x<1;1;x*.z.s x-1]}
fac 20
rankp:{[x] f:(first x); $[count x > 1; r:(1_x); ()]; (f * fac count r) + $[(count x) = 1; 0; .z.s[r - r>f]]}
rankp each (perms til 4)

nthperm1:{[n;k;s;i;pp] n1:n mod fac (i+1); k1:s[n1 div fac i]; s1:s except enlist k1; $[i=0; pp,k1; .z.s[n1;k1;s1;i-1;pp,k1]]}
nthperm:{[n;l] i:count l; nthperm1[n;0;l;i-1;()]}
nthperm[3;til 10]
rankp 0 1 2 3 4 5 6 8 9 7  /3
rankp 0 1 2 3 4 9 8 7 6 5  /119
nthperm[119;til 10]

nextperm:{nthperm[1 + rankp x; asc x]}
nextperm nthperm[3;til 10]
all (til 10) = nextperm reverse til 10

randp:{(neg x)?til x}
randp 10
randp 32
all (til 100) = asc randp 100 /1b

count each group rankp each {(randp 3)} each til 300