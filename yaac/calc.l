%{
    #include "y.tab.h"
%}

%%
[0-9]+  { yylval = atoi(yytext); return NUMBER; }
[+\-*/()] { return yytext[0]; }
\n      { return 0; }
[ \t]   ;
.       { printf("Invalid character: %s\n", yytext); }
%%

int yywrap() { return 1; }    // Add this function

