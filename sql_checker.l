*/  input code eg
*if condition
*while count < 10
*SELECT name FROM students;

*/

%{
#include <stdio.h>
%}

/* Regular definitions for keywords and tokens */
IF          if
ELSE        else
WHILE       while
SELECT      [Ss][Ee][Ll][Ee][Cc][Tt]
FROM        [Ff][Rr][Oo][Mm]
IDENTIFIER  [a-zA-Z_][a-zA-Z0-9_]*
NUMBER      [0-9]+
SEMICOLON   ;
WHITESPACE  [ \t\n]+

%%
{IF}        { printf("IF keyword found\n"); }
{ELSE}      { printf("ELSE keyword found\n"); }
{WHILE}     { printf("WHILE keyword found\n"); }
{SELECT}    { printf("SELECT keyword found\n"); }
{FROM}      { printf("FROM keyword found\n"); }
{IDENTIFIER} { printf("IDENTIFIER: %s\n", yytext); }
{NUMBER}    { printf("NUMBER: %s\n", yytext); }
{SEMICOLON} { printf("SEMICOLON found\n"); }
{WHITESPACE} { /* Skip whitespace */ }
.           { printf("Unknown character: %s\n", yytext); }

%%

int main(int argc, char **argv) {
    printf("Enter input (Ctrl+D to end):\n");
    yylex();
    return 0;
}
