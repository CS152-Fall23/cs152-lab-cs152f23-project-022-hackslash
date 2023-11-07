%{
    #include <stdio.h>
    
    int yylex(void);
    void yyerror(char const *err) {fprintf(stderr, " could not open input %s \n", argv[1]);}


%}

/* %define parse.error  */

%token VAR FUNCTION NUM IDENT L_CURLY L_PAREN L_SQUARE R_CURLY R_PAREN R_SQUARE COMMA SEMI BREAK IF ELIF ELSE IN OUT PRINT WHILE DO LH_ID INT STRING CHAR DOUBLE BOOL VOID
%left ADD SUB
%left MUL DIV
%left LESS_THAN GREATER_THAN EQUAL_TO LESS_EQUAL_TO GREATER_EQUAL_TO NOT_EQUAL_TO EQL
%left R_SQUARE L_SQUARE
%union{
    int num;
}
%start program

%%
/* grammar */
program: %empty {printf("program -> epsilon\n");}
| program stmt{printf("program -> stmt\n");}

stmt: stmt stmt {printf("stmt -> stmt stmt\n");}
| assignment {printf("stmt -> assignment\n");}
| function {printf("stmt -> function\n");}
| break {printf("stmt -> break\n");}
| read_write_stmt {printf("stmt -> read_write_stmt\n");}
| if_stmt {printf("stmt -> if_stmt\n");}
| while_stmt {printf("stmt -> while_stmt\n");}
| %empty {printf("stmt -> epsilon\n");}

assignment: VAR LH_ID {printf("assignment -> VAR LH_ID\n");}
| VAR LH_ID EQL rel_exp {printf("assignment -> VAR LH_ID = rel_exp\n");}
| VAR LH_ID EQL IDENT {printf("assignment -> VAR LH_ID = IDENT\n");}

function: VAR IDENT L_SQUARE arg R_SQUARE { stmt }

arg: VAR IDENT {printf("arg -> VAR IDENT\n");}
| VAR IDENT COMMA arg {printf("arg -> VAR IDENT,arg\n");}

break: BREAK {printf("break -> break/\n");}

read_write_stmt: IN IDENT {printf("read_write_stmt -> in/ ID\n");}
| OUT IDENT {printf("read_write_stmt -> out/ IDENT\n");}
| PRINT L_SQUARE IDENT R_SQUARE {printf("read_write -> print/(IDENT)\n");}

if_stmt: IF L_SQUARE rel_exp R_SQUARE L_CURLY stmt R_CURLY elseif {printf("if_stmt -> IF[rel_exp]{stmt}\n");}

while_stmt: WHILE L_SQUARE rel_exp R_SQUARE L_CURLY stmt R_CURLY {printf("while_stmt -> WHILE[rel_exp]{stmt}\n");}
| DO L_CURLY stmt R_CURLY WHILE L_SQUARE exp R_SQUARE {printf("while_stmt -> DO{stmt}WHILE[rel_exp]\n");}

elseif: ELSE L_CURLY stmt R_CURLY {printf("elseif -> ELSE{stmt}\n");}
| ELIF L_SQUARE rel_exp R_SQUARE L_CURLY stmt R_CURLY elseif {printf("elseif -> ELSEIF[rel_exp]{stmt}elseif\n");}

rel_exp: IDENT {printf("rel_exp -> IDENT\n");}
| add_exp {printf("rel_exp -> add_exp\n"); }
| rel {printf("rel_exp -> rel\n"); }
rel_exp: IDENT { printf("rel_exp -> IDENT\n"); }
| add_exp { printf("rel_exp -> add_exp\n"); }
| rel { printf("rel_exp -> rel\n"); }

add_exp: mul_exp {printf("add_exp -> mul_exp\n");}
| add_exp ADD add_exp {printf("add_exp -> add_exp ADD add_exp\n");} 
| add_exp SUB add_exp {printf("add_exp -> add_exp SUB add_exp\n");}

mul_exp: exp { $$ = $1; }
| mul_exp MUL mul_exp { $$ = $1 * $3; } 
| mul_exp DIV mul_exp { $$ = $1 / $3; } 

exp: NUM { $$ = $1; } 
| SUB exp { $$ = -$1; }
| L_PAREN add_exp R_PAREN { $$ = $2; }


rel: rel_exp LESS_THAN rel_exp {printf("rel -> rel_exp LESS_THAN rel_exp\n"); } 
| rel_exp GREATER_THAN rel_exp {printf("rel -> rel_exp GREATER_THAN rel_exp\n"); } 
| rel_exp EQUAL_TO rel_exp { printf("rel -> rel_exp EQUAL_TO rel_exp\n"); } 
| rel_exp LESS_EQUAL_TO rel_exp { printf("rel -> rel_exp LESS_EQUAL_TO rel_exp\n"); } 
| rel_exp GREATER_EQUAL_TO rel_exp { printf("rel -> rel_exp GREATER_EQUAL_TO rel_exp\n");} 
| rel_exp NOT_EQUAL_TO rel_exp { printf("rel -> rel_exp NOT_EQUAL_TO rel_exp\n");} 
| L_SQUARE add_exp R_SQUARE { printf("rel -> L_PAREN add_exp R_PAREN\n"); }


var: INT { printf("var -> INT\n"); }
| STRING { printf("var -> STRING\n"); }
| DOUBLE { printf("var -> DOUBLE\n"); }
| CHAR { printf("var -> CHAR\n"); }
| BOOL { printf("var -> BOOL\n"); }
| VOID { printf("var -> VOID\n"); }



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
