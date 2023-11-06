%{
    #include <stdio.h>
    
    int yylex(void);
    void yyerror(char const *err) {fprintf(stderr, " could not open input %s \n", argv[1]);}


%}

/* %define parse.error  */

%left VAR FUNCTION NUM IDENT L_CURLY L_PAREN L_SQUARE R_CURLY R_PAREN R_SQUARE COMMA EQL SEMI BREAK IF ELIF ELSE IN OUT PRINT WHILE DO ADD SUB MUL DIV LESS_THAN GREATER_THAN EQUAL_TO LESS_EQUAL_TO GREATER_EQUAL_TO NOT_EQUAL_TO ASSIGN


%start program


%%
/* grammar */
program: stmt{}
| program stmt{}

stmt: stmt stmt {printf("stmt -> stmt stmt\n");}
| assignment {printf("stmt -> assignment";)}
| function {printf("stmt -> function");}
| break {printf("stmt -> break");}
| read_write_stmt {printf("stmt -> read_write_stmt");}
| if_stmt {printf("stmt -> if_stmt");}
| while_stmt {printf("stmt -> while_stmt");}
| %empty {printf("stmt -> epsilon");}

assignment: VAR LH_ID {printf("assignment -> VAR LH_ID");}
| VAR LH_ID ASSIGN rel_exp {printf("assignment -> VAR LH_ID = rel_exp";)}
| VAR LH_ID ASSIGN ID {printf("assignment -> VAR LH_ID = ID");}

function: VAR ID (arg) { stmt }

arg: VAR ID
| VAR ID COMMA arg

break: BREAK {printf("break/");}

read_write_stmt: IF ID {printf("read_write_stmt -> in/ ID");}
| OUT ID {printf("read_write_stmt -> out/ ID");}
| PRINT L_PAREN “ ID “ R_PAREN {printf("");}

if: IF L_PAREN rel_exp R_PAREN { stmt } elseif
| IF L_PAREN rel_exp R_PAREN {stmt} ELIF ELSE {stmt} 

while: WHILE L_PAREN rel_ex R_PAREN {stmt}
| DO {stmt} WHILE L_PAREN expr R_PAREN

elseif: %empty {printf("elseif -> epsilon");}
| ELIF L_PAREN rel_exp R_PAREN { stmt } ELIF

rel_exp: ID { $$ = $1; }
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
| rel_exp GREATER_THAN { $$ = $1 > $3; } 
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
