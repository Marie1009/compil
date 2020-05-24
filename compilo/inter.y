%{

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include "symboltable.h"
#include "codeasm.h"

int yylex();

void yyerror(const char *str)
{
        fprintf(stderr,"BIG error: %s\n",str);
}
 
int yywrap()
{
        return 1;
} 


%}

%union  {
            char *str;
            int nb;
        }

%token tADD tMUL tSUB tDIV tEq
%token <nb> tBrO 
%token tBrC tCBrO tCBrC
%token tConst
%token <str> tNom
%token tMain
%token tInt
%token tPri
%token <nb> tNb
%token tComm tTAB tSpace
%token tNL
%token tEndL
%token <nb> tIf  
%token <nb> tWhile
%token <nb> tElse
%token tEqu tInf tSup

%type <nb> BlockIf1 

%left tADD tMUL tSUB tDIV 
%right tEq


%start Input

%%
Input:
      Vide
    | tInt tMain Body
    ;

Vide: 
    ;

Body:
    tCBrO {plus_depth();} Lines tCBrC {minus_depth();}
    ;


Lines: 
    Vide
    | L Lines
    ;

L:
    Print tEndL
    |Instance tEndL 
    |BlockIf 
    |BlockWhile
    ;

Expression:
    tNb 
        {int x = push(); 
        add_op2("AFC",x,$1);
        }

    |tNom 
        {int x = push(); 
        int ad=get_address($1); 
        
        if (ad!=-1){add_op2("COP",x,ad);}
        }

    |tSUB Expression
        {int m = push();
        add_op2("AFC",m,-1);
        int a =pop(); 
        int b = pop(); 
        int c = push(); 
        add_op3("MUL",c,a,b);
        }

    |Expression tADD Expression 
        {int a =pop(); 
        int b = pop(); 
        int c = push(); 
        add_op3("ADD",c,a,b); }

    |Expression tSUB Expression 
        {int a =pop(); 
        int b = pop(); 
        int c = push();
        add_op3("SUB",c,a,b); }

    |Expression tMUL Expression 
        {int a =pop(); 
        int b = pop(); 
        int c = push(); 
        add_op3("MUL",c,a,b); }

    |Expression tDIV Expression 
        {int a =pop(); 
        int b = pop(); 
        int c = push(); 
        add_op3("DIV",c,a,b); }

    |Expression tEqu Expression 
        { int a =pop(); 
        int b = pop(); 
        int c = push(); 
        add_op3("EQU",c,a,b);}

    |Expression tSup Expression 
        {int a =pop(); 
        int b = pop(); 
        int c = push(); 
        add_op3("SUP",c,a,b); }

    |Expression tInf Expression 
        { int a =pop(); 
        int b = pop(); 
        int c = push(); 
        add_op3("INF",c,a,b);}

    |tBrO Expression tBrC 
    ;

Print: 
    tPri tBrO tNom tBrC {int ad = get_address($3); add_op1("PRI",ad);}
    ;


Instance:
    tInt tNom 
    { add_symbol($2,0,0);}

    | tConst tNom {add_symbol($2,1,0);}

    | tNom tEq Expression 
    {int ad=get_address($1); 
    if(check_init(ad)==0){ int v = pop(); add_op2("COP",ad,v); } }

    | tInt tNom tEq Expression 
    { add_symbol($2,0,1); 
    int ad=get_address($2); 
    int v = pop(); 
    add_op2("COP",ad,v);}

    | tConst tNom tEq Expression 
    {add_symbol($2,1,1); 
    int ad=get_address($2); 
    int v= pop(); 
    add_op2("COP",ad,v);}
    ;


BlockIf :

    BlockIf1 {int line = get_line(); modifyjmf($1,line+1);}
    |BlockIf1  tElse { $2 = add_op1("JMP", -1) ; modifyjmf($1,$2+1);} Body {printf("coucou"); int line = get_line(); modifyjmp($2,line+1); }

BlockIf1 :

    tIf tBrO Expression tBrC { int ad = pop(); $1 = add_op2("JMF",ad,-1); } Body {$$ = $1;}
    ;

BlockWhile :
    tWhile tBrO { $1 = get_line();  } Expression tBrC { int ad = pop(); $2 = add_op2("JMF",ad,-1);} Body { int var = add_op1("JMP", $1+1); modifyjmf($2, var+1); }


%%

int main(void)
{
    init();
    yyparse();
    write_file();       
}