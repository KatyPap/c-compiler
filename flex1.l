%{
  #include "y.tab.h"  
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  #include <errno.h>
 
  extern int yylex();
  

%}

%option noyywrap
%option yylineno
%x MULTI_LINE_COMMENT
%x SINGLE_LINE_COMMENT

%%
"PROGRAM"                       {return PROGRAM;}
"FUNCTION"                      {return FUNCTION;}
"VARS"                          {return VARS;}
"CHAR"                          {return CHAR;}
"INTEGER"                       {return INTEGER;}
"END_FUNCTION"                  {return END_FUNCTION;}
"RETURN"                        {return RETURN;}
"STARTMAIN"                     {return STARTMAIN;}
"ENDMAIN"                       {return ENDMAIN;}
"IF"                            {return IF;}
"THEN"                          {return THEN;}
"ENDIF"                         {return ENDIF;}
"ELSEIF"                        {return ELSEIF;}
"ELSE"                          {return ELSE;}
"FOR"                           {return FOR;}
"TO"                            {return TO;}
"STEP"                          {return STEP;}
"ENDFOR"                        {return ENDFOR;}
"WHILE"                         {return WHILE;}
"ENDWHILE"                      {return ENDWHILE;}
"SWITCH"                        {return SWITCH;}
"CASE"                          {return CASE;}
"DEFAULT"                       {return DEFAULT;}
"ENDSWITCH"                     {return ENDSWITCH;}
"PRINT"                         {return PRINT;}
"BREAK"                         {return BREAK;}
"STRUCT"                        {return STRUCT;}
"TYPEDEF"                       {return TYPEDEF;}
"ENDSTRUCT"                     {return ENDSTRUCT;}
"("                             {return LEFTPAR;}
")"		                 {return RIGHTPAR;}
"["			         {return LEFTBRACKET;}
"]"				 {return RIGHTBRACKET;}
","				 {return COMMA;}
";"				 {return SEMICOLON;}
":"				 {return UPDOWN;}
["]                             {return QUOTMARKS;}
"\n"	                        {return NEWLINE;}
">"				 {return GT;   }
"<"				 {return LT;   }
"=="				 {return EQ;   }	
"!="                            {return NE;   } 
"&&"                            {return AND;   } 
"||"                            {return OR;    }
["+"|"-"]			 {return add_op;}
["*"|"\"]			 {return mul_op;}
"^"                             {return '^'; }
[0-9]+                          {return num;}
_*[a-zA-Z][a-zA-Z0-9_]*         {return NAME;}


"/*"                              {BEGIN(MULTI_LINE_COMMENT);}
<MULTI_LINE_COMMENT>[^*\n]*       { }
<MULTI_LINE_COMMENT>"*"+[^*/\n]*  { }
<MULTI_LINE_COMMENT>\n           yylineno;
<MULTI_LINE_COMMENT>"*/"         {BEGIN(INITIAL);}
<MULTI_LINE_COMMENT><<EOF>>      {perror("Unterminated comment"); return 0;}

"%"                           {BEGIN(SINGLE_LINE_COMMENT);}
<SINGLE_LINE_COMMENT>.           { }
<SINGLE_LINE_COMMENT>[\n | \r\n] {BEGIN(INITIAL); yylineno;} 
  



[ \t\n]+ 
<<EOF>>                    {return EOF; }                      
         
.                          {printf("unexpected character\n");}

%%


