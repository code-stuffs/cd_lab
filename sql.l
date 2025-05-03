// input is SELECT name, age FROM students WHERE age >= 18 AND name = 'John Doe'


%{
#include <stdio.h>
#include <string.h>

void print_token(const char* type, const char* value) {
    printf("<%s, %s>\n", type, value);
}
%}

%%

--[^\n]*                      ;  // Ignore single-line comments starting with --
[ \t\n]+                     ;  // Ignore whitespace

"SELECT"                    { print_token("KEYWORD", yytext); }
"FROM"                      { print_token("KEYWORD", yytext); }
"WHERE"                     { print_token("KEYWORD", yytext); }
"INSERT"                    { print_token("KEYWORD", yytext); }
"INTO"                      { print_token("KEYWORD", yytext); }
"VALUES"                    { print_token("KEYWORD", yytext); }
"UPDATE"                    { print_token("KEYWORD", yytext); }
"SET"                       { print_token("KEYWORD", yytext); }
"DELETE"                    { print_token("KEYWORD", yytext); }
"CREATE"                    { print_token("KEYWORD", yytext); }
"TABLE"                     { print_token("KEYWORD", yytext); }
"AND"|"OR"|"NOT"|"NULL"     { print_token("KEYWORD", yytext); }

[a-zA-Z_][a-zA-Z0-9_]*       { print_token("IDENTIFIER", yytext); }
[0-9]+(\.[0-9]+)?            { print_token("NUMBER", yytext); }
\'([^']|\'\')*\'             { print_token("STRING", yytext); }

"="|"<="|">="|"!="|"<>"|"<"|">" { print_token("OPERATOR", yytext); }
"("                          { print_token("LPAREN", yytext); }
")"                          { print_token("RPAREN", yytext); }
","                          { print_token("COMMA", yytext); }
";"                          { print_token("SEMICOLON", yytext); }
.                            { printf("Unknown character: %s\n", yytext); }

%%

int main(int argc, char** argv) {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
