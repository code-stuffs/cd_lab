%{
#include <stdio.h>
%}

DIGIT      [0-9]
ID         [a-zA-Z_][a-zA-Z0-9_]*
KEYWORDS   (int|float|char|double|if|else|while|for|return|void|class|public|private|protected|include|using|namespace|new|delete|this)
%%
"//".*                       { printf("Single-line Comment: %s\n", yytext); }
"/*"([^*]|\*+[^*/])*\*+"/"   { printf("Multi-line Comment: %s\n", yytext); }

{KEYWORDS}                  { printf("Keyword: %s\n", yytext); }
{ID}                        { printf("Identifier: %s\n", yytext); }
\"([^\\\"]|\\.)*\"          { printf("String Literal: %s\n", yytext); }
{DIGIT}+(\.{DIGIT}+)?       { printf("Number: %s\n", yytext); }

"=="|"!="|"<="|">="|"&&"|"||"|"++"|"--" {
                              printf("Logical/Relational Operator: %s\n", yytext); }
"+"|"-"|"*"|"/"|"="|"<"|">" {
                              printf("Operator: %s\n", yytext); }

"{"|"}"|"("|")"|"["|"]"      { printf("Bracket: %s\n", yytext); }
";"                          { printf("Semicolon: %s\n", yytext); }
"#"                          { printf("Preprocessor Symbol: %s\n", yytext); }
[ \t\n]+                     { /* skip whitespace */ }
.                            { printf("Unknown token: %s\n", yytext); }
%%
int main() {
    yylex();
    return 0;
}
