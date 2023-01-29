PROGRAM prog_name
STRUCT str1_name
VARS INTEGER num1, num2;
ENDSTRUCT
TYPEDEF STRUCT str2_name
VARS CHAR num3; 
str2_name ENDSTRUCT
FUNCTION func_name(INTEGER x, INTEGER y)
VARS INTEGER var1;
 RETURN var1 END_FUNCTION
/* this is a multiline comment */	
% this is a comment
/* multiline
   comment */
STARTMAIN
VARS INTEGER i, var2, var3, var4,var5,var6;
FOR i = 0 to STEP 10
var2 = 1;
ENDFOR
WHILE(i = 0)
PRINT("1",[i]) 
ENDWHILE
var2 = 2;
var3 = 2;
IF (var1 ==var3) THEN
PRINT("Hello")
ELSE
var4 = var2 + var3;
ENDIF
var5=1;
SWITCH(var5)
CASE(1):
var6 =1;
BREAK;
CASE(2):
var6 =2;
BREAK;
ENDSWITCH
ENDMAIN  


