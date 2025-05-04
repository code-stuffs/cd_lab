%{
    #include <stdio.h>
    #include <stdlib.h>

    int yylex(void);          // Add this line
    int yyerror(char *s);      // Add this line
%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%right UMINUS

%%

input:
    expr { printf("Result = %d\n", $$); }
    ;

expr:
    expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { $$ = $1 / $3; }
    | '-' expr %prec UMINUS { $$ = -$2; }
    | '(' expr ')' { $$ = $2; }
    | NUMBER { $$ = $1; }
    ;

%%

int yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}

int main() {
    printf("Enter arithmetic expression: ");
    yyparse();
    return 0;
}

