bison -v -d bison1.y 
flex flex1.l
gcc  bison1.tab.c lex.yy.c -lfl
gcc -c y.tab.c lex.yy.c
gcc y.tab.o lex.yy.o -o parser
./a.out input.c

