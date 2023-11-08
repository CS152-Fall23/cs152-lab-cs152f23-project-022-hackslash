flex phase1.lex

bison phase2.y

gcc -o parser lex.yy.c

./parser input.txt > output.txt
