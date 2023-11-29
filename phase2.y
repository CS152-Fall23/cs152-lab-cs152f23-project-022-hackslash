%{
    #include <stdio.h>
    #include <string.h> 
    
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

    typedef struct { char *name; char *value; } VarData;

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
    char* label; 
    VarData var;
}

%type<num> NUM rel_exp if_stmt IDENT
%type<var> add_exp mul_exp exp rel read_write_stmt lh_assign
%start stmts

%%
/* grammar */

stmts: stmt stmts {printf("Normal statement proc!\n");}
| stmt {printf("Normal statement proc!\n");}


///////////////////////////////////////////// STATEMENTS ///////////////////////////////////////////////////
stmt: declaration {}
| assignment {}
| function {}
| break {}
| read_write_stmt {}
| if_stmt {}
| while_stmt {}



///////////////////////////////////////////// ASSIGNMENT ///////////////////////////////////////////////////
assignment: lh_assign EQL rel_exp SEMI {}



///////////////////////////////////////////// DECLARATION ///////////////////////////////////////////////////
declaration: lh_assign SEMI {}


///////////////////////////////////////////// LEFT HAND ASSIGN ///////////////////////////////////////////////////
lh_assign: var lh_id {}
| var L_SQUARE NUM R_SQUARE lh_id {
    char *name = genTempName();
    printf(".[]< %s, %s\n", name, $3);

    $$.name=name;
}
| IDENT {}


///////////////////////////////////////////// LEFT HAND ID ///////////////////////////////////////////////////
lh_id: IDENT {}
| IDENT COMMA IDENT {}


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
if_stmt: IF L_SQUARE rel_exp R_SQUARE L_CURLY stmts R_CURLY { } 
| IF IF L_SQUARE rel_exp R_SQUARE L_CURLY stmts R_CURLY elseif {}



///////////////////////////////////////////// ELSEIF STATEMENTS ///////////////////////////////////////////////////
elseif: ELSE L_CURLY stmts R_CURLY {}
| ELIF L_SQUARE rel_exp R_SQUARE L_CURLY stmts R_CURLY elseif {}
| %empty {}



/////////////////////////////////////////////  EXPRESSIONS ///////////////////////////////////////////////////
rel_exp: add_exp{ }
| rel { }


///////////////////////////////////////////// ADD/SUB EXPRESSIONS ///////////////////////////////////////////////////
add_exp: mul_exp {
    $$ = $1;  
}
| add_exp ADD add_exp {
    char *name = genTempName();
    printf(". %s\n", name);
    printf("+ %s, %s, %s\n", name, $1.name, $3.name);

    $$.name=name;
    } 
| add_exp SUB add_exp {
    char *name = genTempName();
    printf(". %s\n", name);
    printf("- %s, %s, %s\n", name, $1.name, $3.name);

    $$.name=name;
}


///////////////////////////////////////////// MUL/DIV EXPRESSIONS ///////////////////////////////////////////////////
mul_exp: exp {}
| mul_exp MUL mul_exp {
    char *name = genTempName();
    printf(". %s\n", name);
    printf("* %s, %s, %s\n", name, $1.name, $3.name);

    $$.name=name;
} 
| mul_exp DIV mul_exp {
    char *name = genTempName();
    printf(". %s\n", name);
    printf("/ %s, %s, %s\n", name, $1.name, $3.name);

    $$.name=name;
} 


///////////////////////////////////////////// EXPRESSIONS ///////////////////////////////////////////////////
exp: NUM {
    char *name = genTempName();

    printf(". %s\n", name);
    printf("= %s, %s\n", name, $1);

    $$.name = name;
} 
| IDENT { }
| IDENT L_SQUARE add_exp R_SQUARE { }
| SUB exp { }
| L_PAREN add_exp R_PAREN { }


///////////////////////////////////////////// RELATIONAL EXPRESSIONS ///////////////////////////////////////////////////
rel: rel_exp LESS_THAN rel_exp {     
    char *name = genTempName();
    printf(". %s\n", name);
    printf("< %s, %s, %s\n", name, $1, $3);

    $$.name=name; 
} 
| rel_exp GREATER_THAN rel_exp { 
    char *name = genTempName();
    printf(". %s\n", name);
    printf("> %s, %s, %s\n", name, $1, $3);

    $$.name=name; 
 } 
| rel_exp EQUAL_TO rel_exp { 
    char *name = genTempName();
    printf(". %s\n", name);
    printf("== %s, %s, %s\n", name, $1, $3);

    $$.name=name; 
} 
| rel_exp LESS_EQUAL_TO rel_exp { 
    char *name = genTempName();
    printf(". %s\n", name);
    printf("<= %s, %s, %s\n", name, $1, $3);

    $$.name=name; 
 } 
| rel_exp GREATER_EQUAL_TO rel_exp { 
    char *name = genTempName();
    printf(". %s\n", name);
    printf(">= %s, %s, %s\n", name, $1, $3);

    $$.name=name; 
} 
| rel_exp NOT_EQUAL_TO rel_exp { 
    char *name = genTempName();
    printf(". %s\n", name);
    printf("!= %s, %s, %s\n", name, $1, $3);

    $$.name=name; 
} 
| L_SQUARE add_exp R_SQUARE { }


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