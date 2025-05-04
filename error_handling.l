
%%

[ \t\n]             ;  // Ignore spaces, tabs, newlines

[a-zA-Z_][a-zA-Z0-9_]*   { printf("Identifier: %s\n", yytext); }

[0-9]+              { printf("Number: %s\n", yytext); }

[+\-*/]             { printf("Operator: %s\n", yytext); }

.                   { printf("Error: Invalid character '%s'\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}
