# T3Comp
Terceiro Trabalho Compiladores 2022/2

Baseado nos tokens produzidos pelo analisador léxico, o YACC analisador sintático, irá validar as regras de produção da gramatica.
Dentro desta pasta, há uma sub pasta com o programa Analisador.exe já compilado.
  
  
Se desejar passar pelo processo de compilação, siga os passos a baixo:
 - bison -dy yacc.y

O arquivo yacc.y descreve as regras gramaticais, e a execução do comando bison irá gerar dois arquivos:

	y.tab.c ->lógica de produção da gramatica implementada pelo YACC
	
  	y.tab.h ->catalogo de não-terminais da gramatica.

Após essa etapa, executar:
  - lex tokens.l
  
Esse comando irá gerar o arquivo lex.yy.c que contém a lógica do programa gerado pelo flex para analise sintática.

Por fim:
  - gcc -o Analisador lex.yy.c y.tab.c
  
Irá linkar ambos os códigos C gerados pelo flex/yacc em um programa executável para analise léxica e sintática de uma gramatica simples para soma e multiplicação.
