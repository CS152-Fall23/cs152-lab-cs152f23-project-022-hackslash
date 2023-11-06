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




"["                 {return L_SQUARE;}
"]"                 {return R_SQUARE;}
"{"                 {return L_CURLY;}
"}"                 {return R_CURLY;}
","                 {return COMMA;}

"("                 {return L_PAREN;}
")"                 {return R_PAREN;}

"="                 {return EQL;}
";" 				{return SEMI;}


"break/"            {return BREAK;}
"if/"               {return IF;}
"else/"             {return ELSE;}
"elseif/"           {return ELIF;}
"in/"               {return IN;}
"out/"              {return OUT;}
"print/"            {return PRINT;}

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
