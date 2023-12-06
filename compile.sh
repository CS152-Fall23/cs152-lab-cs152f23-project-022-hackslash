flex phase1.lex

bison phase2.y

gcc lex.yy.c -o parser.elf 

./parser.elf < input.txt > mil_output.mil 

./mil_run mil_output.mil 

rm lex.yy.c parser.elf