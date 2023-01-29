%{
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

extern void yyerror(const char *msg);
extern int yylex ();
extern FILE
*yyin;	
extern FILE
*yyout;
extern int yylineno;
extern char *yytext;
 						
%}


%union {
	
	int intval;
	char *charval;

}

%token PROGRAM FUNCTION VARS  END_FUNCTION RETURN STARTMAIN ENDMAIN 
%token IF THEN ENDIF ELSEIF ELSE FOR TO STEP ENDFOR WHILE ENDWHILE SWITCH 
%token CASE DEFAULT ENDSWITCH PRINT BREAK  LEFTPAR RIGHTPAR  
%token LEFTBRACKET RIGHTBRACKET COMMA SEMICOLON UPDOWN 
%token QUOTMARKS STRUCT TYPEDEF ENDSTRUCT NEWLINE
%token  NAME num  add_op mul_op
%token GT LT EQ NE AND OR
%token <intval> INTEGER
%token <charval> CHAR



%left  COMMA
%right '='
%left  OR 
%left  AND
%left  EQ NE
%left  GT LT 
%left  add_op
%left  mul_op
%right '^'
%left LEFTBRACKET RIGHTBRACKET LEFTPAR RIGHTPAR
%nonassoc LOWER_THEN_ELSE
%nonassoc ELSEIF
%nonassoc THEN
%nonassoc ELSE


%start program
%define parse.error verbose


%%
program:		 	PROGRAM NAME newline structs function main_program
   				;

newline:			NEWLINE
				|{ }
				;
  
structs: 			| structs struct newline
				;	 
         
struct:  			 STRUCT NAME newline variable_declaration_list newline ENDSTRUCT
                               | typedef
        			;
  
 typedef:			TYPEDEF STRUCT NAME newline variable_declaration_list newline NAME ENDSTRUCT
 				;        

				
			             
function: 			|FUNCTION func_declare SEMICOLON newline
				| FUNCTION func_declare newline body_func END_FUNCTION
				;
 
         			

func_declare: 			NAME LEFTPAR parameter_list RIGHTPAR  
              			;

parameter_list: 		parameter
               		| parameter_list COMMA  parameter
	       		;

parameter:			type_specifier  variable
				;

type_specifier: 		CHAR		   
               		| INTEGER
	       		;

body_func: 			|variable_declaration_list statements newline return
           			;

variable_declaration_list:     variable_declaration 
				|variable_declaration variable_declaration_list
			        ;


variable_declaration:		VARS type_specifier  name_list SEMICOLON
			
                     		;

name_list: 			variable
          			| name_list COMMA variable 
	  			;

variable: 			NAME
         			| array
	 			;

array: 			NAME LEFTBRACKET num RIGHTBRACKET
      				;
 
return:			RETURN num
         			| RETURN NAME
	 			;
		  	  
		  
main_program: 			|STARTMAIN main_body ENDMAIN 
             			;

main_body:                     variable_declaration_list statements
				;
				

statements:
            			| statements statement
            			;

statement:    			assignment_statement
              			| loop_statment
              			| conditional_statement
              			| print_statement
	      			;
			  
assignment_statement: 		assignment
                    		| assignment_statement assignment
		     		;

assignment: 			variable '=' ar_expr SEMICOLON  
           			;

ar_expr: 			 num        
            			| variable   
            			| ar_expr add_op ar_expr			
            			| ar_expr mul_op ar_expr
            			| ar_expr '^' ar_expr				  
	    			| LEFTPAR ar_expr RIGHTPAR
	    			;



loop_statment: 		while_loop
              			| for_loop
              			;

while_loop: 			WHILE LEFTPAR condition  RIGHTPAR statements ENDWHILE
              			;

condition: 			assignment 
          			| logical_expr
          			;

logical_expr: 			relational_expr logical_op relational_expr
             			| relational_expr
	      			;

relational_expr: 		ar_expr relational_op ar_expr
                		| ar_expr
				;

logical_op: 			AND | OR
           			;
           			 
relational_op: 		GT | LT | EQ | NE
			  	;

              

for_loop: 			FOR assignment TO num STEP num statements ENDFOR
         			;

conditional_statement: 	if_statement 
                      		| switch_statement
		      		;
						 

if_statement: 			IF  LEFTPAR condition RIGHTPAR  THEN statement if_tail 
             			;

if_tail: 			elseif  ENDIF	
            			| else ENDIF
	    			/*|%prec LOWER_THEN_ELSE*/
            			;	
			 

elseif: 			ELSEIF LEFTPAR condition RIGHTPAR  statements
        			| elseif ELSEIF LEFTPAR condition RIGHTPAR statements	 
        			;
         
else: 				ELSE statements
      				| elseif ELSE statements
      				; 

		 

switch_statement: 		SWITCH LEFTPAR condition RIGHTPAR case_list ENDSWITCH
                 		;

case_list: 			case_line BREAK SEMICOLON
          			|case_line case_list
	  			|case_list default
         			;
				
case_line: 			CASE LEFTPAR condition RIGHTPAR UPDOWN  statements
          			;				
				
default:   			DEFAULT  UPDOWN statements	
        			;
        			
print_statement: 		PRINT LEFTPAR  QUOTMARKS text QUOTMARKS COMMA LEFTBRACKET variable RIGHTBRACKET RIGHTPAR
				|PRINT LEFTPAR  QUOTMARKS text QUOTMARKS RIGHTPAR 
                 		;
                 		
text: 			        NAME
			       |text NAME
			       ;                 		

				
			  			 
%%
	
void yyerror(const char *msg) {
    fprintf(stderr,"%s at line %d\n", msg, yylineno);
}

				

int main(int argc, char*argv[]){
	++argv; --argc;
	if(argc > 0)                     // read the file
	
		yyin = fopen(argv[0],"r");
	else
                yyin = stdin;
                
        yyout = fopen ( "output", "w" );	
        yyparse();
        fclose(yyin); 

     return 0;	     
}

