

B       [ \t\n]+
Tab     (\t)+
Space   (\ )+

Digit    [0-9]
Dec     {Digit}+(,{Digit}+)?
E       [Ee][-+]?{Digit}+
Numb    {Dec}{E}?

Let     [a-z]|[A-Z]

Name     {Let}({Let}|{Digit}|_)*

Main    main\(\)

%{
    #include "inter.tab.h"
%}

%%

"+" {
        printf("tADD\n");
        return tADD;
    }

"*" {
        printf("tMUL\n");
        return tMUL;
    }
"-" {
        printf("tSUB\n");
        return tSUB;
    }
"/" {
        printf("tDIV\n");
        return tDIV;
    }

"=" {
        printf("tEq\n");
        return tEq;
    }

"==" { 
        printf("tEqu\n"); 
        return tEqu;
    }

"<" { 
        printf("tInf\n"); 
        return tInf;
    }

">" { 
        printf("tSup\n"); 
        return tSup;
    }

"(" {
        printf("tBrO\n");
        return tBrO;
    }

")" {
        printf("tBrC\n");
        return tBrC;
    }
"{" {
        printf("tCBrO\n"); 
        return tCBrO;
    }
"}" {
        printf("tCBrC\n"); 
        return tCBrC ;
    }



"const" {
        printf("tConst\n");
        return tConst ;
        }

"int"   { 
            printf("tInt\n"); 
            return tInt;
        } 
"printf" { 
            printf("tPri\n"); 
            return tPri;
        }
"while" {
        printf("tWhile");
        return tWhile;
        }
"if" { 
        printf("tIf\n"); 
           return tIf;
      }

"else" { 
        printf("tElse\n"); 
        return tElse;
    }



{Name}   {
        printf("tNom\n");
        yylval.str = strdup(yytext);
        return tNom ;

        }    
{Main}  {
            printf("tMain\n");
            return tMain;
        }


{Numb} {
        printf("tNb\n");
        yylval.nb = atoi(yytext);
        return tNb;
        }

","     {
        printf("tComm\n");
        return tComm;
        }


    /* -- attention ne pas mettre de return ici !! --*/

{Tab}    {
        }

{Space}  {
        }

    /* ---------------------------------------------- */


"\n"    {
        } 

";"     {
        printf("tEndL\n");
        return tEndL;
        }

%%
/*
int yywrap(void)
{
    return 1;
}


int main(void)
{
    yylex();
}
*/