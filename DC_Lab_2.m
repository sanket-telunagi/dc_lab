clc ;
close all ;
clear all ;

# ---- Probabilities to calculate ----
# p : p(x) probabilities of x
# q : p(y|x) 
# n : number of input elements
# P(x,y) : P(x)*P(y|x) --> Px * q
# P(x) : px -- input digonal matrix 'diag' matrix function
# P(y) : P(x) * P(y|x) --> p*q

# ---- Entropies to calculate ----
# H(x) : -P(x)*log2(P(x))
# H(y) : -P(y)*log2(P(y))
# H(x,y) : -Pxy(i,j)*log2(Pxy(i,j))
# H(x|y) : H(x,y) - H(x)
# H(y|x) : H(x,y) - H(y)

# ---- Mutual Information ----
# I(x,y) : H(x) - H(y|x) 

n = input("Enter the number of elements : ") ;

# ---- P(y|x) ----
q = input("Enter the matrix : " ) ;
display(q) ;

# ---- Range ----
N = 1:n ;

# ---- P(x) ----
p = input("Enter the probability vector : ") ; # P(x)

# ---- diagonal P(x) ----
Px = diag(p,n,n) ; # P(X) --> probabilities
disp("P(X) --> ") ;
disp(Px) ;

# ---- P(x,y) ----
Pxy = Px * q ;
display(Pxy) ;

# ---- P(y) ----
Py = p * q ;
Py = diag(Py) ;
display(Py) ;

# Entropy ---> 

# ----- H(x) ----
Hx = 0
for i = N 
    Hx = Hx + (-(p(i) * log2(p(i)))) ;
end
display(Hx) ;

# ----- H(y) ----
Hy = 0
for i = N
    Hy = Hy + (-(Py(i)*log2(Py(i)))) ;
end ;

# ----- H(x,y) ----
Hxy = 0;
for i=N 
   for j = N
      Hxy -= Pxy(i,j) * log2(Pxy(i,j)) ;
   endfor
endfor

display(Hxy) ;

# ---- H(x|y) ----
h1 = Hxy - Hx ;
display(h1) ;

# ---- H(y|x) ----
h2 = Hxy - Hy ;
display(h2);

# ---- Information ----
# ---- I(x,y) ----
Ixy = Hx - h2 ;
display(Ixy) ;

# ---- Comment on channel ----
if h2 == 0 
   disp("Lossless Channel") ;
end

if Ixy == 0 
   disp("Useless Channel") ;
end

if Hx == Hy and h1 == 0
   display("Noiseless Channel");