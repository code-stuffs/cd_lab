#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX 100

typedef struct {
    char op[5];
    char arg1[10];
    char arg2[10];
    char result[10];
} Quadruple;

Quadruple quads[MAX];
int n;

int is_number(char *s) {
    for (int i = 0; s[i]; i++)
        if (!isdigit(s[i])) return 0;
    return 1;
}

void propagate_constants() {
    for (int i = 0; i < n; i++) {
        if (strcmp(quads[i].op, "=") == 0 && is_number(quads[i].arg1)) {
            char var[10];
            strcpy(var, quads[i].result);

            for (int j = i + 1; j < n; j++) {
                if (strcmp(quads[j].arg1, var) == 0)
                    strcpy(quads[j].arg1, quads[i].arg1);
                if (strcmp(quads[j].arg2, var) == 0)
                    strcpy(quads[j].arg2, quads[i].arg1);
            }
        }
    }
}

void fold_constants() {
    for (int i = 0; i < n; i++) {
        if (is_number(quads[i].arg1) && is_number(quads[i].arg2)) {
            int a = atoi(quads[i].arg1);
            int b = atoi(quads[i].arg2);
            int result = 0;
            if (strcmp(quads[i].op, "+") == 0) result = a + b;
            else if (strcmp(quads[i].op, "-") == 0) result = a - b;
            else if (strcmp(quads[i].op, "*") == 0) result = a * b;
            else if (strcmp(quads[i].op, "/") == 0 && b != 0) result = a / b;
            else continue;

            sprintf(quads[i].arg1, "%d", result);
            strcpy(quads[i].op, "=");
            strcpy(quads[i].arg2, "");
        }
    }
}

void print_quads() {
    printf("\nOptimized Quadruples:\n");
    for (int i = 0; i < n; i++) {
        printf("%s\t%s\t%s\t%s\n", quads[i].op, quads[i].arg1, quads[i].arg2, quads[i].result);
    }
}

int main() {
    printf("Enter number of quadruples: ");
    scanf("%d", &n);

    printf("Enter quadruples (op arg1 arg2 result):\n");
    for (int i = 0; i < n; i++) {
        scanf("%s %s %s %s", quads[i].op, quads[i].arg1, quads[i].arg2, quads[i].result);
    }

    propagate_constants();
    fold_constants();
    print_quads();

    return 0;
}
