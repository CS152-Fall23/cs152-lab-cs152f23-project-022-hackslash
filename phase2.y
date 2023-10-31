%{
    #include <stdio.h>
    
    int yylex(void);
    void yyerror(char const *err) {fprintf(stderr, " could not open input %s \n", argv[1]);}

%}

%token NUM 

%left 

%right 