%{
    #include <stdio.h>
    
    int yylex(void);
    void yyerror(char const *err) {fprintf(stderr, " could not open input %s \n", argv[1]);}


%}

/* %define parse.error  */

%token VAR FUNCTION NUM IDENT L_CURLY L_PAREN L_SQUARE R_CURLY R_PAREN R_SQUARE COMMA EQL SEMI BREAK IF ELIF ELSE IN OUT PRINT WHILE DO ADD SUB MUL DIV LESS_THAN GREATER_THAN EQUAL_TO LESS_EQUAL_TO GREATER_EQUAL_TO NOT_EQUAL_TO ASSIGN LH_ID
%left ADD SUB
%left MULT DIV

%start program


%%
/* grammar */
program: %empty {printf("program -> epsilon");}
| program stmt{printf("program -> stmt");}

stmt: stmt stmt {printf("stmt -> stmt stmt\n");}
| assignment {printf("stmt -> assignment";)}
| function {printf("stmt -> function");}
| break {printf("stmt -> break");}
| read_write_stmt {printf("stmt -> read_write_stmt");}
| if_stmt {printf("stmt -> if_stmt");}
| while_stmt {printf("stmt -> while_stmt");}
| %empty {printf("stmt -> epsilon");}

assignment: VAR LH_ID {printf("assignment -> VAR LH_ID");}
| VAR LH_ID ASSIGN rel_exp {printf("assignment -> VAR LH_ID = rel_exp");}
| VAR LH_ID ASSIGN IDENT {printf("assignment -> VAR LH_ID = IDENT");}

function: VAR IDENT L_PAREN arg R_PAREN { stmt }

arg: VAR IDENT
| VAR IDENT COMMA arg

break: BREAK {printf("break/");}

read_write_stmt: IF IDENT {printf("read_write_stmt -> in/ ID");}
| OUT IDENT {printf("read_write_stmt -> out/ IDENT");}
| PRINT L_PAREN IDENT R_PAREN {printf("IDENT");}

if_stmt: IF L_PAREN rel_exp R_PAREN  stmt  elseif
| IF L_PAREN rel_exp R_PAREN stmt ELIF ELSE stmt 

while_stmt: WHILE L_PAREN rel_exp R_PAREN {stmt}
| DO stmt WHILE L_PAREN exp R_PAREN

elseif: %empty {printf("elseif -> epsilon");}
| ELIF L_PAREN rel_exp R_PAREN { stmt } ELIF

rel_exp: IDENT { $$ = $1; }
| add_exp { $$ = $1; }
| rel { $$ = $1; }

add_exp: mul_exp { $$ = $1; }
| add_exp ADD add_exp { $$ = $1 + $3; } 
| add_exp SUB add_exp { $$ = $1 - $3; }

mul_exp: exp { $$ = $1; }
| mul_exp MUL mul_exp { $$ = $1 * $3; } 
| mul_exp DIV mul_exp { $$ = $1 / $3; } 

exp: NUM { $$ = $1; } 
| SUB exp { $$ = -$1; }
| L_PAREN add_exp R_PAREN { $$ = $2; }


rel: rel_exp LESS_THAN rel_exp { $$ = $1 < $3; } 
| rel_exp GREATER_THAN rel_exp { $$ = $1 > $3; } 
| rel_exp EQUAL_TO rel_exp { $$ = $1 == $3; } 
| rel_exp LESS_EQUAL_TO rel_exp { $$ = $1 <= $3; } 
| rel_exp GREATER_EQUAL_TO rel_exp { $$ = $1 >= $3; } 
| rel_exp NOT_EQUAL_TO rel_exp { $$ = $1 != $3; } 
| L_PAREN add_exp R_PAREN { $$ = $2; }

/*
VAR:
int/ { $$ = int/ $1; }
| string/ { $$ = string/ $1; }
| double/ { $$ = double/ $1; }
| char/ { $$ = char/ $1; }
| bool/ { $$ = bool/ $1; }
| void/ { $$ = void/ $1; }
*/ 


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
