%{
#include <stdio.h>
#include <string.h>
#include <math.h>

int yylex(void);  // declaration explicite de yylex
int yyparse();


int yywrap( );
int yyerror(const char* str);

/* La resultat */
double result = 0;
%}

/* declare type possibilities of symbols */
//de entier et du reel
%union {
  double value;
}

/* declare tokens (default is typeless) */
//Symboles terminaux qui seront fournis par yylex()
%token <value> VAL
%left PLUS MOINS
%left FOIS DIVISE
%left PUISSANCE
%token OUVRIR
%token FERMER
%token FIN

/* declare non-terminals */
%type <value> Total expr term factor

/* fournissez-nous des erreurs plus détaillées */
%error-verbose

%%

/* une seule expression suivie d'une nouvelle ligne */
Total: expr FIN {result = $1; return 0;}

/* une expression utilise + ou - ou ni l'un ni l'autre */
expr: expr PLUS term {$$ = $1 + $3;}
    | expr MOINS term {$$ = $1 - $3;}
    | term {$$ = $1;}

/* une expression utilise * ou / ou ni l'un ni l'autre */
term: term FOIS factor {$$ = $1 * $3;}
    | term DIVISE factor {$$ = $1 / $3;}
    | factor {$$ = $1;}

/* un facteur peut être élevé à une puissance */
factor: VAL {$$ = $1;}
      | OUVRIR expr FERMER {$$ = $2;}
      | factor PUISSANCE factor {$$ = pow($1, $3);}
%%

// Fin
int yywrap( ) {
  return 1;
}

int yyerror(const char* str) {
  fprintf(stderr, "Compiler error: '%s'.\n", str);
  return 0;
}


int main( ) {
  
  /*if (yyparse()) {
    printf("The answer is %lf\n", result);
    fprintf(stderr, "Correct Successful parsing.\n");
  }
  else
     fprintf(stderr, "Incorrect error.\n");*/
  yyparse( );
  printf("La reponse est : %lf\n", result);


  // prompt pour attendre input
  printf("Presser 'Entrer' pour fermer...");
  getchar();  // Wait for Enter key

  return 0;
}