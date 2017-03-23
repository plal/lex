%%

%line
%column

/*
%cup
*/ 

%unicode

%standalone

%class plal

%{
int qtdeID=0;
%}


%eof{
System.out.println("Quantidade de Identificadores encontrados: "+qtdeID);
%eof}

/*-*
 * PADROES NOMEADOS:
 */
letter          = [A-Za-z]
num             = [0-9]
under			= [_]
intLit          = 0|[1-9][0-9]*
alphaNum        = {letter}|{num}
identifier      = ({letter}|{under})({alphaNum}|{under})*
whitespace      = [ \n\t\r\f]
multiLineComm	= "/*" [^*] ~"*/" | "/*" "*"+ "*/"
lineComm		= "//" [^*] ~\n 
comm			= {multiLineComm}|{lineComm}


%%
/**
 * REGRAS LEXICAS:
 */
//palavras reservadas
boolean			{ System.out.println("Token BOOLEAN"); }
class			{ System.out.println("Token CLASS"); }
public			{ System.out.println("Token PUBLIC"); }
extends			{ System.out.println("Token EXTENDS"); }
static			{ System.out.println("Token STATIC"); }
void			{ System.out.println("Token VOID"); }
main			{ System.out.println("Token MAIN"); }
String			{ System.out.println("Token STRING"); }
int				{ System.out.println("Token INT"); }
while			{ System.out.println("Token WHILE"); }
if				{ System.out.println("Token IF"); }
else			{ System.out.println("Token ELSE"); }
return			{ System.out.println("Token RETURN"); }
length			{ System.out.println("Token LENGTH"); }
true			{ System.out.println("Token TRUE"); }
false			{ System.out.println("Token FALSE"); }
this			{ System.out.println("Token THIS"); }
new				{ System.out.println("Token NEW"); }
System.out.println {System.out.println("Token SYSTEM OUT PRINT"); }
//operadores
"&&"            { System.out.println("Token &&"); }
"<"				{ System.out.println("Token <"); }
"*"             { System.out.println("Token *"); }
"+"             { System.out.println("Token +"); }
"-"             { System.out.println("Token -"); }
"=="            { System.out.println("Token =="); }
"!="			{ System.out.println("Token !="); }
"!"				{ System.out.println("Token !"); }
//delimitadores e pontuacao
";"				{ System.out.println("Token ;"); }
"."				{ System.out.println("Token ."); }
","				{ System.out.println("Token ,"); }
"="				{ System.out.println("Token ="); }			
"("             { System.out.println("Token ("); }
")"             { System.out.println("Token )"); }
"{"				{ System.out.println("Token {"); }
"}"				{ System.out.println("Token }"); }
"["				{ System.out.println("Token ["); }
"]"				{ System.out.println("Token ]"); }
{identifier}    { qtdeID++; System.out.println("Token ID ("+yytext()+")"); }
{intLit}       	{ System.out.println("Token INT ("+yytext()+")"); }
{comm}			{ }
{whitespace}    { }
. { throw new RuntimeException("Caractere ilegal! '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
