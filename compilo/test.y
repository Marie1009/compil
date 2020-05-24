%{

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include "symboltable.h"

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
%token tBrO tBrC tCBrO tCBrC
%token tConst
%token <str> tNom
%token tMain
%token tInt
%token tPri
%token <nb> tNb
%token tComm tTAB tSpace
%token tNL
%token tEndL




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
    ;

Expression:
    tNb 
        {int x = push(); 
        printf("AFC %d %d\n",x,$1);}

    |tNom 
        {int x = push(); 
        printf("test");
        printf(" value %s ",$1);
        int ad=get_address($1); 
        
        if (ad!=-1){printf("COP %d %d\n",x,ad);}}

    |tSUB Expression
        {int m = push();
        printf("AFC %d %d \n",m, -1);
        int a =pop(); 
        int b = pop(); 
        int c = push(); 
        printf("MUL %d %d %d\n",c ,a, b); }

    |Expression tADD Expression 
        {int a =pop(); 
        int b = pop(); 
        int c = push(); 
        printf("ADD %d %d %d\n",c ,a, b); }

    |Expression tSUB Expression 
        {int a =pop(); 
        int b = pop(); 
        int c = push();
        printf("SOU %d %d %d\n",c ,a, b); }

    |Expression tMUL Expression 
        {int a =pop(); 
        int b = pop(); 
        int c = push(); 
        printf("MUL %d %d %d\n",c ,a, b); }

    |Expression tDIV Expression 
        {int a =pop(); 
        int b = pop(); 
        int c = push(); 
        printf("DIV %d %d %d\n",c ,a, b); }

    |tBrO Expression tBrC 
    ;

Print: 
    tPri tBrO tNom tBrC {printf("ligne print\n");}
    ;


Instance:
    tInt tNom 
    { add_symbol($2,0,0);}

    | tConst tNom {add_symbol($2,1,0);}

    | tNom tEq Expression 
    {int ad=get_address($1); 
    if(check_init(ad)==0){ int v = pop(); printf("COP %d %d\n",ad, v);} }

    | tInt tNom tEq Expression 
    { add_symbol($2,0,1); 
    int ad=get_address($2); 
    int v = pop(); 
    printf("COP %d %d\n",ad, v);}

    | tConst tNom tEq Expression 
    {add_symbol($2,1,1); 
    int ad=get_address($2); 
    int v= pop(); 
    printf("error"); 
    printf("COP %d %d\n",ad, v);}
    ;




%%

int main(void)
{

    init();
    yyparse();
   
    
}