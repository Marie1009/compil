%{

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include "symboltable.h"

int yylex();

int is_const;
char * name_var;

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
    Aff tEndL
    |Print tEndL
    |Decl tEndL
    ;

Aff:
    tNom tEq Expression {strcpy(name_var,$1);  printf("affectation\n");}
    ;

Expression:
    tNb
    |Expression tADD Expression {printf("addition\n");}
    |Expression tSUB Expression {printf("substraction\n");}
    |Expression tMUL Expression {printf("multiplication\n");}
    |Expression tDIV Expression {printf("division\n");}
    |tBrO {printf("debut parenthese expr\n");} Expression tBrC {printf("fin parenthese expr\n");}
    ;

Print: 
    tPri tBrO tNom tBrC {printf("ligne print\n");}
    ;

Decl:
    tInt Vars { is_const = 0;}
    | tConst Vars { is_const = 1;};

Vars:
    tNom {add_symbol($1,is_const,0);}
    | Aff {add_symbol(name_var,is_const,1);}
    | tNom tComm {add_symbol($1,is_const,0);} Vars 
    | Aff tComm {add_symbol(name_var,is_const,1);} Vars
    ;


%%

int main(void)
{
    yyparse();
}