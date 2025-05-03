%{

#include<stdio.h>
int letter_count =0;

%}

%option noyywrap

%%
[a-zA-z]    { letter_count++; }
[ \t\n] ;

. ;

%%

int main()
{

printf("Enter text: \n");
yylex();
printf("Total letter count is: %d\n", letter_count);

return 0;

}
