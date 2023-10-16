%option noyywrap
%{ 
    #include <math.h>
    #include <stdio.h>
	
    int currLine = 1;
    int currCol = 0;
%}

DIGIT[0-9]
ID[a-z][a-zA-Z0-9]*
LETTER [a-zA-Z]
IDENTIFIER  ({LETTER}({LETTER}|{DIGIT}|"_")*({LETTER}|{DIGIT}))|{LETTER}
UNDERSCORE [_]


%%
";" 				{printf("SEMICOLON\n"); currCol += yyleng;}
"/"					{printf("SLASH\n"); currCol += yyleng;}


"break/"            {printf("Break statement: %s\n", yytext); currCol += yyleng;}
"if/"               {printf("IF/\n"); currCol += yyleng;}
"else/"             {printf("ELSE/\n"); currCol += yyleng;}
"elseif/"           {printf("ELSEIF/\n"); currCol += yyleng;}
"in/"               {printf("IN/\n"); currCol += yyleng;}
"out/"              {printf("OUT/\n"); currCol += yyleng;}
"print/"            {printf("PRINT/\n"); currCol += yyleng;}
"\n"                {printf("NEWLINE\n"); currLine += yyleng; currCol = 0;}


{IDENTIFIER}	    {printf("IDENT %s\n", yytext); currCol += yyleng;}

({DIGIT}|{UNDERSCORE})+{IDENTIFIER}			{printf("Error at line %d, column %d: identifier \"%s\" must begin with a letter\n", currLine, currCol, yytext); exit(0);}
{IDENTIFIER}{UNDERSCORE}+                   {printf("Error at line %d, column %d: identifier \"%s\" cannot end with an underscore\n", currLine, currCol, yytext); exit(0);}

.                   {printf("Error at line %d. column %d: unrecognized symbol \"%s\"\n", currLine, currCol, yytext);}
%%

int main(int argc, char** argv){
	if (argc >= 2) {
        printf("argument passed");
        yyin = fopen(argv[1], "r");

	}
	else {
		yyin = stdin;
	}
	yylex();
	return 0;

}