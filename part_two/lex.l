%{
#include<stdio.h>
%}
%option noyywrap

delimiters [ \t\n;]+
register zero|v[0-1]|a[0-3]|t[0-9]|s[0-7]|k[0-1]|gp|sp|fp|ra
immediate [0-9]+
operation add|sub|mul|div|and|or|xor|nand|nor|xnor
instruction_r {operation}[ ]{register}[,][ ]{register}[,][ ]{register}
instruction_i {operation}[ ]{register}[,][ ]{register}[,][ ]{immediate}

%%
{delimiters} {}
{instruction_r} {printf("Foi encontrado uma instrucao do tipo R. LEXEMA: %s\n", yytext);}
{instruction_i} {printf("Foi encontrado uma instrucao do tipo I. LEXEMA: %s\n", yytext);}
%%

int main(void){
   return yylex();
}
