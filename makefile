bison -d -v -t comp.y
flex -d comp.l
gcc lex.yy.c comp.tab.c -o compiler

