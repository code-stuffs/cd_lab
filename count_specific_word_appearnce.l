%{

#include <stdio.h>
#include <string.h>

int count=0;
%}


%option noyywrap

%%
hello        { count++; }
.|\n         ;  // Skip everything else
%%

int main() {
    yylex();
    printf("The word 'hello' appeared %d times.\n", count);
    return 0;
}
