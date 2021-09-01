%{
#include<stdio.h>
%}
%option noyywrap

delimiters [ \t\n;]+

reg_operation add|sub|and|or|xor|nand|nor|xnor
imm_operation addi|subi|andi|ori|xori|nandi|nori|xnori|beq|bne
float_operation fadd|fsub
jump_operation j|jr

int_register zero|v[0-1]|a[0-3]|t[0-9]|s[0-7]|k[0-1]|gp|sp|fp|ra
float_register f([0-9]|[1-2][0-9]|[3][0-1])

positive_dec [+]?[0-9]+
negative_dec [-][0-9]+
dec_imm {positive_dec}|{negative_dec}
imm {dec_imm}
label [a-z]+

label_definition {label}[:]
reg_instruction {reg_operation}[ ]{int_register}[,][ ]{int_register}[,][ ]{int_register}
imm_instruction {imm_operation}[ ]{int_register}[,][ ]{int_register}[,][ ]{imm}
float_instruction {float_operation}[ ]{float_register}[,][ ]{float_register}[,][ ]{float_register}
jump_instruction {jump_operation}[ ]{label}

%%
{delimiters} {}
{reg_instruction} {printf("Foi encontrado uma instrucao do tipo R. LEXEMA: %s\n", yytext);}
{imm_instruction} {printf("Foi encontrado uma instrucao do tipo I. LEXEMA: %s\n", yytext);}
{float_instruction} {printf("Foi encontrado uma instrucao do tipo F. LEXEMA: %s\n", yytext);}
{jump_instruction} {printf("Foi encontrado uma instrucao do tipo J. LEXEMA: %s\n", yytext);}
{label_definition} {printf("Foi encontrado uma definicao de label. LEXEMA: %s\n", yytext);}
%%

int main(void){
   return yylex();
}
