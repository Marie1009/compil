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
            char * str;
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

%type <nb> Expression

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
    |Expression tADD Expression {printf("addition\n"); }
    |Expression tSUB Expression {printf("substraction\n");}
    |Expression tMUL Expression {printf("multiplication\n");}
    |Expression tDIV Expression {printf("division\n");}
    |tBrO {printf("debut parenthese expr\n");} Expression tBrC {printf("fin parenthese expr\n");}
    ;

Print: 
    tPri tBrO tNom tBrC {printf("ligne print\n");}
    ;


Instance:
    tInt tNom { add_symbol($2,0,0);}
    | tConst tNom { add_symbol($2,1,0);}
    | tNom tEq Expression {int ad=get_address($1);  printf("AFC %d %d\n",ad, $3);}
    | tInt tNom tEq Expression {add_symbol($2,0,0); int ad=get_address($2);  printf("AFC %d %d\n",ad, $4);}
    | tConst tNom tEq Expression {add_symbol($2,1,0); int ad=get_address($2);  printf("AFC %d %d\n",ad, $4);}
    ;




%%

int main(void)
{
    yyparse();
}