%{
#include "while.tab.h"
%}

%%

"while"         { return WHILE; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
"("             { return LPAREN; }
")"             { return RPAREN; }
";"             { return SEMICOLON; }
[0-9]+          { return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { return IDENTIFIER; }
"=="|"!="|"<="|">="|"<"|">" { return RELOP; }
[ \t\n]         { /* Ignore whitespace */ }
.               { printf("Lexical Error: Invalid token '%s'\n", yytext); }

%%

int yywrap() {
    return 1;
}
