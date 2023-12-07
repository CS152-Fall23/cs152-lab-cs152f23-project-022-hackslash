%{
    #include <stdio.h>
    #include <string.h> 
    #include <stddef.h> 
    #include <stdlib.h> 
    #include <stdbool.h>

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

    int funcCounter = 0;
    bool mainExists = false;
%}

/* %define parse.error  */

%token VAR FUNC NUM IDENT L_CURLY L_PAREN L_SQUARE R_CURLY R_PAREN R_SQUARE COMMA SEMI BREAK IF ELIF ELSE IN OUT PRINT WHILE DO LH_ID INT STRING CHAR DOUBLE BOOL VOID RETURN
%left ADD SUB
%left MUL DIV
%left LESS_THAN GREATER_THAN EQUAL_TO LESS_EQUAL_TO GREATER_EQUAL_TO NOT_EQUAL_TO EQL 
%left R_SQUARE L_SQUARE
%union{
    char* num;
}

%type<num> NUM rel_exp IDENT add_exp mul_exp exp rel read_write_stmt lh_decl if_stmt stmts IF L_CURLY WHILE
%start program

%%
/* grammar */

program: stmts {
    if(!mainExists){
		printf("Error line %d: no main function defined.\n", currLine);
		exit(0);
	}
}

stmts: stmt stmts {}
| stmt { }


///////////////////////////////////////////// STATEMENTS ///////////////////////////////////////////////////
stmt: declaration {}
| assignment {}
| function_decl {}
| break {}
| read_write_stmt {}
| if_stmt {}
| while_stmt {}
| return {}
| expression {}


///////////////////////////////////////////// ASSIGNMENT ///////////////////////////////////////////////////
assignment: IDENT EQL rel_exp SEMI { 
    printf("= %s, %s\n", $1, $3);
}
| IDENT L_SQUARE add_exp R_SQUARE EQL rel_exp SEMI {
    printf("[]= %s, %s, %s\n", $1, $6, $3);
}


///////////////////////////////////////////// DECLARATION ///////////////////////////////////////////////////
declaration: lh_decl SEMI {}


///////////////////////////////////////////// LEFT HAND DECLARE ///////////////////////////////////////////////////
lh_decl: var IDENT {
    if (is_reserved_word($2)) {
        printf("Error: '%s' is a reserved word at line %llu, col %llu\n", $2, currLine, currCol);
        return -1;
    }
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


///////////////////////////////////////////// FUNCTION DECLARE ///////////////////////////////////////////////////
function_decl: var IDENT {
    if (!strcmp($2, "main")){
		 mainExists = true;
	 }
    printf("func %s\n", $2);
} L_PAREN arg R_PAREN L_CURLY stmts R_CURLY {
    printf("endfunc\n");
}


///////////////////////////////////////////// RETURN ///////////////////////////////////////////////////

return: RETURN SEMI { 
    char *name = genTempName();

    printf(". %s\n", name);
    printf("ret %s\n", name);
}
| RETURN rel_exp SEMI { 
    printf("ret %s\n", $2);
 }


///////////////////////////////////////////// ARGUMENTS ///////////////////////////////////////////////////
arg: var IDENT {
    printf(". %s\n", $2);
    printf("= %s, $%d\n", $2, funcCounter);
    funcCounter++;
}
| var IDENT COMMA {
    printf(". %s\n", $2);
    printf("= %s, $%d\n", $2, funcCounter);
    funcCounter++;
} arg
| %empty


///////////////////////////////////////////// PASS ARGUMENTS ///////////////////////////////////////////////////
pass_arg: rel_exp {
    printf("param %s\n", $1);
}
| rel_exp COMMA pass_arg {
    printf("param %s\n", $1);
}
| %empty



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
while_stmt: WHILE {
    char *loop = genLabelName(0);

    printf(": %s\n", loop);

    $1 = loop;
} L_SQUARE rel_exp R_SQUARE L_CURLY {
    char *name = genTempName();
    char *endwhile = genLabelName(0);
    
    printf(". %s\n", name);
    printf("== %s, %s, %s\n", name, "0", $4);

    printf("?:= %s, %s\n", endwhile, name);

    $6 = endwhile;
} stmts R_CURLY { 
    printf(":= %s\n", $1);
    printf(": %s\n", $6); 
}
| DO L_CURLY {
    char* loop = genLabelName(0);
    
    printf(": %s\n", loop);

    $2 = loop;
} stmts R_CURLY WHILE L_SQUARE rel_exp R_SQUARE {
    char* name = genTempName();

    printf(". %s\n", name);
    printf("== %s, %s, %s\n", name, "1", $8);
    printf("?:= %s, %s\n", $2, name);
}



///////////////////////////////////////////// IF STATEMENTS ///////////////////////////////////////////////////
if_stmt: IF L_SQUARE rel_exp R_SQUARE L_CURLY {
    char *endif = genLabelName(0);
    char *elsestmt = genLabelName(0);
    char *name = genTempName();
    printf(". %s\n", name);
    printf("== %s, %s, %s\n", name, "0", $3);

    printf("?:= %s, %s\n", elsestmt, name);

    $1 = endif;
    $5 = elsestmt;
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


///////////////////////////////////////////// IF STATEMENTS ///////////////////////////////////////////////////
expression: rel_exp SEMI { }


/////////////////////////////////////////////  EXPRESSIONS ///////////////////////////////////////////////////
rel_exp: add_exp{ $$ = $1; }
| rel { $$ = $1; }


///////////////////////////////////////////// ADD/SUB OPERATORS ///////////////////////////////////////////////////
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


///////////////////////////////////////////// MUL/DIV OPERATORS ///////////////////////////////////////////////////
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
| IDENT { funcCounter = 0; } L_PAREN pass_arg R_PAREN {
    char *name = genTempName();

    printf(". %s\n", name);
    printf("call %s, %s\n", $1, name);

    $$ = name;
} 
| SUB exp { 
    char *name = genTempName();
    printf(". %s\n", name);
    printf("- %s, %s, %s\n", name, "0", $2);
    $$ = name;
}
| L_PAREN add_exp R_PAREN { }


///////////////////////////////////////////// RELATIONAL OPERATORS ///////////////////////////////////////////////////
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
int is_reserved_word(const char *word) {
    const char *reserved_words[] = {"true", "false", "VAR", "FUNC", "NUM", "IDENT", "L_CURLY", "L_PAREN", "L_SQUARE", 
    "R_CURLY", "R_PAREN", "R_SQUARE", "COMMA", "SEMI", "BREAK",
    "IF", "ELIF", "ELSE", "IN", "OUT", "PRINT", "WHILE", "DO", "LH_ID",
    "INT", "STRING", "CHAR", "DOUBLE", "BOOL", "VOID", "RETURN", 
    "ADD", "SUB", "MUL", "DIV", "LESS_THAN", "GREATER_THAN",
    "EQUAL_TO", "LESS_EQUAL_TO", "GREATER_EQUAL_TO", "NOT_EQUAL_TO", "EQL", "R_SQUARE", "L_SQUARE"};
    int i;
    for (i = 0; i < sizeof(reserved_words) / sizeof(reserved_words[0]); i++) {
        if (strcmp(word, reserved_words[i]) == 0) {
            return 1;
        }
    }

    return 0;
}

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