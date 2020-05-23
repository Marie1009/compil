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
    tCBrO {printf("test depth");} Lines tCBrC {printf("test depth");}
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
    |Expression tADD Expression {printf("addition\n"); }
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
    tNom {printf("test nom");}
    | Aff {printf("test aff");}
    | tNom tComm {printf("test nom comm");} Vars 
    | Aff tComm {printf("test aff comm");} Vars
    ;


%%

int main(void)
{
    yyparse();
}