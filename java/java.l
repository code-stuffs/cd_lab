%{
#include <stdio.h>
%}

ID         [a-zA-Z_][a-zA-Z0-9_]*
DIGIT      [0-9]
KEYWORD    (abstract|assert|boolean|break|byte|case|catch|char|class|const|continue|default|do|double|else|enum|extends|final|finally|float|for|goto|if|implements|import|instanceof|int|interface|long|native|new|null|package|private|protected|public|return|short|static|strictfp|super|switch|synchronized|this|throw|throws|transient|try|void|volatile|while)


%option noyywrap

%%
"//".*                              { printf("Single-line Comment: %s\n", yytext); }
"/*"([^*]|\*+[^*/])*\*+"/"          { printf("Multi-line Comment: %s\n", yytext); }

{KEYWORD}                          { printf("Keyword: %s\n", yytext); }
{ID}                               { printf("Identifier: %s\n", yytext); }
\"([^\\\"]|\\.)*\"                 { printf("String Literal: %s\n", yytext); }
{DIGIT}+(\.{DIGIT}+)?              { printf("Number: %s\n", yytext); }

"=="|"!="|"<="|">="|"&&"|"||"      { printf("Logical/Relational Operator: %s\n", yytext); }
"+"|"-"|"*"|"/"|"="|"<"|">"        { printf("Operator: %s\n", yytext); }

"{"|"}"|"("|")"|"["|"]"            { printf("Bracket: %s\n", yytext); }
";"                                { printf("Semicolon: %s\n", yytext); }
"."                                { printf("Symbol: %s\n", yytext); }

[ \t\n]+                           { /* skip whitespace */ }
.                                  { printf("Unknown Token: %s\n", yytext); }
%%

int main() {
    yylex();
    return 0;
}
