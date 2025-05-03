%{
#include <stdio.h>
#include <string.h>
#include <ctype.h>

void print_token(const char* type, const char* value) {
    printf("Token: %-15s Type: %s\n", value, type);
}
%}

%%
[ \t\r]+                      ; // skip whitespace
\n                            { print_token("NEWLINE", "newline"); }

"def"|"if"|"else"|"while"|"for"|"in"|"return"|"print" {
                                print_token("KEYWORD", yytext); 
                              }

[0-9]+\.[0-9]+                { print_token("FLOAT", yytext); }
[0-9]+                        { print_token("INTEGER", yytext); }

\"([^\"\\]|\\.)*\"            { print_token("STRING", yytext); }
\'([^\'\\]|\\.)*\'            { print_token("STRING", yytext); }

"=="|"!="|"<="|">="|"<"|">"|"="|"+"|"-"|"*"|"/" {
                                print_token("OPERATOR", yytext);
                              }

[\(\){}\[\]:,\.]              { print_token("SYMBOL", yytext); }

[a-zA-Z_][a-zA-Z0-9_]*        { print_token("IDENTIFIER", yytext); }

.                             { print_token("UNKNOWN", yytext); }
%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
