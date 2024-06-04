include "globals.mzn";

% TODO:  change back t_max into t_end, in A_mov, B_mov, ...
array[1..t_max, 1..n^2] of var 0..k: visited;

% t_end indicates the time in 

% positions of knight A
array[1..t_max] of var 0..n-1: A_i;
array[1..t_max] of var 0..n-1: A_j;
constraint A_i[1] = 0;
constraint A_j[1] = 0;
% times at which knight A moves
array[int] of int: A_mov = [i | i in 2..t_max where (i mod 4) = 2];
array[int] of int: A_not_mov = [i | i in 2..t_max where (i mod 4) != 2];


% positions of knight B
array[1..t_max] of var 0..n-1: B_i;
array[1..t_max] of var 0..n-1: B_j;
constraint B_i[1] = 0;
constraint B_j[1] = (n-1);
% times at which knight B moves
array[int] of int: B_mov = [i | i in 2..t_max where (i mod 4) = 3];
array[int] of int: B_not_mov = [i | i in 2..t_max where (i mod 4) != 3];


% positions of knight C
array[1..t_max] of var 0..n-1: C_i;
array[1..t_max] of var 0..n-1: C_j;
constraint C_i[1] = (n-1);
constraint C_j[1] = 0;
% times at which knight C moves
array[int] of int: C_mov = [i | i in 2..t_max where (i mod 4) = 0];
array[int] of int: C_not_mov = [i | i in 2..t_max where (i mod 4) != 0];


% positions of knight D
array[1..t_max] of var 0..n-1: D_i;
array[1..t_max] of var 0..n-1: D_j;
constraint D_i[1] = (n-1);
constraint D_j[1] = (n-1);
% times at which knight D moves
array[int] of int: D_mov = [i | i in 2..t_max where (i mod 4) = 1];
array[int] of int: D_not_mov = [i | i in 2..t_max where (i mod 4) != 1];

% movements of knight A
constraint forall(t in A_mov)(
                              (
                               ((A_i[t] = A_i[t-1] + 1 /\ A_j[t] = A_j[t-1] + 2)) \/
                               ((A_i[t] = A_i[t-1] + 1 /\ A_j[t] = A_j[t-1] - 2)) \/
                               ((A_i[t] = A_i[t-1] - 1 /\ A_j[t] = A_j[t-1] + 2)) \/
                               ((A_i[t] = A_i[t-1] - 1 /\ A_j[t] = A_j[t-1] - 2)) \/
                               ((A_i[t] = A_i[t-1] + 2 /\ A_j[t] = A_j[t-1] + 1)) \/
                               ((A_i[t] = A_i[t-1] + 2 /\ A_j[t] = A_j[t-1] - 1)) \/
                               ((A_i[t] = A_i[t-1] - 2 /\ A_j[t] = A_j[t-1] + 1)) \/
                               ((A_i[t] = A_i[t-1] - 2 /\ A_j[t] = A_j[t-1] - 1))
                              ) 
                              /\ (occupied[A_i[t]+1, A_j[t]+1] = false /\ ((A_i[t]*n) + A_j[t] != (B_i[t]*n) + B_j[t]) /\ ((A_i[t]*n) + A_j[t] != (C_i[t]*n) + C_j[t]) /\ ((A_i[t]*n) + A_j[t] != (D_i[t]*n) + D_j[t]))
                              );
constraint forall(t in A_not_mov)(A_i[t] = A_i[t-1] /\ A_j[t] = A_j[t-1]);

% movements of knight B
constraint forall(t in B_mov)(
                              (
                               ((B_i[t] = B_i[t-1] + 1 /\ B_j[t] = B_j[t-1] + 2)) \/
                               ((B_i[t] = B_i[t-1] + 1 /\ B_j[t] = B_j[t-1] - 2)) \/
                               ((B_i[t] = B_i[t-1] - 1 /\ B_j[t] = B_j[t-1] + 2)) \/
                               ((B_i[t] = B_i[t-1] - 1 /\ B_j[t] = B_j[t-1] - 2)) \/
                               ((B_i[t] = B_i[t-1] + 2 /\ B_j[t] = B_j[t-1] + 1)) \/
                               ((B_i[t] = B_i[t-1] + 2 /\ B_j[t] = B_j[t-1] - 1)) \/
                               ((B_i[t] = B_i[t-1] - 2 /\ B_j[t] = B_j[t-1] + 1)) \/
                               ((B_i[t] = B_i[t-1] - 2 /\ B_j[t] = B_j[t-1] - 1))
                              ) 
                              /\ (occupied[B_i[t]+1, B_j[t]+1] = false /\ ((B_i[t]*n) + B_j[t] != (A_i[t]*n) + A_j[t]) /\ ((B_i[t]*n) + B_j[t] != (C_i[t]*n) + C_j[t]) /\ ((B_i[t]*n) + B_j[t] != (D_i[t]*n) + D_j[t]))
                              );
constraint forall(t in B_not_mov)(B_i[t] = B_i[t-1] /\ B_j[t] = B_j[t-1]);

% movements of knight C
constraint forall(t in C_mov)(
                              (
                               ((C_i[t] = C_i[t-1] + 1 /\ C_j[t] = C_j[t-1] + 2)) \/
                               ((C_i[t] = C_i[t-1] + 1 /\ C_j[t] = C_j[t-1] - 2)) \/
                               ((C_i[t] = C_i[t-1] - 1 /\ C_j[t] = C_j[t-1] + 2)) \/
                               ((C_i[t] = C_i[t-1] - 1 /\ C_j[t] = C_j[t-1] - 2)) \/
                               ((C_i[t] = C_i[t-1] + 2 /\ C_j[t] = C_j[t-1] + 1)) \/
                               ((C_i[t] = C_i[t-1] + 2 /\ C_j[t] = C_j[t-1] - 1)) \/
                               ((C_i[t] = C_i[t-1] - 2 /\ C_j[t] = C_j[t-1] + 1)) \/
                               ((C_i[t] = C_i[t-1] - 2 /\ C_j[t] = C_j[t-1] - 1))
                              ) 
                              /\ (occupied[C_i[t]+1, C_j[t]+1] = false /\ ((C_i[t]*n) + C_j[t] != (A_i[t]*n) + A_j[t]) /\ ((C_i[t]*n) + C_j[t] != (B_i[t]*n) + B_j[t]) /\ ((C_i[t]*n) + C_j[t] != (D_i[t]*n) + D_j[t]))
                              );
constraint forall(t in C_not_mov)(C_i[t] = C_i[t-1] /\ C_j[t] = C_j[t-1]);

% movements of knight D
constraint forall(t in D_mov)(
                              (
                               ((D_i[t] = D_i[t-1] + 1 /\ D_j[t] = D_j[t-1] + 2)) \/
                               ((D_i[t] = D_i[t-1] + 1 /\ D_j[t] = D_j[t-1] - 2)) \/
                               ((D_i[t] = D_i[t-1] - 1 /\ D_j[t] = D_j[t-1] + 2)) \/
                               ((D_i[t] = D_i[t-1] - 1 /\ D_j[t] = D_j[t-1] - 2)) \/
                               ((D_i[t] = D_i[t-1] + 2 /\ D_j[t] = D_j[t-1] + 1)) \/
                               ((D_i[t] = D_i[t-1] + 2 /\ D_j[t] = D_j[t-1] - 1)) \/
                               ((D_i[t] = D_i[t-1] - 2 /\ D_j[t] = D_j[t-1] + 1)) \/
                               ((D_i[t] = D_i[t-1] - 2 /\ D_j[t] = D_j[t-1] - 1))
                              ) 
                              /\ (occupied[D_i[t]+1, D_j[t]+1] = false /\ ((D_i[t]*n) + D_j[t] != (A_i[t]*n) + A_j[t]) /\ ((D_i[t]*n) + D_j[t] != (B_i[t]*n) + B_j[t]) /\ ((D_i[t]*n) + D_j[t] != (C_i[t]*n) + C_j[t]))
                              );
constraint forall(t in D_not_mov)(D_i[t] = D_i[t-1] /\ D_j[t] = D_j[t-1]);

% accumulate the movements of all knights into a visited matrix, with at most k visits per cell
constraint forall(t in A_mov, i in 1..n^2)(if ((A_i[t]*n) + A_j[t] + 1) = i then visited[t, (A_i[t]*n) + A_j[t] + 1] = visited[t-1, (A_i[t]*n) + A_j[t] + 1] + 1 else visited[t, i] = visited[t-1, i] endif);
constraint forall(t in B_mov, i in 1..n^2)(if ((B_i[t]*n) + B_j[t] + 1) = i then visited[t, (B_i[t]*n) + B_j[t] + 1] = visited[t-1, (B_i[t]*n) + B_j[t] + 1] + 1 else visited[t, i] = visited[t-1, i] endif);
constraint forall(t in C_mov, i in 1..n^2)(if ((C_i[t]*n) + C_j[t] + 1) = i then visited[t, (C_i[t]*n) + C_j[t] + 1] = visited[t-1, (C_i[t]*n) + C_j[t] + 1] + 1 else visited[t, i] = visited[t-1, i] endif);
constraint forall(t in D_mov, i in 1..n^2)(if ((D_i[t]*n) + D_j[t] + 1) = i then visited[t, (D_i[t]*n) + D_j[t] + 1] = visited[t-1, (D_i[t]*n) + D_j[t] + 1] + 1 else visited[t, i] = visited[t-1, i] endif);

% constraint knight A to stay at least once on every target cell
constraint exists(t in A_mov)(forall(ta in target)(exists(tp in 2..t where (tp mod 4) = 2)((A_i[tp]*n) + A_j[tp] = ta)));

% constraint knight B to stay at least once on every target cell
constraint exists(t in B_mov)(forall(ta in target)(exists(tp in 2..t where (tp mod 4) = 3)((B_i[tp]*n) + B_j[tp] = ta)));

% constraint knight C to stay at least once on every target cell
constraint exists(t in C_mov)(forall(ta in target)(exists(tp in 2..t where (tp mod 4) = 0)((C_i[tp]*n) + C_j[tp] = ta)));

% constraint knight D to stay at least once on every target cell
constraint exists(t in D_mov)(forall(ta in target)(exists(tp in 2..t where (tp mod 4) = 1)((D_i[tp]*n) + D_j[tp] = ta)));

% ---------------- DATA -----------------------------------
% number of times each free cell can be visited
par int: k = 4;

% chessboard size
par int: n = 8;

% 
par int: t_max = 45;

% target matrix
array[int] of var 1..(n^2): target = {6};
            
% occupied matrix
array[1..n,1..n] of bool: occupied =
           array2d(1..n,1..n,
               [
                     false,false,false,false,false,false,false,false,
                     false,false,false,false,false,false,false,false,
                     false,false,false,false,false,false,false,false,
                     false,false,false,false,false,false,false,false,
                     false,false,false,false,false,false,false,false,
                     false,false,false,false,false,false,false,false,
                     false,false,false,false,false,false,false,false,
                     false,false,false,false,false,false,false,false
               ]);

solve :: int_search(A_i, input_order, indomain) :: int_search(A_j, input_order, indomain)
      :: int_search(B_i, input_order, indomain) :: int_search(B_j, input_order, indomain)
      :: int_search(C_i, input_order, indomain) :: int_search(C_j, input_order, indomain) 
      :: int_search(D_i, input_order, indomain) :: int_search(D_j, input_order, indomain)
      :: int_search(visited, input_order, indomain)  satisfy;

% solve satisfy;