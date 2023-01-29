/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

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

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_BISON1_TAB_H_INCLUDED
# define YY_YY_BISON1_TAB_H_INCLUDED
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
    PROGRAM = 258,
    FUNCTION = 259,
    VARS = 260,
    END_FUNCTION = 261,
    RETURN = 262,
    STARTMAIN = 263,
    ENDMAIN = 264,
    IF = 265,
    THEN = 266,
    ENDIF = 267,
    ELSEIF = 268,
    ELSE = 269,
    FOR = 270,
    TO = 271,
    STEP = 272,
    ENDFOR = 273,
    WHILE = 274,
    ENDWHILE = 275,
    SWITCH = 276,
    CASE = 277,
    DEFAULT = 278,
    ENDSWITCH = 279,
    PRINT = 280,
    BREAK = 281,
    LEFTPAR = 282,
    RIGHTPAR = 283,
    LEFTBRACKET = 284,
    RIGHTBRACKET = 285,
    COMMA = 286,
    SEMICOLON = 287,
    UPDOWN = 288,
    QUOTMARKS = 289,
    STRUCT = 290,
    TYPEDEF = 291,
    ENDSTRUCT = 292,
    NEWLINE = 293,
    NAME = 294,
    num = 295,
    add_op = 296,
    mul_op = 297,
    GT = 298,
    LT = 299,
    EQ = 300,
    NE = 301,
    AND = 302,
    OR = 303,
    INTEGER = 304,
    CHAR = 305,
    LOWER_THEN_ELSE = 306
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 20 "bison1.y"

	
	int intval;
	char *charval;


#line 116 "bison1.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_BISON1_TAB_H_INCLUDED  */
