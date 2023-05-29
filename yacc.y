%{
#include<stdio.h>
#include <stdlib.h>

int yyerror(char *c);
int yylex (void);
int result = 0; 

%}

%token NUMBER SOMA MULTIPLICACAO EOL

%%

S : E EOL {
    printf("Achou a raiz. Sintaticamente correto!\n\n");
    return 0;

}
    |
    ;

E : E SOMA T{
    $$ = $1 + $3;
    printf("SOMA: \n");
    printf("%d + %d = %d \n\n", $1 , $3, $$);
    result = $$;
    }
    | T
    ;

T : T MULTIPLICACAO F{
        $$ = $1 * $3;
        printf("MULTIPLICACAO: \n");
        printf("%d x %d = %d \n\n", $1 , $3, $$);
        result = $$;
    }
    | F
    ;

F : NUMBER{
    $$ = $1;
    }
    | {
        yyerror("Erro Sintatico");
    }
    ;


%%



int yyerror(char* c) {
    printf("Erro  >>  %s\n", c);
    exit(0);
    
}

int main() {
    yyparse();
    printf("Resultado: %d\n", result);
    return 0;
}
