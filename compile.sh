flex phase1.lex

bison phase2.y

gcc -o tokenizer lex.yy.c

gcc -o parser lex.yy.c

gcc lex.yy.c -o parser.elf 

./parser.elf < input.txt > testOutput2.mil 

./mil_run testOutput2.mil 