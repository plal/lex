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
lineComm		= "//" (.)* ~\n 
comm			= {multiLineComm}|{lineComm}


%%
/**
 * REGRAS LEXICAS:
 */
//palavras reservadas
boolean			{ System.out.println("Token keyword BOOLEAN"); }
class			{ System.out.println("Token keyword CLASS"); }
public			{ System.out.println("Token keyword PUBLIC"); }
extends			{ System.out.println("Token keyword EXTENDS"); }
static			{ System.out.println("Token keyword STATIC"); }
void			{ System.out.println("Token keyword VOID"); }
main			{ System.out.println("Token keyword MAIN"); }
String			{ System.out.println("Token keyword STRING"); }
int				{ System.out.println("Token keyword INT"); }
while			{ System.out.println("Token keyword WHILE"); }
if				{ System.out.println("Token keyword IF"); }
else			{ System.out.println("Token keyword ELSE"); }
return			{ System.out.println("Token keyword RETURN"); }
length			{ System.out.println("Token keyword LENGTH"); }
true			{ System.out.println("Token keyword TRUE"); }
false			{ System.out.println("Token keyword FALSE"); }
this			{ System.out.println("Token keyword THIS"); }
new				{ System.out.println("Token keyword NEW"); }
System.out.println {System.out.println("Token keyword SYSTEM OUT PRINT"); }
//operadores
"&&"            { System.out.println("Token operator &&"); }
"<"				{ System.out.println("Token operator <"); }
"*"             { System.out.println("Token operator *"); }
"+"             { System.out.println("Token operator +"); }
"-"             { System.out.println("Token operator -"); }
"=="            { System.out.println("Token operator =="); }
"!="			{ System.out.println("Token operator !="); }
"!"				{ System.out.println("Token operator !"); }
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
{identifier}    { qtdeID++; System.out.println("Token ID "+yytext()); }
{intLit}       	{ System.out.println("Token INT "+yytext()); }
{comm}			{ System.out.println("Token COMMENT"); }
{whitespace}    { }
. { throw new RuntimeException("Caractere ilegal! '" + yytext() + "' na linha: " + (yyline+1) + ", coluna: " + yycolumn); }
