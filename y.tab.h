/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    VAR = 258,
    FUNC = 259,
    NUM = 260,
    IDENT = 261,
    L_CURLY = 262,
    L_PAREN = 263,
    L_SQUARE = 264,
    R_CURLY = 265,
    R_PAREN = 266,
    R_SQUARE = 267,
    COMMA = 268,
    SEMI = 269,
    BREAK = 270,
    IF = 271,
    ELIF = 272,
    ELSE = 273,
    IN = 274,
    OUT = 275,
    PRINT = 276,
    WHILE = 277,
    DO = 278,
    LH_ID = 279,
    INT = 280,
    STRING = 281,
    CHAR = 282,
    DOUBLE = 283,
    BOOL = 284,
    VOID = 285,
    ADD = 286,
    SUB = 287,
    MUL = 288,
    DIV = 289,
    LESS_THAN = 290,
    GREATER_THAN = 291,
    EQUAL_TO = 292,
    LESS_EQUAL_TO = 293,
    GREATER_EQUAL_TO = 294,
    NOT_EQUAL_TO = 295,
    EQL = 296
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 17 "phase2.y" /* yacc.c:1909  */

    int num;

#line 100 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
