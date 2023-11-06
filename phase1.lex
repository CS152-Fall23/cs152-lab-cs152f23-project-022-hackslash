%option noyywrap
%{ 
	//libraries
    #include <math.h>
    #include <stdio.h>
	
    int currLine = 1;
    int currCol = 0;

	#include "y.tab.c"
%}

DIGIT[0-9]
ID[a-z][a-zA-Z0-9]*
LETTER [a-zA-Z]
IDENTIFIER  ({LETTER}({LETTER}|{DIGIT}|"_")*({LETTER}|{DIGIT}))|{LETTER}
FUNCTION  (({LETTER}({LETTER}|{DIGIT}|"_")*({LETTER}|{DIGIT}))|{LETTER})(\(.\))
UNDERSCORE [_]


%%
"int/"+" "{ID}|"double/"+" "{ID}|"string/"+" "{ID}|"bool/"+" "    {return VAR;}




"["                 {return L_SQUARE;}
"]"                 {return R_SQUARE;}
"{"                 {return L_CURLY;}
"}"                 {return R_CURLY;}
","                 {return COMMA;}
"("                 {return L_PAREN;}
")"                 {return R_PAREN;}

"="                 {return EQL;}
";" 				{return SEMI; currCol += yyleng;}


"break/"            {return BREAK; currCol += yyleng;}
"if/"               {return IF; currCol += yyleng;}
"else/"             {return ELSE; currCol += yyleng;}
"elseif/"           {return ELIF; currCol += yyleng;}
"in/"               {return IN; currCol += yyleng;}
"out/"              {return OUT; currCol += yyleng;}
"print/"            {return PRINT; currCol += yyleng;}

"\n"                {currLine++; currCol = 0;}
"while/"            {return WHILE; currCol += yyleng;}
"do/"               {return DO; currCol += yyleng;}
" "					currCol++;
(\*\/)(.|\n)*(\/\*)
"*".*
"\n"                {printf("NEWLINE\n"); currLine += yyleng; currCol = 0;}

{DIGIT}+            {return NUM;}
{IDENTIFIER}	    {return IDENT; currCol += yyleng;}
"add/"              {return ADD; currCol += yyleng;}
"sub/"              {return SUB; currCol += yyleng;}
"mul/"              {return MUL; currCol += yyleng;}
"div/"              {return DIV; currCol += yyleng;}
"lth/"              {return LESS_THAN; currCol += yyleng;}
"gth/"              {return GREATER_THEN; currCol += yyleng;}
"eqt/"              {return EQUAL_TO; currCol += yyleng;}
"lte/"              {return LESS_EQUAL_TO; currCol += yyleng;}
"gte/"              {return GREATER_EQUAL_TO; currCol += yyleng;}
"neq/"              {return NOT_EQUAL_TO; currCol += yyleng;}

({DIGIT}|{UNDERSCORE})+{IDENTIFIER}			{printf("Error at line %d, column %d: identifier \"%s\" must begin with a letter\n", currLine, currCol, yytext); exit(0);}
{IDENTIFIER}{UNDERSCORE}+                   {printf("Error at line %d, column %d: identifier \"%s\" cannot end with an underscore\n", currLine, currCol, yytext); exit(0);}
{FUNCTION}	    {return FUNCTION; currCol += yyleng;}

[ \t\r]     /* NOP */
.                   {printf("Error at line %d. column %d: unrecognized symbol \"%s\"\n", currLine, currCol, yytext);}
%%

int main(int argc, char** argv){
	if (argc >= 2) {
        printf("argument passed\n");
        yyin = fopen(argv[1], "r");

	}
	else {
		yyin = stdin;
	}
	yylex();
	return 0;

}
