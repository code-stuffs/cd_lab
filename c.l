%{
#include<stdio.h>

%}

%option noyywrap

%%

"int"                          { printf("Keyword: int\n"); }
"float"                        { printf("Keyword: float\n"); }
"if"                           { printf("Keyword: if\n"); }
"else"                         { printf("keyword: else\n"); }
"while"                        { printf("Keyword: while\n"); }
"return"                       { printf("Keyword: return\n"); }

[ \t\n]+ ;
"//".*                         { printf("Comment: %s\n", yytext); }

[0-9]+\.[0-9]+                 { printf("float: %s\n", yytext); }
[0-9]+                         { printf("integer: %s\n", yytext); }

[a-zA-Z_][a-zA-Z0-9]*        { printf("identifiers: %s\n", yytext); }

"=="|"!="|"<="|">="|"<"|">"    { printf("Relational operators: %s\n", yytext); }

"="                            { printf("Assignment Operator: %s\n", yytext); }
"+"                            { printf("Operator: %s\n", yytext); }
"-"                            { printf("Operator: %s\n", yytext); }
"*"                            { printf("Operator: %s\n", yytext); }
"/"                            { printf("Operator: %s\n", yytext); }

"("                             { printf("Symbol: %s\n", yytext); }
")"                             { printf("Symbol: %s\n", yytext); }
"{"                             { printf("Symbol: %s\n", yytext); }
"}"                             { printf("Symbol: %s\n", yytext); }
";"                             { printf("Symbol: %s\n", yytext); }
","                             { printf("Symbol: %s\n", yytext); }

.                                { printf("Unknown: %s\n", yytext); }

%%

int main()
{
yylex();

return 0;

}
