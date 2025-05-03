%{

#include<stdio.h>
int word_count =0;

%}

%option noyywrap

%%
[a-zA-z]+    { word_count++; }
[ \t\n] ;

. ;

%%

int main()
{

printf("Enter text: \n");
yylex();
printf("Total word count is: %d\n", word_count);

return 0;

}
