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
"int/"+" "{ID}|"double/"+" "{ID}|"string/"+" "{ID}|"bool/"+" "     printf( "An Variable: %s\n", yytext );




"["                 {printf("Left Square Bracket \n");}
"]"                 {printf("Right Square Bracket \n");}
"{"                 {printf("Left Curly Brace \n");}
"}"                 {printf("Right Curly Brace \n");}
","                 {printf("Comma \n");}

"("                 {printf("Left Parenthesis \n");}
")"                 {printf("Right Parenthesis \n");}

"="                 {printf("Assignment: %s\n", yytext);}
";" 				{printf("SEMICOLON\n"); currCol += yyleng;}


"break/"            {printf("Break statement: %s\n", yytext); currCol += yyleng;}
"if/"               {printf("IF/\n"); currCol += yyleng;}
"else/"             {printf("ELSE/\n"); currCol += yyleng;}
"elseif/"           {printf("ELSEIF/\n"); currCol += yyleng;}
"in/"               {printf("IN/\n"); currCol += yyleng;}
"out/"              {printf("OUT/\n"); currCol += yyleng;}
"print/"            {printf("PRINT/\n"); currCol += yyleng;}

"\n"                currLine++; currCol = 0;
"while/"            {printf("WHILE/\n"); currCol += yyleng;}
"do/"               {printf("DO/(WHILE)\n"); currCol += yyleng;}
" "					currCol++;
(\*\/)(.|\n)*(\/\*)
"*".*
"\n"                {printf("NEWLINE\n"); currLine += yyleng; currCol = 0;}
"while/"            {printf("WHILE/\n"); currCol += yyleng;}
"do/"               {printf("DO/(WHILE)\n"); currCol += yyleng;}

{DIGIT}+            {printf("INT %d\n", atoi(yytext));}
{IDENTIFIER}	    {printf("IDENT %s\n", yytext); currCol += yyleng;}
(add\/)|(sub\/)|(mul\/)|(div\/)        {printf("ARITHMETIC OP: %s\n", yytext); currCol += yyleng;}
(lth\/)|(gth\/)|(eqt\/)|(lte\/)|(gte\/)|(neq\/)        {printf("RELATIONAL OP: %s\n", yytext); currCol += yyleng;}
({DIGIT}|{UNDERSCORE})+{IDENTIFIER}			{printf("Error at line %d, column %d: identifier \"%s\" must begin with a letter\n", currLine, currCol, yytext); exit(0);}
{IDENTIFIER}{UNDERSCORE}+                   {printf("Error at line %d, column %d: identifier \"%s\" cannot end with an underscore\n", currLine, currCol, yytext); exit(0);}
{FUNCTION}	    {printf("FUNCTION %s\n", yytext); currCol += yyleng;}

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