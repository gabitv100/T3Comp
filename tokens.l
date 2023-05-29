

%{
    #include<stdio.h>
    #include<string.h>
    int yyerror(char *c);   
    #include "y.tab.h"

%}


%%

[0-9]+      { 
        yylval = atoi(yytext);
        return NUMBER;

}

[+]         {
    return SOMA;
}

[*]         {
    return MULTIPLICACAO;
}

\n          {
    return EOL;
}

. {
    yyerror("Erro Léxico");
};

%%

int yywrap(){
    return 1;
};

