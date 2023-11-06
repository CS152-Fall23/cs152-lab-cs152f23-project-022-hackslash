%{
    #include <stdio.h>
    
    int yylex(void);
    void yyerror(char const *err) {fprintf(stderr, " could not open input %s \n", argv[1]);}


%}

/* %define parse.error  */

%token 

%left 

%union {
    int num;
}

%%
/* grammar */

add_exp: mul_exp { $$ = $1; }
| add_exp ADD add_exp { $$ = $1 + $3; } 
| add_exp SUB add_exp { $$ = $1 - $3; }

Mul_exp:exp { $$ = $1; }
| mul_exp MUL mul_exp { $$ = $1 * $3; } 
| mul_exp DIV mul_exp { $$ = $1 / $3; } 

exp: NUM { $$ = $1; } 
| SUB exp { $$ = -$1; }
| ( add_exp ) { $$ = $2; }


REL: lth/ { $$ = $1 < $3; } 
| gth/ { $$ = $1 > $3; } 
| eqt/ { $$ = $1 == $3; } 
| lte/ { $$ = $1 <= $3; } 
| gte/ { $$ = $1 >= $3; } 
| neq/ { $$ = $1 != $3; } 

/*
VAR:
int/ { $$ = int/ $1; }
| string/ { $$ = string/ $1; }
| double/ { $$ = double/ $1; }
| char/ { $$ = char/ $1; }
| bool/ { $$ = bool/ $1; }
| void/ { $$ = void/ $1; }
*/ 


   program: 

%%

/* static int yyreport_syntax_error(const yypcontext_t *ctx) {
    yysymbol_kind_t tokenCausingError = yypcontext_token(ctx);
    yysymbol_kind_t expectedTokens[YYNTOKENS];
    int numExpectedTokens = yypcontext_expected_tokens(ctx, expectedTokens, YYNTOKENS);

    fprintf(stderr, "\n-- Syntax Error''\n");
    fprintf(stderr, "%llw line %llu column\n", current_line, current_column);
    fprintf(stderr, "Token causing error: %s\n", yysymbol_name(tokenCausingError));
    for(int i = 0; i < numExpectedTokens; ++i){
        fprintf(stderr, " expected token (%d/%d): %s\n", i+1, numExpectedTokens, yysymbol_name(expectedTokens[i]));
    }

    return 0;
} */
