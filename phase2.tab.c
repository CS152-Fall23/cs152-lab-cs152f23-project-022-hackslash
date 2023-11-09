/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.4"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 1 "phase2.y" /* yacc.c:339  */

    #include <stdio.h>
    
    int yylex(void);
    void yyerror(char const *err) {fprintf(stderr, " (syntax error of some kind) \n");}



#line 75 "phase2.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif


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
#line 17 "phase2.y" /* yacc.c:355  */

    int num;

#line 158 "phase2.tab.c" /* yacc.c:355  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);



/* Copy the second part of user declarations.  */

#line 175 "phase2.tab.c" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  33
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   246
#define YYLAST   345

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  42
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  19
/* YYNRULES -- Number of rules.  */
#define YYNRULES  64
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  151

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   296

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    25,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    35,    36,    37,    38,    39,    40,    42,    43,    45,
      46,    48,    49,    51,    52,    53,    54,    56,    57,    59,
      61,    62,    63,    65,    66,    68,    70,    71,    72,    74,
      75,    77,    78,    79,    81,    82,    83,    85,    86,    87,
      88,    89,    92,    93,    94,    95,    96,    97,    98,   101,
     102,   103,   104,   105,   106
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "VAR", "FUNC", "NUM", "IDENT", "L_CURLY",
  "L_PAREN", "L_SQUARE", "R_CURLY", "R_PAREN", "R_SQUARE", "COMMA", "SEMI",
  "BREAK", "IF", "ELIF", "ELSE", "IN", "OUT", "PRINT", "WHILE", "DO",
  "LH_ID", "INT", "STRING", "CHAR", "DOUBLE", "BOOL", "VOID", "ADD", "SUB",
  "MUL", "DIV", "LESS_THAN", "GREATER_THAN", "EQUAL_TO", "LESS_EQUAL_TO",
  "GREATER_EQUAL_TO", "NOT_EQUAL_TO", "EQL", "$accept", "stmt",
  "assignment", "declaration", "lh_id", "function", "arg", "pass_arg",
  "break", "read_write_stmt", "while_stmt", "if_stmt", "elseif", "rel_exp",
  "add_exp", "mul_exp", "exp", "rel", "var", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296
};
# endif

#define YYPACT_NINF -112

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-112)))

#define YYTABLE_NINF -1

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     315,    -1,    16,    44,    53,    67,    57,    72,    76,  -112,
    -112,  -112,  -112,  -112,  -112,    35,  -112,  -112,  -112,  -112,
    -112,  -112,  -112,     8,     4,    10,  -112,     4,    71,   120,
      99,     4,   315,  -112,   315,    18,    95,    -8,  -112,   129,
     112,   112,   112,   134,   119,   105,    60,  -112,  -112,    20,
     125,    40,  -112,  -112,   136,    62,   172,    -5,   175,   177,
    -112,    63,   112,    93,   111,  -112,   170,     4,     4,     4,
       4,     4,     4,     4,   112,   112,   112,   112,  -112,  -112,
     178,   176,   179,   167,   184,   113,  -112,   191,    29,    73,
     131,   121,  -112,  -112,  -112,  -112,  -112,  -112,  -112,  -112,
    -112,  -112,  -112,  -112,  -112,  -112,   315,  -112,   315,   196,
     199,   195,   198,  -112,    83,  -112,  -112,  -112,   197,   222,
       4,   315,    -5,   203,   126,   137,   132,  -112,    74,   247,
    -112,   201,  -112,  -112,   202,   208,  -112,  -112,  -112,    -5,
       4,   315,  -112,    91,   272,   214,  -112,   315,   297,   132,
    -112
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
      10,     0,     0,     0,     0,     0,     0,     0,     0,    59,
      60,    62,    61,    63,    64,     0,     4,     3,     5,     6,
       7,     9,     8,     0,     0,     0,    29,     0,     0,     0,
       0,     0,    10,     1,     2,    19,     0,     0,    47,    48,
       0,     0,     0,     0,    27,    39,    41,    44,    40,    48,
       0,     0,    30,    31,     0,     0,     0,     0,     0,     0,
      17,     0,     0,     0,     0,    50,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    16,    15,
       0,     0,     0,     0,     0,     0,    20,    19,     0,    48,
       0,     0,    51,    58,    22,    28,    52,    53,    54,    55,
      56,    57,    42,    43,    45,    46,    10,    32,    10,     0,
       0,    23,     0,    18,     0,    12,    11,    49,     0,     0,
       0,    10,     0,     0,    48,     0,    38,    33,     0,     0,
      24,    25,    14,    13,     0,     0,    35,    34,    21,     0,
       0,    10,    26,     0,     0,     0,    36,    10,     0,    38,
      37
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -112,     0,  -112,  -112,   171,  -112,  -111,   162,  -112,  -112,
    -112,  -112,    82,   -24,   -36,   103,   192,  -112,   -55
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    34,    16,    17,    37,    18,    84,    43,    19,    20,
      21,    22,   136,    44,    45,    46,    47,    48,    23
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_uint8 yytable[] =
{
      15,    50,    85,    51,    63,    64,    60,    55,    24,    38,
      39,   130,    40,    41,    35,    38,    49,    36,    40,    41,
       9,    10,    11,    12,    13,    14,    91,    57,   142,    62,
      26,    58,    56,    61,    78,    33,    42,    90,   102,   103,
      25,     1,    42,   113,    96,    97,    98,    99,   100,   101,
       2,     3,    80,    27,     4,     5,     6,     7,     8,    28,
       9,    10,    11,    12,    13,    14,    30,    85,    38,    89,
     114,    40,    41,    29,    82,    68,    69,    70,    71,    72,
      73,    31,    62,    32,    85,    52,   137,   115,    38,   124,
     125,    40,    41,    76,    77,    42,   128,    68,    69,    70,
      71,    72,    73,   145,    92,    54,   118,    59,   119,    68,
      69,    70,    71,    72,    73,    42,   143,    38,    39,   111,
      40,   129,   112,    93,    74,    75,    68,    69,    70,    71,
      72,    73,    67,   117,    53,    62,    74,    75,    62,    79,
     132,   144,    74,    75,    42,   116,    66,   148,    81,   134,
     135,   133,    74,    75,    68,    69,    70,    71,    72,    73,
      68,    69,    70,    71,    72,    73,    68,    69,    70,    71,
      72,    73,    68,    69,    70,    71,    72,    73,     1,   104,
     105,    86,    83,    87,    94,   106,   108,     2,     3,   109,
     107,     4,     5,     6,     7,     8,   110,     9,    10,    11,
      12,    13,    14,     1,    58,   120,   121,   126,   122,   131,
     123,   140,     2,     3,   139,   141,     4,     5,     6,     7,
       8,   147,     9,    10,    11,    12,    13,    14,     1,    95,
      88,   150,   127,     0,    65,     0,     0,     2,     3,     0,
       0,     4,     5,     6,     7,     8,     0,     9,    10,    11,
      12,    13,    14,     1,     0,     0,     0,   138,     0,     0,
       0,     0,     2,     3,     0,     0,     4,     5,     6,     7,
       8,     0,     9,    10,    11,    12,    13,    14,     1,     0,
       0,     0,   146,     0,     0,     0,     0,     2,     3,     0,
       0,     4,     5,     6,     7,     8,     0,     9,    10,    11,
      12,    13,    14,     1,     0,     0,     0,   149,     0,     0,
       0,     0,     2,     3,     0,     0,     4,     5,     6,     7,
       8,     1,     9,    10,    11,    12,    13,    14,     0,     0,
       2,     3,     0,     0,     4,     5,     6,     7,     8,     0,
       9,    10,    11,    12,    13,    14
};

static const yytype_int16 yycheck[] =
{
       0,    25,    57,    27,    40,    41,    14,    31,     9,     5,
       6,   122,     8,     9,     6,     5,     6,     9,     8,     9,
      25,    26,    27,    28,    29,    30,    62,     9,   139,     9,
      14,    13,    32,    41,    14,     0,    32,    61,    74,    75,
      41,     6,    32,    14,    68,    69,    70,    71,    72,    73,
      15,    16,    12,     9,    19,    20,    21,    22,    23,     6,
      25,    26,    27,    28,    29,    30,     9,   122,     5,     6,
      41,     8,     9,     6,    12,    35,    36,    37,    38,    39,
      40,     9,     9,     7,   139,    14,    12,    14,     5,     6,
     114,     8,     9,    33,    34,    32,   120,    35,    36,    37,
      38,    39,    40,    12,    11,     6,   106,    12,   108,    35,
      36,    37,    38,    39,    40,    32,   140,     5,     6,     6,
       8,   121,     9,    12,    31,    32,    35,    36,    37,    38,
      39,    40,    13,    12,    14,     9,    31,    32,     9,    14,
      14,   141,    31,    32,    32,    14,    12,   147,    12,    17,
      18,    14,    31,    32,    35,    36,    37,    38,    39,    40,
      35,    36,    37,    38,    39,    40,    35,    36,    37,    38,
      39,    40,    35,    36,    37,    38,    39,    40,     6,    76,
      77,     6,    10,     6,    14,     7,     7,    15,    16,    22,
      14,    19,    20,    21,    22,    23,    12,    25,    26,    27,
      28,    29,    30,     6,    13,     9,     7,    10,    13,     6,
      12,     9,    15,    16,    13,     7,    19,    20,    21,    22,
      23,     7,    25,    26,    27,    28,    29,    30,     6,    67,
      59,   149,    10,    -1,    42,    -1,    -1,    15,    16,    -1,
      -1,    19,    20,    21,    22,    23,    -1,    25,    26,    27,
      28,    29,    30,     6,    -1,    -1,    -1,    10,    -1,    -1,
      -1,    -1,    15,    16,    -1,    -1,    19,    20,    21,    22,
      23,    -1,    25,    26,    27,    28,    29,    30,     6,    -1,
      -1,    -1,    10,    -1,    -1,    -1,    -1,    15,    16,    -1,
      -1,    19,    20,    21,    22,    23,    -1,    25,    26,    27,
      28,    29,    30,     6,    -1,    -1,    -1,    10,    -1,    -1,
      -1,    -1,    15,    16,    -1,    -1,    19,    20,    21,    22,
      23,     6,    25,    26,    27,    28,    29,    30,    -1,    -1,
      15,    16,    -1,    -1,    19,    20,    21,    22,    23,    -1,
      25,    26,    27,    28,    29,    30
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     6,    15,    16,    19,    20,    21,    22,    23,    25,
      26,    27,    28,    29,    30,    43,    44,    45,    47,    50,
      51,    52,    53,    60,     9,    41,    14,     9,     6,     6,
       9,     9,     7,     0,    43,     6,     9,    46,     5,     6,
       8,     9,    32,    49,    55,    56,    57,    58,    59,     6,
      55,    55,    14,    14,     6,    55,    43,     9,    13,    12,
      14,    41,     9,    56,    56,    58,    12,    13,    35,    36,
      37,    38,    39,    40,    31,    32,    33,    34,    14,    14,
      12,    12,    12,    10,    48,    60,     6,     6,    46,     6,
      55,    56,    11,    12,    14,    49,    55,    55,    55,    55,
      55,    55,    56,    56,    57,    57,     7,    14,     7,    22,
      12,     6,     9,    14,    41,    14,    14,    12,    43,    43,
       9,     7,    13,    12,     6,    55,    10,    10,    55,    43,
      48,     6,    14,    14,    17,    18,    54,    12,    10,    13,
       9,     7,    48,    55,    43,    12,    10,     7,    43,    10,
      54
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    42,    43,    43,    43,    43,    43,    43,    43,    43,
      43,    44,    44,    44,    44,    44,    44,    45,    45,    46,
      46,    47,    47,    48,    48,    48,    48,    49,    49,    50,
      51,    51,    51,    52,    52,    53,    54,    54,    54,    55,
      55,    56,    56,    56,    57,    57,    57,    58,    58,    58,
      58,    58,    59,    59,    59,    59,    59,    59,    59,    60,
      60,    60,    60,    60,    60
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     1,     1,     1,     1,     1,     1,     1,
       0,     5,     5,     7,     7,     4,     4,     3,     5,     1,
       3,     8,     5,     2,     4,     4,     6,     1,     3,     2,
       3,     3,     5,     7,     8,     8,     4,     8,     0,     1,
       1,     1,     3,     3,     1,     3,     3,     1,     1,     4,
       2,     3,     3,     3,     3,     3,     3,     3,     3,     1,
       1,     1,     1,     1,     1
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 25 "phase2.y" /* yacc.c:1646  */
    {printf("stmt -> stmt stmt\n");}
#line 1388 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 3:
#line 26 "phase2.y" /* yacc.c:1646  */
    {printf("stmt -> declaration\n");}
#line 1394 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 4:
#line 27 "phase2.y" /* yacc.c:1646  */
    {printf("stmt -> assignment\n");}
#line 1400 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 5:
#line 28 "phase2.y" /* yacc.c:1646  */
    {printf("stmt -> function\n");}
#line 1406 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 6:
#line 29 "phase2.y" /* yacc.c:1646  */
    {printf("stmt -> break\n");}
#line 1412 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 7:
#line 30 "phase2.y" /* yacc.c:1646  */
    {printf("stmt -> read_write_stmt\n");}
#line 1418 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 8:
#line 31 "phase2.y" /* yacc.c:1646  */
    {printf("stmt -> if_stmt\n");}
#line 1424 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 9:
#line 32 "phase2.y" /* yacc.c:1646  */
    {printf("stmt -> while_stmt\n");}
#line 1430 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 10:
#line 33 "phase2.y" /* yacc.c:1646  */
    {printf("stmt -> epsilon\n");}
#line 1436 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 11:
#line 35 "phase2.y" /* yacc.c:1646  */
    {printf("assignment -> var LH_ID = rel_exp;\n");}
#line 1442 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 36 "phase2.y" /* yacc.c:1646  */
    {printf("assignment -> var LH_ID = IDENT;\n");}
#line 1448 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 37 "phase2.y" /* yacc.c:1646  */
    {printf("assignment -> var[] LH_ID = rel_exp;\n");}
#line 1454 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 14:
#line 38 "phase2.y" /* yacc.c:1646  */
    {printf("assignment -> var[] LH_ID = IDENT;\n");}
#line 1460 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 15:
#line 39 "phase2.y" /* yacc.c:1646  */
    {printf("assignment -> IDENT = rel_exp;\n");}
#line 1466 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 16:
#line 40 "phase2.y" /* yacc.c:1646  */
    {printf("assignment -> IDENT = IDENT;");}
#line 1472 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 17:
#line 42 "phase2.y" /* yacc.c:1646  */
    {printf("declaration -> var LH_ID;\n");}
#line 1478 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 43 "phase2.y" /* yacc.c:1646  */
    {printf("declaration -> var[] LH_ID;\n");}
#line 1484 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 45 "phase2.y" /* yacc.c:1646  */
    {printf("lh_id -> IDENT\n");}
#line 1490 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 46 "phase2.y" /* yacc.c:1646  */
    {printf("lh_id -> IDENT,IDENT\n");}
#line 1496 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 21:
#line 48 "phase2.y" /* yacc.c:1646  */
    {printf("function -> var IDENT[arg]{stmt}");}
#line 1502 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 22:
#line 49 "phase2.y" /* yacc.c:1646  */
    {printf("function -> IDENT[arg];\n");}
#line 1508 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 23:
#line 51 "phase2.y" /* yacc.c:1646  */
    {printf("arg -> var IDENT\n");}
#line 1514 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 24:
#line 52 "phase2.y" /* yacc.c:1646  */
    {printf("arg -> var IDENT,arg\n");}
#line 1520 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 53 "phase2.y" /* yacc.c:1646  */
    {printf("arg -> var []IDENT\n");}
#line 1526 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 54 "phase2.y" /* yacc.c:1646  */
    {printf("arg -> var []IDENT,arg\n");}
#line 1532 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 56 "phase2.y" /* yacc.c:1646  */
    {printf("pass_arg -> rel_exp\n");}
#line 1538 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 28:
#line 57 "phase2.y" /* yacc.c:1646  */
    {printf("pass_arg -> rel_exp, pass_arg\n");}
#line 1544 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 59 "phase2.y" /* yacc.c:1646  */
    {printf("break -> break/\n");}
#line 1550 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 61 "phase2.y" /* yacc.c:1646  */
    {printf("read_write_stmt -> in/ ID\n");}
#line 1556 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 31:
#line 62 "phase2.y" /* yacc.c:1646  */
    {printf("read_write_stmt -> out/ IDENT\n");}
#line 1562 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 63 "phase2.y" /* yacc.c:1646  */
    {printf("read_write -> print/(IDENT)\n");}
#line 1568 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 65 "phase2.y" /* yacc.c:1646  */
    {printf("while_stmt -> WHILE[rel_exp]{stmt}\n");}
#line 1574 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 66 "phase2.y" /* yacc.c:1646  */
    {printf("while_stmt -> DO{stmt}WHILE[rel_exp]\n");}
#line 1580 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 68 "phase2.y" /* yacc.c:1646  */
    {printf("if_stmt -> IF[rel_exp]{stmt}\n");}
#line 1586 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 70 "phase2.y" /* yacc.c:1646  */
    {printf("elseif -> ELSE{stmt}\n");}
#line 1592 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 71 "phase2.y" /* yacc.c:1646  */
    {printf("elseif -> ELSEIF[rel_exp]{stmt}elseif\n");}
#line 1598 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 72 "phase2.y" /* yacc.c:1646  */
    {printf("elseif -> epsilon\n");}
#line 1604 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 74 "phase2.y" /* yacc.c:1646  */
    {printf("rel_exp -> add_exp\n"); }
#line 1610 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 75 "phase2.y" /* yacc.c:1646  */
    {printf("rel_exp -> rel\n"); }
#line 1616 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 77 "phase2.y" /* yacc.c:1646  */
    {printf("add_exp -> mul_exp\n");}
#line 1622 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 78 "phase2.y" /* yacc.c:1646  */
    {printf("add_exp -> add_exp ADD add_exp\n");}
#line 1628 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 79 "phase2.y" /* yacc.c:1646  */
    {printf("add_exp -> add_exp SUB add_exp\n");}
#line 1634 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 81 "phase2.y" /* yacc.c:1646  */
    {printf("mul_exp -> exp\n");}
#line 1640 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 82 "phase2.y" /* yacc.c:1646  */
    {printf("mul_exp -> mul_exp MUL mul_exp\n");}
#line 1646 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 83 "phase2.y" /* yacc.c:1646  */
    {printf("mul_exp -> mul_exp DIV mul_exp\n");}
#line 1652 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 85 "phase2.y" /* yacc.c:1646  */
    {printf("exp -> NUM\n");}
#line 1658 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 48:
#line 86 "phase2.y" /* yacc.c:1646  */
    {printf("exp -> IDENT\n");}
#line 1664 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 49:
#line 87 "phase2.y" /* yacc.c:1646  */
    {printf("exp -> IDENT[add_exp]");}
#line 1670 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 88 "phase2.y" /* yacc.c:1646  */
    {printf("exp -> SUB exp\n");}
#line 1676 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 51:
#line 89 "phase2.y" /* yacc.c:1646  */
    {printf("exp -> L_PAREN add_exp R_PAREN\n");}
#line 1682 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 52:
#line 92 "phase2.y" /* yacc.c:1646  */
    {printf("rel -> rel_exp LESS_THAN rel_exp\n"); }
#line 1688 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 93 "phase2.y" /* yacc.c:1646  */
    {printf("rel -> rel_exp GREATER_THAN rel_exp\n"); }
#line 1694 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 94 "phase2.y" /* yacc.c:1646  */
    { printf("rel -> rel_exp EQUAL_TO rel_exp\n"); }
#line 1700 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 95 "phase2.y" /* yacc.c:1646  */
    { printf("rel -> rel_exp LESS_EQUAL_TO rel_exp\n"); }
#line 1706 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 56:
#line 96 "phase2.y" /* yacc.c:1646  */
    { printf("rel -> rel_exp GREATER_EQUAL_TO rel_exp\n");}
#line 1712 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 57:
#line 97 "phase2.y" /* yacc.c:1646  */
    { printf("rel -> rel_exp NOT_EQUAL_TO rel_exp\n");}
#line 1718 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 58:
#line 98 "phase2.y" /* yacc.c:1646  */
    { printf("rel -> L_PAREN add_exp R_PAREN\n"); }
#line 1724 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 101 "phase2.y" /* yacc.c:1646  */
    { printf("var -> INT\n"); }
#line 1730 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 102 "phase2.y" /* yacc.c:1646  */
    { printf("var -> STRING\n"); }
#line 1736 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 103 "phase2.y" /* yacc.c:1646  */
    { printf("var -> DOUBLE\n"); }
#line 1742 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 62:
#line 104 "phase2.y" /* yacc.c:1646  */
    { printf("var -> CHAR\n"); }
#line 1748 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 63:
#line 105 "phase2.y" /* yacc.c:1646  */
    { printf("var -> BOOL\n"); }
#line 1754 "phase2.tab.c" /* yacc.c:1646  */
    break;

  case 64:
#line 106 "phase2.y" /* yacc.c:1646  */
    { printf("var -> VOID\n"); }
#line 1760 "phase2.tab.c" /* yacc.c:1646  */
    break;


#line 1764 "phase2.tab.c" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 110 "phase2.y" /* yacc.c:1906  */


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
