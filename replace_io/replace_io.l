%{
#include <stdio.h>
#include <stdlib.h>

FILE *output;
%}


%option noyywrap

%%
"printf"    { fprintf(output, "cout"); }
"scanf"     { fprintf(output, "cin"); }
.|\n        { fprintf(output, "%s", yytext); }
%%

int main(int argc, char **argv) {
    FILE *input = fopen("input.txt", "r");
    if (!input) {
        perror("Cannot open input.txt");
        return 1;
    }

    output = fopen("output.txt", "w");
    if (!output) {
        perror("Cannot open output.txt");
        return 1;
    }

    yyin = input;
    yylex();

    fclose(input);
    fclose(output);
    return 0;
}
