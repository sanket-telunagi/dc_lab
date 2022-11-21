# ---- Huffman and ShannonFano Encoding decoding with efficiency and entropy ------
# required "communication package"

clc ;
close all ;
clear all ;

pkg load communications ;

# ---- Shannon Fanno Coding ----

symbols = 1:5  ;  # symbols vector
display(symbols) ;

prob = [0.4 0.2 0.2 0.1 0.1] ;# probabilities
display(prob) ;

# ---- creating Shannon Fanno dictionary ----
dict = shannonfanodict(symbols,prob) ;
display(dict) ;

# ---- input sequence ----
Input_Sequence = [3 4 5 1 1 4 2] ;
display(Input_Sequence) ;

# ---- Shannon Fanno encoding ----
code = shannonfanoenco(Input_Sequence,dict);
display(code);

# ---- Shannon Fanno Decoding ----
decode = shannonfanodeco(code, dict) ;
display(decode) ;

# ---- Entropy ----
Hx = 0 ;
for i = symbols 
    Hx -= prob(i) * log2(prob(i)) ;
endfor
display(Hx) ;

# ---- Avg Length ----
L = 0 ;
for i = symbols
    L += Input_Sequence(i) * prob(i) ;
endfor
display(L) ;

# ---- Efficiency ----
Nn = Hx/L ;
display(Nn) ;