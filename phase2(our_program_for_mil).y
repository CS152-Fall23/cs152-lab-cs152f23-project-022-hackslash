%{
    #include <stdio.h>
    #include <string.h>
    
    int yylex(void);
    void yyerror(char const *err){
        printf("Line: %d, Column: %d, Error: %s \n", currLine, currCol, yytext); 
        exit(-1);
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
    int num;
    VarData var; 
}

%type<num> NUM 
%type<var> add_exp mul_exp exp 

%start program

%%
/* grammar */
program: { printf("func main\n"); } stmts { printf("endfunc\n"); } { printf("Normal program proc!\n"); }
 
stmts: stmt stmts {printf("Normal statement proc!\n");}
| stmt {printf("Normal statement proc!\n");}

stmt: declaration {}
| assignment {}
| function {}
| break {}
| read_write_stmt {}
| if_stmt {}
| while_stmt {}

assignment: lh_assign EQL rel_exp SEMI {}

declaration: lh_assign SEMI {}

lh_assign: var lh_id {}
| var L_SQUARE R_SQUARE lh_id {}
| IDENT {}

lh_id: IDENT {}
| IDENT COMMA IDENT {}

function: var IDENT L_SQUARE arg R_SQUARE L_CURLY stmts R_CURLY {}
| IDENT L_SQUARE pass_arg R_SQUARE SEMI {}

arg: var IDENT {}
| var IDENT COMMA arg {}
| var L_SQUARE R_SQUARE IDENT {}
| var L_SQUARE R_SQUARE IDENT COMMA arg {}

pass_arg: rel_exp {}
| rel_exp COMMA pass_arg {}

break: BREAK SEMI{}

read_write_stmt: IN IDENT SEMI{}
| OUT IDENT SEMI{}
| PRINT L_SQUARE IDENT R_SQUARE SEMI{}

while_stmt: WHILE L_SQUARE rel_exp R_SQUARE L_CURLY stmts R_CURLY {}
| DO L_CURLY stmts R_CURLY WHILE L_SQUARE rel_exp R_SQUARE {}

if_stmt: IF L_SQUARE rel_exp R_SQUARE L_CURLY stmts R_CURLY elseif {}
| IF IF L_SQUARE rel_exp R_SQUARE L_CURLY stmts R_CURLY elseif {}

elseif: ELSE L_CURLY stmts R_CURLY {}
| ELIF L_SQUARE rel_exp R_SQUARE L_CURLY stmts R_CURLY elseif {}
| %empty {}

rel_exp: add_exp {}
| rel {}

add_exp: mul_exp { $$ = $1; }
| add_exp ADD add_exp {
    char *name = genTempName(); 

    printf(". %s\n", name); 
    printf("+ %s, %s, %s\n", name, $1.name, $3.name); 

    $$.name = name; 
} 
| add_exp SUB add_exp {
    char *name = genTempName(); 

    printf(". %s\n", name); 
    printf("+ %s, %s, %s\n", name, $1.name, $3.name); 

    $$.name = name; 
}

mul_exp: exp { $$ = $1; }
| mul_exp MUL mul_exp {
    char *name = genTempName(); 

    printf(". %s\n", name); 
    printf("+ %s, %s, %s\n", name, $1.name, $3.name); 

    $$.name = name; 
} 
| mul_exp DIV mul_exp {
    char *name = genTempName(); 

    printf(". %s\n", name); 
    printf("+ %s, %s, %s\n", name, $1.name, $3.name); 

    $$.name = name; 
} 

exp: NUM { 
    char *name = genTempName(); 
    
    printf(". %s\n", name); 
    printf("= %s, %s\n", name, $1); 

    $$.name = name;
    } 
| IDENT {}
| IDENT L_SQUARE add_exp R_SQUARE {}
| SUB exp {}
| L_PAREN add_exp R_PAREN {}

rel: rel_exp LESS_THAN rel_exp {} 
| rel_exp GREATER_THAN rel_exp {} 
| rel_exp EQUAL_TO rel_exp {}  
| rel_exp LESS_EQUAL_TO rel_exp { } 
| rel_exp GREATER_EQUAL_TO rel_exp { } 
| rel_exp NOT_EQUAL_TO rel_exp { } 
| L_SQUARE add_exp R_SQUARE { }


var: INT {  }
| STRING {  }
| DOUBLE {  }
| CHAR {  }
| BOOL {  }
| VOID { }



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