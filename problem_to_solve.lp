number(1..n).
time(1..t).
k_val(0..k).

% data: set target and occupied
target(1,6).

% initialize
a_on(1,1,1).
b_on(1,n,1).
c_on(n,1,1).
d_on(n,n,1).
% each cell i,j was visited zero times at time 1
visited(I, J, 0, 1) :- number(I), number(J).

% exactly one move have to be picked at each time T
1{move(T,ul); move(T,ur); move(T,lu); move(T,ld); move(T,ru); move(T,rd); move(T,dl); move(T,dr)}1 :- time(T).

% -------------------- movements of knight A---------------------------------------
% A moves when time=2,6,10,14...
a_on(I+1, J+2, T+4) :- a_on(I, J, T), move(T,rd), number(I), number(J), time(T), time(T+4), number(I+1), number(J+2), (T \ 4) = 2, not occupied(I+1, J+2).
a_on(I+1, J-2, T+4) :- a_on(I, J, T), move(T,ld), number(I), number(J), time(T), time(T+4), number(I+1), number(J-2), (T \ 4) = 2, not occupied(I+1, J-2).
a_on(I-1, J+2, T+4) :- a_on(I, J, T), move(T,ru), number(I), number(J), time(T), time(T+4), number(I-1), number(J+2), (T \ 4) = 2, not occupied(I-1, J+2).
a_on(I-1, J-2, T+4) :- a_on(I, J, T), move(T,lu), number(I), number(J), time(T), time(T+4), number(I-1), number(J-2), (T \ 4) = 2, not occupied(I-1, J-2).
a_on(I+2, J+1, T+4) :- a_on(I, J, T), move(T,dr), number(I), number(J), time(T), time(T+4), number(I+2), number(J+1), (T \ 4) = 2, not occupied(I+2, J+1).
a_on(I+2, J-1, T+4) :- a_on(I, J, T), move(T,dl), number(I), number(J), time(T), time(T+4), number(I+2), number(J-1), (T \ 4) = 2, not occupied(I+2, J-1).
a_on(I-2, J+1, T+4) :- a_on(I, J, T), move(T,ur), number(I), number(J), time(T), time(T+4), number(I-2), number(J+1), (T \ 4) = 2, not occupied(I-2, J+1).
a_on(I-2, J-1, T+4) :- a_on(I, J, T), move(T,ul), number(I), number(J), time(T), time(T+4), number(I-2), number(J-1), (T \ 4) = 2, not occupied(I-2, J-1).
% A stays still in the remaining times
a_on(I,J,T) :- a_on(I,J,T-1), time(T), number(I), number(J), time(T-1), (T \ 4) != 2.

% INERTIA RULES: We force knight A to make a single move at each time, and the movements to be valid ones
:- a_on(IE, JE, T+4), a_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |IE-IS| > 2.
:- a_on(IE, JE, T+4), a_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |JE-JS| > 2.
:- a_on(IE, JE, T+4), a_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |IE-IS| = 0.
:- a_on(IE, JE, T+4), a_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |JE-JS| = 0.
:- a_on(IE, JE, T+4), a_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |IE-IS| = 1, |JE-JS| = 1.
:- a_on(IE, JE, T+4), a_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |IE-IS| = 2, |JE-JS| = 2.
:- a_on(IE, JE, T+4), a_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), occupied(IE, JE).

% knight A can be moved only once at each time T
1{a_on(I, J, T) : number(I), number(J)}1 :- time(T).

% ------------------------------ movements of knight B----------------------------------
% B moves when time=3,7,11,15,...
b_on(I+1, J+2, T+4) :- b_on(I, J, T), move(T,rd), number(I), number(J), time(T), time(T+4), number(I+1), number(J+2), (T \ 4) = 3, not occupied(I+1, J+2).
b_on(I+1, J-2, T+4) :- b_on(I, J, T), move(T,ld), number(I), number(J), time(T), time(T+4), number(I+1), number(J-2), (T \ 4) = 3, not occupied(I+1, J-2).
b_on(I-1, J+2, T+4) :- b_on(I, J, T), move(T,ru), number(I), number(J), time(T), time(T+4), number(I-1), number(J+2), (T \ 4) = 3, not occupied(I-1, J+2).
b_on(I-1, J-2, T+4) :- b_on(I, J, T), move(T,lu), number(I), number(J), time(T), time(T+4), number(I-1), number(J-2), (T \ 4) = 3, not occupied(I-1, J-2).
b_on(I+2, J+1, T+4) :- b_on(I, J, T), move(T,dr), number(I), number(J), time(T), time(T+4), number(I+2), number(J+1), (T \ 4) = 3, not occupied(I+2, J+1).
b_on(I+2, J-1, T+4) :- b_on(I, J, T), move(T,dl), number(I), number(J), time(T), time(T+4), number(I+2), number(J-1), (T \ 4) = 3, not occupied(I+2, J-1).
b_on(I-2, J+1, T+4) :- b_on(I, J, T), move(T,ur), number(I), number(J), time(T), time(T+4), number(I-2), number(J+1), (T \ 4) = 3, not occupied(I-2, J+1).
b_on(I-2, J-1, T+4) :- b_on(I, J, T), move(T,ul), number(I), number(J), time(T), time(T+4), number(I-2), number(J-1), (T \ 4) = 3, not occupied(I-2, J-1).
% B stays still in the remaining times
b_on(I,J,T) :- b_on(I,J,T-1), time(T), number(I), number(J), time(T-1), (T \ 4) != 3.

% INERTIA RULES: We force knight B to make a single move at each time, and the movements to be valid ones
:- b_on(IE, JE, T+4), b_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |IE-IS| > 2.
:- b_on(IE, JE, T+4), b_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |JE-JS| > 2.
:- b_on(IE, JE, T+4), b_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |IE-IS| = 0.
:- b_on(IE, JE, T+4), b_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |JE-JS| = 0.
:- b_on(IE, JE, T+4), b_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |IE-IS| = 1, |JE-JS| = 1.
:- b_on(IE, JE, T+4), b_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |IE-IS| = 2, |JE-JS| = 2.
:- b_on(IE, JE, T+4), b_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), occupied(IE, JE).

% knight B can be moved only once at each time T
1{b_on(I, J, T) : number(I), number(J)}1 :- time(T).

% -------------------- movements of knight C ---------------------------------------
% C moves when time=4,8,12,16,...
c_on(I+1, J+2, T+4) :- c_on(I, J, T), move(T,rd), number(I), number(J), time(T), time(T+4), number(I+1), number(J+2), (T \ 4) = 0, not occupied(I+1, J+2).
c_on(I+1, J-2, T+4) :- c_on(I, J, T), move(T,ld), number(I), number(J), time(T), time(T+4), number(I+1), number(J-2), (T \ 4) = 0, not occupied(I+1, J-2).
c_on(I-1, J+2, T+4) :- c_on(I, J, T), move(T,ru), number(I), number(J), time(T), time(T+4), number(I-1), number(J+2), (T \ 4) = 0, not occupied(I-1, J+2).
c_on(I-1, J-2, T+4) :- c_on(I, J, T), move(T,lu), number(I), number(J), time(T), time(T+4), number(I-1), number(J-2), (T \ 4) = 0, not occupied(I-1, J-2).
c_on(I+2, J+1, T+4) :- c_on(I, J, T), move(T,dr), number(I), number(J), time(T), time(T+4), number(I+2), number(J+1), (T \ 4) = 0, not occupied(I+2, J+1).
c_on(I+2, J-1, T+4) :- c_on(I, J, T), move(T,dl), number(I), number(J), time(T), time(T+4), number(I+2), number(J-1), (T \ 4) = 0, not occupied(I+2, J-1).
c_on(I-2, J+1, T+4) :- c_on(I, J, T), move(T,ur), number(I), number(J), time(T), time(T+4), number(I-2), number(J+1), (T \ 4) = 0, not occupied(I-2, J+1).
c_on(I-2, J-1, T+4) :- c_on(I, J, T), move(T,ul), number(I), number(J), time(T), time(T+4), number(I-2), number(J-1), (T \ 4) = 0, not occupied(I-2, J-1).
% C stays still in the remaining times
c_on(I,J,T) :- c_on(I,J,T-1), time(T), number(I), number(J), time(T-1), (T \ 4) != 0.

% INERTIA RULES: We force knight C to make a single move at each time, and the movements to be valid ones
:- c_on(IE, JE, T+4), c_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |IE-IS| > 2.
:- c_on(IE, JE, T+4), c_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |JE-JS| > 2.
:- c_on(IE, JE, T+4), c_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |IE-IS| = 0.
:- c_on(IE, JE, T+4), c_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |JE-JS| = 0.
:- c_on(IE, JE, T+4), c_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |IE-IS| = 1, |JE-JS| = 1.
:- c_on(IE, JE, T+4), c_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |IE-IS| = 2, |JE-JS| = 2.
:- c_on(IE, JE, T+4), c_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), occupied(IE, JE).

% knight C can be moved only once at each time T
1{c_on(I, J, T) : number(I), number(J)}1 :- time(T).

% -------------------- movements of knight D ---------------------------------------
% D moves when time=5,9,13,17,... 
d_on(I+1, J+2, T+4) :- d_on(I, J, T), move(T,rd), number(I), number(J), time(T), time(T+4), number(I+1), number(J+2), (T \ 4) = 1, not occupied(I+1, J+2).
d_on(I+1, J-2, T+4) :- d_on(I, J, T), move(T,ld), number(I), number(J), time(T), time(T+4), number(I+1), number(J-2), (T \ 4) = 1, not occupied(I+1, J-2).
d_on(I-1, J+2, T+4) :- d_on(I, J, T), move(T,ru), number(I), number(J), time(T), time(T+4), number(I-1), number(J+2), (T \ 4) = 1, not occupied(I-1, J+2).
d_on(I-1, J-2, T+4) :- d_on(I, J, T), move(T,lu), number(I), number(J), time(T), time(T+4), number(I-1), number(J-2), (T \ 4) = 1, not occupied(I-1, J-2).
d_on(I+2, J+1, T+4) :- d_on(I, J, T), move(T,dr), number(I), number(J), time(T), time(T+4), number(I+2), number(J+1), (T \ 4) = 1, not occupied(I+2, J+1).
d_on(I+2, J-1, T+4) :- d_on(I, J, T), move(T,dl), number(I), number(J), time(T), time(T+4), number(I+2), number(J-1), (T \ 4) = 1, not occupied(I+2, J-1).
d_on(I-2, J+1, T+4) :- d_on(I, J, T), move(T,ur), number(I), number(J), time(T), time(T+4), number(I-2), number(J+1), (T \ 4) = 1, not occupied(I-2, J+1).
d_on(I-2, J-1, T+4) :- d_on(I, J, T), move(T,ul), number(I), number(J), time(T), time(T+4), number(I-2), number(J-1), (T \ 4) = 1, not occupied(I-2, J-1).
% D stays still in the remaining times
d_on(I,J,T) :- d_on(I,J,T-1), time(T), number(I), number(J), time(T-1), (T \ 4) != 1.

% INERTIA RULES: We force knight D to make a single move at each time, and the movements to be valid ones
:- d_on(IE, JE, T+4), d_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |IE-IS| > 2.
:- d_on(IE, JE, T+4), d_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |JE-JS| > 2.
:- d_on(IE, JE, T+4), d_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |IE-IS| = 0.
:- d_on(IE, JE, T+4), d_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |JE-JS| = 0.
:- d_on(IE, JE, T+4), d_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |IE-IS| = 1, |JE-JS| = 1.
:- d_on(IE, JE, T+4), d_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), |IE-IS| = 2, |JE-JS| = 2.
:- d_on(IE, JE, T+4), d_on(IS, JS, T), number(IE), number(JE), time(T), time(T+4), number(IS), number(JS), occupied(IE, JE).

% knight D can be moved only once at each time T
1{d_on(I, J, T) : number(I), number(J)}1 :- time(T).

% ------------------------------ contraints on visited matrix ------------------------------------------------------
% set visited cells when A moves
visited(I, J, K+1, T) :- a_on(I, J, T), visited(I, J, K, T-1), number(I), number(J), time(T), time(T-1), k_val(K), k_val(K+1), (T \ 4) = 2.
visited(I1, J1, K, T) :- a_on(I, J, T), visited(I1, J1, K, T-1), (I1-1)*n+J1 != (I-1)*n+J, number(I1), number(J1), number(I), number(J), time(T), time(T-1), k_val(K), (T \ 4) = 2.

% set visited cells when B moves
visited(I, J, K+1, T) :- b_on(I, J, T), visited(I, J, K, T-1), number(I), number(J), time(T), time(T-1), k_val(K), k_val(K+1), (T \ 4) = 3.
visited(I1, J1, K, T) :- b_on(I, J, T), visited(I1, J1, K, T-1), (I1-1)*n+J1 != (I-1)*n+J, number(I1), number(J1), number(I), number(J), time(T), time(T-1), k_val(K), (T \ 4) = 3.

% set visited cells when C moves
visited(I, J, K+1, T) :- c_on(I, J, T), visited(I, J, K, T-1), number(I), number(J), time(T), time(T-1), k_val(K), k_val(K+1), (T \ 4) = 0.
visited(I1, J1, K, T) :- c_on(I, J, T), visited(I1, J1, K, T-1), (I1-1)*n+J1 != (I-1)*n+J, number(I1), number(J1), number(I), number(J), time(T), time(T-1), k_val(K), (T \ 4) = 0.

% set visited cells when B moves
visited(I, J, K+1, T) :- d_on(I, J, T), visited(I, J, K, T-1), number(I), number(J), time(T), time(T-1), k_val(K), k_val(K+1), (T \ 4) = 1.
visited(I1, J1, K, T) :- d_on(I, J, T), visited(I1, J1, K, T-1), (I1-1)*n+J1 != (I-1)*n+J, number(I1), number(J1), number(I), number(J), time(T), time(T-1), k_val(K), (T \ 4) = 1.

% constraints on visited matrix: it must be a dense matrix, it can only be incremented by 1 from time T to time T+1 and cells can be visited at most k times
1{visited(I,J,K,T) : k_val(K)}1 :- number(I), number(J), time(T).
:- visited(I,J,K,T), K>k, time(I), time(J), k_val(k), time(T).
% INERTIA RULES
:- visited(I,J,KE,T), visited(I,J,KS,T-1), KE-KS > 1, number(I), number(J), k_val(KE), k_val(KS), time(T), time(T-1).


% -------------------------------- knights can't be on top of one another ---------------------------------------------------
% A and B can't be on the same cell at time T
:- a_on(I, J, T), b_on(I, J, T), time(T), number(I), number(J).
% A and C can't be on the same cell at time T
:- a_on(I, J, T), c_on(I, J, T), time(T), number(I), number(J).
% A and D can't be on the same cell at time T
:- a_on(I, J, T), d_on(I, J, T), time(T), number(I), number(J).
% B and C can't be on the same cell at time T
:- b_on(I, J, T), c_on(I, J, T), time(T), number(I), number(J).
% B and D can't be on the same cell at time T
:- b_on(I, J, T), d_on(I, J, T), time(T), number(I), number(J).
% C and D can't be on the same cell at time T
:- c_on(I, J, T), d_on(I, J, T), time(T), number(I), number(J).

% ------------------------------ all target cells must be visited at least once by every knight ---------------------------
% each target must be visited by A at least once
1{a_on(I,J,T) : time(T)}k :- target(I,J), number(I), number(J).
% each target must be visited by B at least once
1{b_on(I,J,T) : time(T)}k :- target(I,J), number(I), number(J).
% each target must be visited by C at least once
1{c_on(I,J,T) : time(T)}k :- target(I,J), number(I), number(J).
% each target must be visited by D at least once
1{d_on(I,J,T) : time(T)}k :- target(I,J), number(I), number(J).




