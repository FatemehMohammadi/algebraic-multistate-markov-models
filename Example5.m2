-- n=3, k=1, 2 states, comparing parametrizations, homogeneous --

S = QQ[pi0, a_00, a_10];
R = QQ[p000, p001, p010, p011, p100, p101, p110, p111];
f = map(S, R, {pi0*a_00*a_00, pi0*a_00*(1-a_00),
	pi0*(1-a_00)*a_10, pi0*(1-a_00)*(1-a_10),
	(1-pi0)*a_10*a_00, (1-pi0)*a_10*(1-a_00),
	(1-pi0)*(1-a_10)*a_10, (1-pi0)*(1-a_10)*(1-a_10)});
I = kernel f; -- the ideal I(\phi(\Theta))


S3 = QQ[pi0, pi1, a_00, a_01, a_10, a_11];
g = map(S3, R, {pi0*a_00*a_00, pi0*a_00*a_01,
	pi0*a_01*a_10, pi0*a_01*a_11,
        pi1*a_10*a_00, pi1*a_10*a_01,
	pi1*a_11*a_10, pi1*a_11*a_11});
J = radical(kernel g+ ideal(p000+p001+p010+p011+p100+p101+p110+p111-1));

I==J
isSubset(J, I)

Igens = flatten entries mingens I;
Jgens = flatten entries mingens J;

for f in Igens list f%J

