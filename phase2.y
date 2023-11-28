%{
    #include <stdio.h>
    
    int yylex(void);
    void yyerror(char const *err){
        printf("Line: %d, Column: %d, Error: %s \n", currLine, currCol, yytext); 
        exit(1);
    }
    static char* genTempName() {
        static unsigned long long counter;
        static char buff[4096]; sprintf(buff, "temp%llu", counter++);
        return strdup(buff);
    }
    typedef struct { char *name; char *value; } VarData;
%}

/* %define parse.error  */

%token VAR FUNC NUM IDENT L_CURLY L_PAREN L_SQUARE R_CURLY R_PAREN R_SQUARE COMMA SEMI BREAK IF ELIF ELSE IN OUT PRINT WHILE DO LH_ID INT STRING CHAR DOUBLE BOOL VOID
%left ADD SUB
%left MUL DIV
%left LESS_THAN GREATER_THAN EQUAL_TO LESS_EQUAL_TO GREATER_EQUAL_TO NOT_EQUAL_TO EQL
%left R_SQUARE L_SQUARE
%union{
    char* num;
    VarData var;
}
%type<num> NUM
%type<var> add_exp mul_exp exp

%start stmts

%%
/* grammar */

stmts: stmt stmts {printf("stmts -> stmt stmts\n");}
| stmt {printf("stmts -> stmt\n");}

stmt: declaration {printf("stmt -> declaration\n");}
| assignment {printf("stmt -> assignment\n");}
| function {printf("stmt -> function\n");}
| break {printf("stmt -> break\n");}
| read_write_stmt {printf("stmt -> read_write_stmt\n");}
| if_stmt {printf("stmt -> if_stmt\n");}
| while_stmt {printf("stmt -> while_stmt\n");}

assignment: lh_assign EQL rel_exp SEMI {printf("assignment -> lh_assign = rel_exp;\n");}

lh_assign: var lh_id {printf("lh_assign -> var lh_id\n");}
| var L_SQUARE R_SQUARE lh_id {printf("lh_assign -> var[]");}
| IDENT {printf("lh_assign -> IDENT");}

declaration: lh_assign SEMI {printf("declaration -> lh_assign;\n");}

lh_id: IDENT {printf("lh_id -> IDENT\n");}
| IDENT COMMA IDENT {printf("lh_id -> IDENT,IDENT\n");}

function: var IDENT L_SQUARE arg R_SQUARE L_CURLY stmts R_CURLY {printf("function -> var IDENT[arg]{stmts}");}
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

while_stmt: WHILE L_SQUARE rel_exp R_SQUARE L_CURLY stmts R_CURLY {printf("while_stmt -> WHILE[rel_exp]{stmts}\n");}
| DO L_CURLY stmts R_CURLY WHILE L_SQUARE rel_exp R_SQUARE {printf("while_stmt -> DO{stmts}WHILE[rel_exp]\n");}

if_stmt: IF L_SQUARE rel_exp R_SQUARE L_CURLY stmts R_CURLY elseif {printf("if_stmt -> IF[rel_exp]{stmts}\n");}
| IF IF L_SQUARE rel_exp R_SQUARE L_CURLY stmts R_CURLY elseif {printf("ERROR - Two if statement declarations at line %d, column %d.", currLine, currCol); exit(1);}

elseif: ELSE L_CURLY stmts R_CURLY {printf("elseif -> ELSE{stmts}\n");}
| ELIF L_SQUARE rel_exp R_SQUARE L_CURLY stmts R_CURLY elseif {printf("elseif -> ELSEIF[rel_exp]{stmts}elseif\n");}
| %empty {printf("elseif -> epsilon\n");}

rel_exp: add_exp {printf("rel_exp -> add_exp\n"); }
| rel {printf("rel_exp -> rel\n"); }

add_exp: mul_exp {
    $$ = $1;  
    printf("add_exp -> mul_exp\n");}
| add_exp ADD add_exp {
    char *name = genTempName();
    printf(". %s\n", name);
    printf("+ %s, %s, %s\n", name, $1.name, $3.name);

    $$.name=name;
    printf("add_exp -> add_exp ADD add_exp\n");} 
    
| add_exp SUB add_exp {printf("add_exp -> add_exp SUB add_exp\n");}

mul_exp: exp {printf("mul_exp -> exp\n");}
| mul_exp MUL mul_exp {printf("mul_exp -> mul_exp MUL mul_exp\n");} 
| mul_exp DIV mul_exp {printf("mul_exp -> mul_exp DIV mul_exp\n");} 

exp: NUM {
    char *name = genTempName();

    printf(". %s\n", name);
    printf("= %s, %s\n", name, $1);

    $$.name = name;
    printf("exp -> NUM\n");
} 
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
