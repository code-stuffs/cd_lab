%{
#include<stdio.h>

%}

%%
[0-9]+      { printf("Number: %s\n", yytext); }
[a-z]+    { printf("lowercase: %s\n", yytext); }
[A-Z]+  { printf("Uppercase: %s\n", yytext); }
.|\n        {/* ignore everything else */ }
%%

int main()
{

yylex();
return 0;

}

int yywrap()
{
return 1;
}
