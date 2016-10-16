/*Rien à voir avec le texte Reve.md, j'avais envie de mettre du code...*/

/*Programme YACC qui définit la grammaire des expressions arithmétiques sans actions semantiques*/
%{
	extern int yylex();
	extern int yyerror();
	extern int numligne;
%}

%token PLUS MOINS DIV MULT
%token PARANTHESE_OUVRANTE PARANTHESE_FERMANTE CSTE_ENTIERE CSTE_REEL

%%
e: e1
;

e1: e1 PLUS e2
	| e2 MOINS e2
	| e2
	;
	
e2: e2 MULT e3
	| e2 DIV e3
	| e3
	;
	
e3: PARANTHESE_OUVRANTE e1 PARANTHESE_FERMANTE
  | CSTE_ENTIERE
	| CSTE_REEL
	;
	
%%

int yyerror(){
	fprintf(stderr,"Erreur à la ligne %d\n", numligne);
	
	return -1;
}
