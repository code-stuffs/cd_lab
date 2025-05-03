%{
#include <stdio.h>

int line_count = 0;
%}

%%
\n         { line_count++; }
.          ;  // Ignore all other characters
%%

int main() {
    yylex();
    printf("Total number of lines: %d\n", line_count);
    return 0;
}
