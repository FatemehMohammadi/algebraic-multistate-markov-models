R =  QQ[p0000,p0001,p0002,p0011,p0012,p0022,p0111,
    p0112,p0122,p0222,p1111,p1112,p1122,p1222];

M = transpose matrix {{1,0,3,0,0,0,0,0},{1,0,2,1,0,0,0,0},{1,0,2,0,1,0,0,0},{1,0,1,1,0,1,0,0},
    {1,0,1,1,0,0,1,0},{1,0,1,0,1,0,0,1},{1,0,0,1,0,2,0,0},{1,0,0,1,0,1,1,0},
    {1,0,0,1,0,0,1,1},{1,0,0,0,1,0,0,2},{0,1,0,0,0,3,0,0},{0,1,0,0,0,2,1,0},{0,1,0,0,0,1,1,1},{0,1,0,0,0,0,1,2}}
ker M
B = toricMarkov M
I = toBinomial(B,R)

u = transpose matrix {{140,59,25,82,30,61,114,48,54,92,137,53,60,45}}
p = transpose vars R
likelihoodIdeal = I + ideal(M*u-1000*M*p)
degree likelihoodIdeal
dim likelihoodIdeal

transpose gens likelihoodIdeal
