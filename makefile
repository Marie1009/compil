bison -d comp.y
flex comp.l
gcc lex.yy.c comp.tab.c -o compiler symboltable.c 
