% CSI 3120 Assignment 1 Question 2
% Student Name: Elad Tzemach
% Student Number: 7505407
% Student Email: etzem012@uottawa.ca

gate(x1).
gate(x2).
gate(a1).
gate(a2).
gate(o1).
gate_type(x1, xor).
gate_type(x2, xor).
gate_type(a1, and).
gate_type(a2, and).
gate_type(o1, or).
circuit(c1).

signal(0).
signal(1).

arity(c1, 3, 2).
arity(x1, 2, 1).
arity(x2, 2, 1).
arity(a1, 2, 1).
arity(a2, 2, 1).
arity(o1, 2, 1).



terminal(t1, in(1,x1)).
terminal(t2, in(2,x1)).
terminal(t3, in(1,a1)).
terminal(t4, in(2,a1)).
terminal(t5, in(1,x2)).
terminal(t6, in(2,x2)).
terminal(t7, in(1,a2)).
terminal(t8, in(2,a2)).
terminal(t9, in(1,o1)).
terminal(t10, in(2,o1)).
terminal(t11, out(1,x1)).
terminal(t12, out(1,a1)).
terminal(t13, out(1,x2)).
terminal(t14, out(1,a2)).
terminal(t15, out(1,o1)).


connected(t1,t3).
connected(t2, t4).
connected(t6, t7).
connected(t11, t5).
connected(t11, t8).
connected(t12, t10).
connected(t14, t9).





input_x1(A,B,Z) :- A == 1,
				   B == 1,
				   Z is 0.
input_x1(A,B,Z) :- A == 0,
				   B == 0,
				   Z is 0.
input_x1(A,B,Z) :- A == 1,
				   B == 0,
				   Z is 1.
input_x1(A,B,Z) :- A == 0,
				   B == 1,
				   Z is 1.	


input_x2(C,D,Sum) :- C == 1,
				     D == 1,
				     Sum is 0.
input_x2(C,D,Sum) :- C == 0,
				     D == 0,
				     Sum is 0.
input_x2(C,D,Sum) :- C == 1,
				     D == 0,
				     Sum is 1.
input_x2(C,D,Sum) :- C == 0,
				     D == 1,
				     Sum is 1.	

input_a1(A,B,E) :- A == 1,
				     B == 1,
				     E is 1.
input_a1(A,B,E) :- A == 0,
				     B == 0,
				     E is 0.
input_a1(A,B,E) :- A == 1,
				     B == 0,
				     E is 0.
input_a1(A,B,E) :- A == 0,
				     B == 1,
				     E is 0.

input_a2(C,D,G) :- C == 1,
				     D == 1,
				     G is 1.
input_a2(C,D,G) :- C == 0,
				     D == 0,
				     G is 0.
input_a2(C,D,G) :- C == 1,
				     D == 0,
				     G is 0.
input_a2(C,D,G) :- C == 0,
				     D == 1,
				     G is 0.

input_o1(E,G,Carry) :- E == 1,
				     G == 1,
				     Carry is 1.
input_o1(E,G,Carry) :- E == 0,
				     G == 0,
				     Carry is 0.
input_o1(E,G,Carry) :- E == 1,
				     G == 0,
				     Carry is 1.
input_o1(E,G,Carry) :- E == 0,
				     G == 1,
				     Carry is 1.	

question1(A,B,C,Sum,Carry)  :- signal(A), signal(B), signal(C),
					 		 input_x1(A,B,D),
					 		 input_a1(A,B,E),
					 		 input_x2(C,D,Sum),
					 		 input_a2(C,D,G),
					 		 input_o1(E,G,Carry).


question2(A,B,C)  :- signal(A), signal(B), signal(C),
					 		 input_x1(A,B,D),
					 		 input_a1(A,B,E),
					 		 D = E.

question3_helper(R) :- (terminal(X, in(1,o1)) ; terminal(X, in(2,o1))) ,
				((connected(Y,X), terminal(Y,out(_,R))) ; (connected(F,X),
														  terminal(F, out(_,Z)),
														  terminal(G, in(_,Z)),
														  connected(Y,G), terminal(Y,out(_,R))
								  
								   )).


question3(L) :- gate(L),
				L \= o1,
				not(question3_helper(L)).