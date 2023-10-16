%{
#include <stdio.h>
#include <math.h>

unsigned long long current_line = 1;
unsigned long long current_column = 0;
#define YY_USER_ACTION current_column += yyleng; 
%}

%option noyywrap

DIGIT [0-9]
DIGIT_UNDERSCORE [0-9_]
LETTER [a-zA-Z]
LETTER_UNDERSCORE [a-zA-Z_]
CHAR [0-9a-zA-Z_]
ALPHANUMER [0-9a-zA-Z]
WHITESPACE [\t ]
NEWLINE [\n]

/* Define rules */
%%

%%