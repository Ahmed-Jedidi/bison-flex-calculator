%{
#include <stdio.h>
#include <string.h>
#include "grammaire.tab.h"
%}

%option noyywrap

blanks       [ \t]+

chiffre     [0-9]
exponentiel [eE][+-]?{entier}
entier      {chiffre}+
reel        {entier}"."{entier}({exponentiel}?)

plus        "+"
moins       "-"
fois        "*"
divise      "/"
puissance   "^"

ouvrir      "("
fermer      ")"

%%

{plus}              {return PLUS;}
{moins}             {return MOINS;}
{divise}            {return DIVISE;}
{fois}              {return FOIS;}
{puissance}         {return PUISSANCE;}

{ouvrir}            {return OUVRIR;}
{fermer}            {return FERMER;}

{entier}            {yylval.value = atof(yytext); return VAL;}
{reel}              {yylval.value = atof(yytext); return VAL;}

{blanks}            {}
"\n"                {return FIN;}

.                   {printf("Error: incorrect lexeme '%s'.\n", yytext);  return 0;  }

%%