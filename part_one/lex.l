%{
#include<stdio.h>
%}
%option noyywrap

delimiters [ \t\n]+

digit [0-9]
uppercase_letter [A-Z]
lowercase_letter [a-z]
positive_integer [+]?{digit}+
negative_integer [-]{digit}+

float_point {digit}+[.]{digit}+
license_plate {uppercase_letter}{uppercase_letter}{uppercase_letter}[-]{digit}{digit}{digit}{digit}
word ({uppercase_letter}|{lowercase_letter})+
cell_phone_number {digit}{digit}{digit}{digit}[-]{digit}{digit}{digit}{digit}
person_name {word}[ ]{word}[ ]{word}|{word}[ ]{word}[ ]{word}[ ]{word}

%%
{delimiters} {}
{cell_phone_number} {printf("Foi encontrado um telefone. LEXEMA: %s\n", yytext);}
{positive_integer}	{printf("Foi encontrado um numero inteiro positivo. LEXEMA: %s\n", yytext);}
{negative_integer}	{printf("Foi encontrado um numero inteiro negativo. LEXEMA: %s\n", yytext);}
{float_point} {printf("Foi encontrado um numero com parte decimal. LEXEMA: %s\n", yytext);}
{license_plate} {printf("Foi encontrado uma placa. LEXEMA: %s\n", yytext);}
{person_name} {printf("Foi encontrado um nome proprio. LEXEMA: %s\n", yytext);}
{word} {printf("Foi encontrado uma palavra. LEXEMA: %s\n", yytext);}
%%

int main(void){
   return yylex();
}
