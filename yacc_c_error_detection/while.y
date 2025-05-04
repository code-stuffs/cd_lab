%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *msg);
extern int yylex();
extern void yy_scan_string(const char *);
int syntax_error = 0;  // Flag to track syntax errors

%}

%token WHILE LPAREN RPAREN LBRACE RBRACE SEMICOLON IDENTIFIER NUMBER RELOP

%%

stmt: WHILE LPAREN condition RPAREN block
    ;

condition: IDENTIFIER RELOP NUMBER 
         | NUMBER RELOP IDENTIFIER
         ;

block: LBRACE stmt_list RBRACE
     | LBRACE RBRACE  // Allow empty block
     | stmt
     ;

stmt_list: stmt stmt_list  
         | stmt
         ;

%%

void yyerror(const char *msg) {
    fprintf(stderr, "Invalid syntax.\n");
    syntax_error = 1;  // Set error flag
}

int main() {
    // Hardcoded input
    const char *hardcoded_input = "while (x < 10) { while (y > 5) { } }";

    // Display input with "Entered input is:"
    printf("Entered input is: %s\n", hardcoded_input);

    // Pass input to lexer
    yy_scan_string(hardcoded_input);
    yyparse();
    
    // Display success or failure message
    if (syntax_error)
        printf("Invalid syntax.\n");
    else
        printf("Correct syntax detected. Parsing complete.\n");

    return 0;
}
