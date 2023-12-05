%{
    #include <stdio.h>
    #include <string.h> 
    #include <stddef.h> 
    #include <stdlib.h> 

    typedef struct { char **data; size_t len; } Vec; 
    static void VecPush(Vec *vec, char *cstring) {
        if( !(vec->data = realloc(vec->data, sizeof(char *)*(vec->len + 1)))) {
            printf("bad_alloc\n"); exit(-1); 
        }
        vec->data[vec->len++] = cstring; 
    }

    static Vec vec; 
    
    int yylex(void);
    void yyerror(char const *err){
        printf("Line: %d, Column: %d, Error: %s \n", currLine, currCol, yytext); 
        //exit(1);
    }

    static char* genTempName() {
        static unsigned long long counter;
        static char buff[4096]; sprintf(buff, "temp%llu", counter++);
        return strdup(buff);
    }

    static char* genLabelName(int offset) {
        static unsigned long long counter; 
        static char buff[4096]; 

        switch(offset) {
            case 0: { sprintf(buff, "label%llu", counter++); } break; 
            default: { sprintf(buff, "label%llu", counter + offset); } break; 
        }

        return strdup(buff); 
    }
%}

/* %define parse.error  */

%token VAR FUNC NUM IDENT L_CURLY L_PAREN L_SQUARE R_CURLY R_PAREN R_SQUARE COMMA SEMI BREAK IF ELIF ELSE IN OUT PRINT WHILE DO LH_ID INT STRING CHAR DOUBLE BOOL VOID
%left ADD SUB
%left MUL DIV
%left LESS_THAN GREATER_THAN EQUAL_TO LESS_EQUAL_TO GREATER_EQUAL_TO NOT_EQUAL_TO EQL 
%left R_SQUARE L_SQUARE
%union{
    char* num;
}

%type<num> NUM rel_exp IDENT add_exp mul_exp exp rel read_write_stmt lh_decl if_stmt stmts IF L_CURLY
%start program

%%
/* grammar */

program: {printf("func main\n");} stmts {printf("endfunc\n");}

stmts: stmt stmts {}
| stmt {}


///////////////////////////////////////////// STATEMENTS ///////////////////////////////////////////////////
stmt: declaration {}
| assignment {}
| function {}
| break {}
| read_write_stmt {}
| if_stmt {}
| while_stmt {}



///////////////////////////////////////////// ASSIGNMENT ///////////////////////////////////////////////////
assignment: IDENT EQL rel_exp SEMI { 
    printf("= %s, %s\n", $1, $3);
}
| IDENT L_SQUARE add_exp R_SQUARE EQL rel_exp SEMI {
    printf("[]= %s, %s, %s\n", $1, $6, $3);
}


///////////////////////////////////////////// DECLARATION ///////////////////////////////////////////////////
declaration: lh_decl SEMI {}


///////////////////////////////////////////// LEFT HAND ASSIGN ///////////////////////////////////////////////////
lh_decl: var IDENT {
    printf(". %s\n", $2);

    $$=$2;
}
| var L_SQUARE NUM R_SQUARE IDENT {
    int x = atoi($3);
    if (x <= 0){
        printf("Array declaration at line: %llu, of less than 0: %s\n", currLine, $5    );
        exit(1);
    }

    printf(".[] %s, %s\n", $5, $3);

    $$=$5;
}


///////////////////////////////////////////// FUNCTIONS ///////////////////////////////////////////////////
function: var IDENT L_SQUARE arg R_SQUARE L_CURLY stmts R_CURLY {}
| IDENT L_SQUARE pass_arg R_SQUARE SEMI {}


///////////////////////////////////////////// ARGUMENT ///////////////////////////////////////////////////
arg: var IDENT {}
| var IDENT COMMA arg {}
| var L_SQUARE R_SQUARE IDENT {}
| var L_SQUARE R_SQUARE IDENT COMMA arg {}


///////////////////////////////////////////// ADD/SUB EXPRESSIONS ///////////////////////////////////////////////////
pass_arg: rel_exp {}
| rel_exp COMMA pass_arg {}



///////////////////////////////////////////// BREAK ///////////////////////////////////////////////////
break: BREAK SEMI{}


///////////////////////////////////////////// READ/WRITE STATEMENTS ///////////////////////////////////////////////////
read_write_stmt: IN IDENT SEMI {
    printf(".< %s\n", $2);
}
| OUT IDENT SEMI {
    printf(".> %s\n", $2);
}
| PRINT L_SQUARE IDENT R_SQUARE SEMI{}


///////////////////////////////////////////// WHILE STATEMENTS ///////////////////////////////////////////////////
while_stmt: WHILE L_SQUARE rel_exp R_SQUARE L_CURLY stmts R_CURLY {}
| DO L_CURLY stmts R_CURLY WHILE L_SQUARE rel_exp R_SQUARE {}



///////////////////////////////////////////// IF STATEMENTS ///////////////////////////////////////////////////
if_stmt: IF L_SQUARE rel_exp R_SQUARE L_CURLY {
    char *label = genLabelName(0);
    char *label1 = genLabelName(0);
    char *name = genTempName();
    printf(". %s\n", name);
    printf("== %s, %s, %s\n", name, "0", $3);

    printf("?:= %s, %s\n", label1, name);

    $1 = label;
    $5 = label1;
} stmts R_CURLY {
    printf(":= %s\n", $1);
    printf(": %s\n", $5);
} else {
    printf(": %s\n", $1);
} 
| IF IF L_SQUARE rel_exp R_SQUARE L_CURLY stmts R_CURLY else {}



///////////////////////////////////////////// ELSE STATEMENTS ///////////////////////////////////////////////////
else: ELSE L_CURLY stmts R_CURLY { }
| %empty {}



/////////////////////////////////////////////  EXPRESSIONS ///////////////////////////////////////////////////
rel_exp: add_exp{ $$ = $1; }
| rel { $$ = $1; }


///////////////////////////////////////////// ADD/SUB EXPRESSIONS ///////////////////////////////////////////////////
add_exp: mul_exp { $$ = $1; }
| add_exp ADD add_exp {
    char *name = genTempName();
    printf(". %s\n", name);
    printf("+ %s, %s, %s\n", name, $1, $3);

    $$=name;
    } 
| add_exp SUB add_exp {
    char *name = genTempName();
    printf(". %s\n", name);
    printf("- %s, %s, %s\n", name, $1, $3);

    $$=name;
}


///////////////////////////////////////////// MUL/DIV EXPRESSIONS ///////////////////////////////////////////////////
mul_exp: exp { $$ = $1; }
| mul_exp MUL mul_exp {
    char *name = genTempName();
    printf(". %s\n", name);
    printf("* %s, %s, %s\n", name, $1, $3);

    $$=name;
} 
| mul_exp DIV mul_exp {
    char *name = genTempName();
    printf(". %s\n", name);
    printf("/ %s, %s, %s\n", name, $1, $3);

    $$=name;
} 


///////////////////////////////////////////// EXPRESSIONS ///////////////////////////////////////////////////
exp: NUM {
    /*int i = 0; 
    for( i = 0; i < vec.len; ++i) {
        if(0 == strcmp(vec.data[i], $1)) {
            printf("Oh no, a unique semantic error message!\n"); 
            exit(-1);
        }
    }

    VecPush(&vec, $1); */

    char *name = genTempName();

    printf(". %s\n", name);
    printf("= %s, %s\n", name, $1);

    $$ = name;
} 
| IDENT { $$ = $1; }
| IDENT L_SQUARE add_exp R_SQUARE { 
    char *name = genTempName();

    printf(". %s\n", name);
    printf("=[] %s, %s, %s\n", name, $1, $3);

    $$ = name;
 }
| SUB exp { 
    char *name = genTempName();
    printf(". %s\n", name);
    printf("- %s, %s, %s\n", name, "0", $2);
    $$ = name;
}
| L_PAREN add_exp R_PAREN { }


///////////////////////////////////////////// RELATIONAL EXPRESSIONS ///////////////////////////////////////////////////
rel: add_exp LESS_THAN add_exp {     
    char *name = genTempName();
    printf(". %s\n", name);
    printf("< %s, %s, %s\n", name, $1, $3);

    $$=name; 
} 
| add_exp GREATER_THAN add_exp { 
    char *name = genTempName();
    printf(". %s\n", name);
    printf("> %s, %s, %s\n", name, $1, $3);

    $$=name; 
 } 
| add_exp EQUAL_TO add_exp { 
    char *name = genTempName();
    printf(". %s\n", name);
    printf("== %s, %s, %s\n", name, $1, $3);

    $$=name; 
} 
| add_exp LESS_EQUAL_TO add_exp { 
    char *name = genTempName();
    printf(". %s\n", name);
    printf("<= %s, %s, %s\n", name, $1, $3);

    $$=name; 
 } 
| add_exp GREATER_EQUAL_TO add_exp { 
    char *name = genTempName();
    printf(". %s\n", name);
    printf(">= %s, %s, %s\n", name, $1, $3);

    $$=name; 
} 
| add_exp NOT_EQUAL_TO add_exp { 
    char *name = genTempName();
    printf(". %s\n", name);
    printf("!= %s, %s, %s\n", name, $1, $3);

    $$=name; 
} 


///////////////////////////////////////////// VARIABLES ///////////////////////////////////////////////////
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