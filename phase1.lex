%option noyywrap
%{ 
	//libraries
    #include <math.h>
    #include <stdio.h>
	
    int currLine = 1;
    int currCol = 0;

	#include "phase2.tab.c"
%}

DIGIT[0-9]
ID[a-z][a-zA-Z0-9]*
LETTER [a-zA-Z]
IDENTIFIER  ({LETTER}({LETTER}|{DIGIT}|"_")*({LETTER}|{DIGIT}))|{LETTER}
FUNCTION  (({LETTER}({LETTER}|{DIGIT}|"_")*({LETTER}|{DIGIT}))|{LETTER})(\(.\))
UNDERSCORE [_]


%%
"int/" 				{currCol += yyleng; return INT;}
"double/"			{currCol += yyleng; return DOUBLE;}
"string/"			{currCol += yyleng; return STRING;}
"bool/"				{currCol += yyleng; return BOOL;}
"char/"				{currCol += yyleng; return CHAR;}
"void/"				{currCol += yyleng; return VOID;}


"["                 {currCol += yyleng; return L_SQUARE;}
"]"                 {currCol += yyleng; return R_SQUARE;}
"{"                 {currCol += yyleng; return L_CURLY;}
"}"                 {currCol += yyleng; return R_CURLY;}
","                 {currCol += yyleng; return COMMA;}
"("                 {currCol += yyleng; return L_PAREN;}
")"                 {currCol += yyleng; return R_PAREN;}

"="                 {currCol += yyleng; return EQL;}
";" 				{currCol += yyleng; return SEMI;}


"break/"            {currCol += yyleng; return BREAK;}
"if/"               {currCol += yyleng; return IF;}
"else/"             {currCol += yyleng; return ELSE;}
"elseif/"           {currCol += yyleng; return ELIF;}
"in/"               {currCol += yyleng; return IN;}
"out/"              {currCol += yyleng; return OUT;}
"print/"            {currCol += yyleng; return PRINT;}

"\n"                {currLine++; currCol = 0;}
"while/"            {currCol += yyleng; return WHILE;}
"do/"               {currCol += yyleng; return DO;}
" "					currCol++;
(\*\/)(.|\n)*(\/\*)
"*".*

{DIGIT}+            {return NUM;}
{IDENTIFIER}	    {currCol += yyleng; return IDENT;}
"add/"              {currCol += yyleng; return ADD;}
"sub/"              {currCol += yyleng; return SUB;}
"mul/"              {currCol += yyleng; return MUL;}
"div/"              {currCol += yyleng; return DIV;}
"lth/"              {currCol += yyleng; return LESS_THAN;}
"gth/"              {currCol += yyleng; return GREATER_THAN;}
"eqt/"              {currCol += yyleng; return EQUAL_TO;}
"lte/"              {currCol += yyleng; return LESS_EQUAL_TO;}
"gte/"              {currCol += yyleng; return GREATER_EQUAL_TO;}
"neq/"              {currCol += yyleng; return NOT_EQUAL_TO;}

({DIGIT}|{UNDERSCORE})+{IDENTIFIER}			{printf("Error at line %d, column %d: identifier \"%s\" must begin with a letter\n", currLine, currCol, yytext); exit(0);}
{IDENTIFIER}{UNDERSCORE}+                   {printf("Error at line %d, column %d: identifier \"%s\" cannot end with an underscore\n", currLine, currCol, yytext); exit(0);}
{FUNCTION}	    {return FUNC; currCol += yyleng;}

[ \t\r]     /* NOP */
.                   {printf("Error at line %d. column %d: unrecognized symbol \"%s\"\n", currLine, currCol, yytext);}
%%

int main(int argc, char** argv){
	if (argc >= 2) {
        printf("argument passed\n");
        if((yyin = fopen(argv[1], "r")) < 0) { printf("hey couldn't open file %s\n", argv[1]); exit(-1); }

	}
	else {
		yyin = stdin;
	}
	yyparse();
	return 0;

}
