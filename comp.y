%{

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <symboltable.h>

int yylex();


void yyerror(const char *str)
{
        fprintf(stderr,"error: %s\n",str);
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
    | tInt tSpace tMain Body
    ;

Vide: 
    ;

Body:
    tNL tCBrO Lines tCBrC
    |tCBrO tNL Lines tCBrC;


Lines: 
    Vide
    | L
    | L tNL Lines
    ;

L:
    Aff tEndL
    |Print tEndL
    |Decl tEndL
    ;

Aff:
    tNom tEq Expression {printf("affectation\n");}
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
    Type Vars;

Vars:
    tNom 
    | Aff
    | tNom tComm tSpace Vars
    | Aff tComm tSpace Vars
    ;

Type:
    tInt
    | tConst
    ;



%%

int main(void)
{
    yyparse();
}