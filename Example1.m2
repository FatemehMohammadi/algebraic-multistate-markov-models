-- helper function

increasingTuples = (m, n) -> (
    if n == 1 then (
	apply(toList(0..m), i -> {i})
	) else (
    	previousTuples = increasingTuples(m, n-1);
        flatten apply(previousTuples, seq -> apply(toList(0..seq#0), k-> join({k},seq)))
    	)
    )


-- n=4, k=1, 3 states, homogeneous --

S = QQ[q_0, q_1, q_2, a_(0,0), a_(0,1), a_(0,2), a_(1,2), a_(1,1), a_(2,2)];
indi = for v in increasingTuples(2, 4) list toSequence v;
var = for v in increasingTuples(2,4) list p_v;
R = QQ[var];

f = (i,j,k,l) -> q_i*a_(i, j)*a_(j,k)*a_(k, l);
images = for v in indi list f(v);
g = map(S, R, images);
I = kernel g;
gens gb I

-- n=4, k=1, 3 states, non-homogeneous --

S = QQ[q_0, q_1,q_2, a_(0,0), a_(0,1), a_(0,2),a_(1,2), a_(1,1), a_(2,2),
    b_(0,0), b_(0,1), b_(0,2),b_(1,2), b_(1,1), b_(2,2),
    c_(0,0), c_(0,1), c_(0,2),c_(1,2), c_(1,1), c_(2,2)];
var = for v in increasingTuples(2, 4) list p_v;
R = QQ[var];

f = (i,j,k,l) -> q_i*a_(i, j)*b_(j,k)*c_(k, l);images = for v in indi list f(v);
g = map(S, R, images);
I = kernel g;
gens gb I
