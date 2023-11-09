%{
    #include <stdio.h>
    
    int yylex(void);
    void yyerror(char const *err) {fprintf(stderr, " (syntax error of some kind) \n");}


%}

/* %define parse.error  */

%token VAR FUNC NUM IDENT L_CURLY L_PAREN L_SQUARE R_CURLY R_PAREN R_SQUARE COMMA SEMI BREAK IF ELIF ELSE IN OUT PRINT WHILE DO LH_ID INT STRING CHAR DOUBLE BOOL VOID
%left ADD SUB
%left MUL DIV
%left LESS_THAN GREATER_THAN EQUAL_TO LESS_EQUAL_TO GREATER_EQUAL_TO NOT_EQUAL_TO EQL
%left R_SQUARE L_SQUARE
%union{
    int num;
}
%start stmt

%%
/* grammar */

stmt: stmt stmt {printf("stmt -> stmt stmt\n");}
| declaration {printf("stmt -> declaration\n");}
| assignment {printf("stmt -> assignment\n");}
| function {printf("stmt -> function\n");}
| break {printf("stmt -> break\n");}
| read_write_stmt {printf("stmt -> read_write_stmt\n");}
| if_stmt {printf("stmt -> if_stmt\n");}
| while_stmt {printf("stmt -> while_stmt\n");}
| %empty {printf("stmt -> epsilon\n");}

assignment: var lh_id EQL rel_exp SEMI {printf("assignment -> var LH_ID = rel_exp;\n");}
| var lh_id EQL IDENT SEMI {printf("assignment -> var LH_ID = IDENT;\n");}
| var L_SQUARE R_SQUARE lh_id EQL rel_exp SEMI {printf("assignment -> var[] LH_ID = rel_exp;\n");}
| var L_SQUARE R_SQUARE lh_id EQL IDENT SEMI {printf("assignment -> var[] LH_ID = IDENT;\n");}
| IDENT EQL rel_exp SEMI {printf("assignment -> IDENT = rel_exp;\n");}
| IDENT EQL IDENT SEMI {printf("assignment -> IDENT = IDENT;");}

declaration: var lh_id SEMI {printf("declaration -> var LH_ID;\n");}
| var L_SQUARE R_SQUARE lh_id SEMI {printf("declaration -> var[] LH_ID;\n");}

lh_id: IDENT {printf("lh_id -> IDENT\n");}
| IDENT COMMA IDENT {printf("lh_id -> IDENT,IDENT\n");}

function: var IDENT L_SQUARE arg R_SQUARE L_CURLY stmt R_CURLY {printf("function -> var IDENT[arg]{stmt}");}
| IDENT L_SQUARE pass_arg R_SQUARE SEMI {printf("function -> IDENT[arg];\n");}

arg: var IDENT {printf("arg -> var IDENT\n");}
| var IDENT COMMA arg {printf("arg -> var IDENT,arg\n");}
| var L_SQUARE R_SQUARE IDENT {printf("arg -> var []IDENT\n");}
| var L_SQUARE R_SQUARE IDENT COMMA arg {printf("arg -> var []IDENT,arg\n");}

pass_arg: rel_exp {printf("pass_arg -> rel_exp\n");}
| rel_exp COMMA pass_arg {printf("pass_arg -> rel_exp, pass_arg\n");}

break: BREAK SEMI{printf("break -> break/\n");}

read_write_stmt: IN IDENT SEMI{printf("read_write_stmt -> in/ ID\n");}
| OUT IDENT SEMI{printf("read_write_stmt -> out/ IDENT\n");}
| PRINT L_SQUARE IDENT R_SQUARE SEMI{printf("read_write -> print/(IDENT)\n");}

while_stmt: WHILE L_SQUARE rel_exp R_SQUARE L_CURLY stmt R_CURLY {printf("while_stmt -> WHILE[rel_exp]{stmt}\n");}
| DO L_CURLY stmt R_CURLY WHILE L_SQUARE rel_exp R_SQUARE {printf("while_stmt -> DO{stmt}WHILE[rel_exp]\n");}

if_stmt: IF L_SQUARE rel_exp R_SQUARE L_CURLY stmt R_CURLY elseif {printf("if_stmt -> IF[rel_exp]{stmt}\n");}

elseif: ELSE L_CURLY stmt R_CURLY {printf("elseif -> ELSE{stmt}\n");}
| ELIF L_SQUARE rel_exp R_SQUARE L_CURLY stmt R_CURLY elseif {printf("elseif -> ELSEIF[rel_exp]{stmt}elseif\n");}
| %empty {printf("elseif -> epsilon\n");}

rel_exp: add_exp {printf("rel_exp -> add_exp\n"); }
| rel {printf("rel_exp -> rel\n"); }

add_exp: mul_exp {printf("add_exp -> mul_exp\n");}
| add_exp ADD add_exp {printf("add_exp -> add_exp ADD add_exp\n");} 
| add_exp SUB add_exp {printf("add_exp -> add_exp SUB add_exp\n");}

mul_exp: exp {printf("mul_exp -> exp\n");}
| mul_exp MUL mul_exp {printf("mul_exp -> mul_exp MUL mul_exp\n");} 
| mul_exp DIV mul_exp {printf("mul_exp -> mul_exp DIV mul_exp\n");} 

exp: NUM {printf("exp -> NUM\n");} 
| IDENT {printf("exp -> IDENT\n");}
| IDENT L_SQUARE add_exp R_SQUARE {printf("exp -> IDENT[add_exp]");}
| SUB exp {printf("exp -> SUB exp\n");}
| L_PAREN add_exp R_PAREN {printf("exp -> L_PAREN add_exp R_PAREN\n");}

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
