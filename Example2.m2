-- reversible model, n=4, k=1, 3 states, non-homogeneous --

L ={{0, 0, 0, 0}, {0, 0, 0, 1}, {0, 0, 0, 2}, {0, 0, 1, 0}, {0, 0, 1, 1},
    {0, 0, 1, 2}, {0, 0, 2, 2}, {0, 1, 0, 0}, {0, 1, 0, 1}, {0, 1, 0, 2},
    {0, 1, 1, 0}, {0, 1, 1, 1}, {0, 1, 1, 2}, {0, 1, 2, 2}, {0, 2, 2, 2},
    {1, 0, 0, 0}, {1, 0, 0, 1}, {1, 0, 0, 2}, {1, 0, 1, 0}, {1, 0, 1, 1},
    {1, 0, 1, 2}, {1, 0, 2, 2}, {1, 1, 0, 0}, {1, 1, 0, 1}, {1, 1, 0, 2},
    {1, 1, 1, 0}, {1, 1, 1, 1}, {1, 1, 1, 2}, {1, 1, 2, 2}, {1, 2, 2, 2},
    {2, 2, 2, 2}} -- list of all possible paths
S = QQ[q_0, q_1,q_2, a_(0,0), a_(0,1),a_(1, 0), a_(0,2),a_(1,2), a_(1,1), a_(2,2),
    b_(0,0), b_(0,1),b_(1, 0), b_(0,2),b_(1,2), b_(1,1), b_(2,2),
    c_(0,0), c_(0,1),c_(1, 0), c_(0,2),c_(1,2), c_(1,1), c_(2,2)];
var = for v in L list p_v;
R = QQ[var];

f = (i,j,k,l) -> q_i*a_(i, j)*b_(j,k)*c_(k, l);
images = for v in L list f(toSequence(v));
g = map(S, R, images);
I = kernel g;
gens gb I


-- reversible model, n=4, k=1, 3 states, homogeneous --

S = QQ[q_0, q_1,q_2, a_(0,0), a_(0,1),a_(1, 0), a_(0,2),a_(1,2), a_(1,1), a_(2,2)];
var = for v in L list p_v;
R = QQ[var];

f = (i,j,k,l) -> q_i*a_(i, j)*a_(j,k)*a_(k, l);
images = for v in L list f(toSequence(v));
g = map(S, R, images);
I = kernel g;
gens gb I
