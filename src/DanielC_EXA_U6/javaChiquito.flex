/* --------------------------Usercode Section------------------------ */
package DanielC_EXA_U6;
import java_cup.runtime.*;
import java.util.ArrayList;
%%
   
/* -----------------Options and Declarations Section----------------- */
   
/*The scanner will throw an exception if a character has no match with the rules*/
%yylexthrow Exception
/* 
   The name of the class JFlex will create will be Lexer.
   Will write the code to the file Lexer.java. 
*/
%class Lexer

/*
  The current line number can be accessed with the variable yyline
  and the current column number with the variable yycolumn.
*/
%line
%column
    
/* Will switch to a CUP compatibility mode to interface with a CUP generated parser.*/
%cup
   
/*Declarations*/
%{   
    static String error = null;
    public ArrayList<Elemento> elementos = new ArrayList<>();
    /* To create a new java_cup.runtime.Symbol with information about
       the current token, the token will have no value in this
       case. */
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    /* Also creates a new java_cup.runtime.Symbol with information
       about the current token, but this object has a value. */
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
    public int getyyline(){
        return yyline;
    }
    public int getyycolumn(){
        return yycolumn;
    }
    public void agregaElemento(String token, String lexema){
        elementos.add(new Elemento(token, lexema));
    }
%}
   

/* REGEX Declarations*/
MAS = [+]
MENOS = [-]
POR = [\*]
DIV = [\/]
MOD = [%]
IGUAL = [=]
DIA = [<]
DIC = [>]
AND = [&]
OR = [|]
NOT = [!]
PAA = [(]
PAC = [)]
LLA = [{]
LLC = [}]
COA = [\[]
COC = [\]]
PUNTO = [.]
SPREG = [?]
PCOMA = [;]
COMA = [,]
DPUNTOS = [:]
PUBLIC = public
PRIVATE = private
PROTECTED = protected
DEFAULT = default
EXTENDS = extends
SWITCH = switch
ABSTRACT = abstract
IF = if
CLASS = class
DO = do
THIS = this
BREAK = break
TRY = try
CATCH = catch
DEFAULT = default
FOR = for
IMPORT = import
NEW = new
PACKAGE = package
RETURN = return
SUPER = super
ELSE = else
WHILE = while
FINAL = final
VOID = void
STATIC = static

LINT = ((0)|([1-9][0-9]*))
LDOUBLE = ([0-9]+(\.)[0-9]+)d
LBOOL = ((true)|(false))
LCHAR = '[\w\d]?'
LSTRING = [\"].*[\"]
INT = (int)
LONG = (long)
DOUBLE = (double)
FLOAT = (float)
CHAR = (char)
SHORT = (short)
BYTE = (byte)
BOOLEAN = (boolean)
STRING = (String)
ID = ([a-zA-Z_$])([a-zA-Z0-9_$]+)?

NotEOL = [^\r\n]
LineTerminator = \r|\n|\r\n
WhiteSpace     = {LineTerminator} | [ \t\f]

MLCOMMENTSTART = "/*"
MLCOMMENTCONTENTS = ([^*]|\*[^/])
MLCOMMENTEND = "*/"
MLCOMMENT = {MLCOMMENTSTART}{MLCOMMENTCONTENTS}*{MLCOMMENTEND}

SLCOMMENT = "//".*{LineTerminator}
   
%%
/* ------------------------Lexical Rules Section---------------------- */
{MAS}		{ agregaElemento("MAS", yytext()); return symbol(sym.MAS); }
{MENOS}		{ agregaElemento("MENOS", yytext()); return symbol(sym.MENOS); }
{POR}		{ agregaElemento("POR", yytext()); return symbol(sym.POR); }
{DIV}		{ agregaElemento("DIV", yytext()); return symbol(sym.DIV); }
{MOD}		{ agregaElemento("MOD", yytext()); return symbol(sym.MOD); }
{IGUAL}		{ agregaElemento("IGUAL", yytext()); return symbol(sym.IGUAL); }
{DIA}		{ agregaElemento("DIA", yytext()); return symbol(sym.DIA); }
{DIC}		{ agregaElemento("DIC", yytext()); return symbol(sym.DIC); }
{AND}		{ agregaElemento("AND", yytext()); return symbol(sym.AND); }
{OR}		{ agregaElemento("OR", yytext()); return symbol(sym.OR); }
{NOT}		{ agregaElemento("NOT", yytext()); return symbol(sym.NOT); }
{PAA}		{ agregaElemento("PAA", yytext()); return symbol(sym.PAA); }
{PAC}		{ agregaElemento("PAC", yytext()); return symbol(sym.PAC); }
{LLA}		{ agregaElemento("LLA", yytext()); return symbol(sym.LLA); }
{LLC}		{ agregaElemento("LLC", yytext()); return symbol(sym.LLC); }
{COA}		{ agregaElemento("COA", yytext()); return symbol(sym.COA); }
{COC}		{ agregaElemento("COC", yytext()); return symbol(sym.COC); }
{PUNTO}		{ agregaElemento("PUNTO", yytext()); return symbol(sym.PUNTO); }
{SPREG}		{ agregaElemento("SPREG", yytext()); return symbol(sym.SPREG); }
{PCOMA}		{ agregaElemento("PCOMA", yytext()); return symbol(sym.PCOMA); }
{COMA}		{ agregaElemento("COMA", yytext()); return symbol(sym.COMA); }
{DPUNTOS}	{ agregaElemento("DPUNTOS", yytext()); return symbol(sym.DPUNTOS); }
{PUBLIC}	{ agregaElemento("PUBLIC", yytext()); return symbol(sym.PUBLIC); }
{PRIVATE}	{ agregaElemento("PRIVATE", yytext()); return symbol(sym.PRIVATE); }
{PROTECTED}	{ agregaElemento("PROTECTED", yytext()); return symbol(sym.PROTECTED); }
{DEFAULT}	{ agregaElemento("DEFAULT", yytext()); return symbol(sym.DEFAULT); }
{EXTENDS}	{ agregaElemento("EXTENDS", yytext()); return symbol(sym.EXTENDS); }
{SWITCH}	{ agregaElemento("SWITCH", yytext()); return symbol(sym.SWITCH); }
{ABSTRACT}	{ agregaElemento("ABSTRACT", yytext()); return symbol(sym.ABSTRACT); }
{IF}		{ agregaElemento("IF", yytext()); return symbol(sym.IF); }
{CLASS}		{ agregaElemento("CLASS", yytext()); return symbol(sym.CLASS, yytext()); }
{DO}		{ agregaElemento("DO", yytext()); return symbol(sym.DO); }
{THIS}		{ agregaElemento("THIS", yytext()); return symbol(sym.THIS); }
{BREAK}		{ agregaElemento("BREAK", yytext()); return symbol(sym.BREAK); }
{TRY}		{ agregaElemento("TRY", yytext()); return symbol(sym.TRY); }
{CATCH}		{ agregaElemento("CATCH", yytext()); return symbol(sym.CATCH); }
{DEFAULT}	{ agregaElemento("DEFAULT", yytext()); return symbol(sym.DEFAULT); }
{FOR}		{ agregaElemento("FOR", yytext()); return symbol(sym.FOR); }
{IMPORT}	{ agregaElemento("IMPORT", yytext()); return symbol(sym.IMPORT); }
{NEW}		{ agregaElemento("NEW", yytext()); return symbol(sym.NEW); }
{PACKAGE}	{ agregaElemento("PACKAGE", yytext()); return symbol(sym.PACKAGE); }
{RETURN}	{ agregaElemento("RETURN", yytext()); return symbol(sym.RETURN); }
{SUPER}		{ agregaElemento("SUPER", yytext()); return symbol(sym.SUPER); }
{ELSE}		{ agregaElemento("ELSE", yytext()); return symbol(sym.ELSE); }
{WHILE}		{ agregaElemento("WHILE", yytext()); return symbol(sym.WHILE); }
{FINAL}		{ agregaElemento("FINAL", yytext()); return symbol(sym.FINAL); }
{VOID}		{ agregaElemento("VOID", yytext()); return symbol(sym.VOID); }
{STATIC}	{ agregaElemento("STATIC", yytext()); return symbol(sym.STATIC); }

{INT}		{ agregaElemento("INT", yytext()); return symbol(sym.INT); }
{LONG}		{ agregaElemento("LONG", yytext()); return symbol(sym.LONG); }
{DOUBLE}	{ agregaElemento("DOUBLE", yytext()); return symbol(sym.DOUBLE); }
{FLOAT}		{ agregaElemento("FLOAT", yytext()); return symbol(sym.FLOAT); }
{CHAR}		{ agregaElemento("CHAR", yytext()); return symbol(sym.CHAR); }
{SHORT}		{ agregaElemento("SHORT", yytext()); return symbol(sym.SHORT); }
{BYTE}		{ agregaElemento("BYTE", yytext()); return symbol(sym.BYTE); }
{BOOLEAN}	{ agregaElemento("BOOLEAN", yytext()); return symbol(sym.BOOLEAN); }
{STRING}        { agregaElemento("STRING", yytext()); return symbol(sym.STRING); }
{LINT}		{ agregaElemento("LINT", yytext()); return symbol(sym.LINT); }
{LDOUBLE}	{ agregaElemento("LDOUBLE", yytext()); return symbol(sym.LDOUBLE); }
{LBOOL}		{ agregaElemento("LBOOL", yytext()); return symbol(sym.LBOOL); }
{LCHAR}		{ agregaElemento("LCHAR", yytext()); return symbol(sym.LCHAR); }
{LSTRING}	{ agregaElemento("LSTRING", yytext()); return symbol(sym.LSTRING); }
{ID}		{ agregaElemento("ID", yytext()); return symbol(sym.ID, yytext()); }

{MLCOMMENT}     { agregaElemento("MLCOMMENT", yytext()); return symbol(sym.MLCOMMENT); }
{SLCOMMENT}     { agregaElemento("SLCOMMENT", yytext()); return symbol(sym.SLCOMMENT); }

{WhiteSpace}    { /*Sólo ignorar*/ }   

[^]             { throw new Exception(String.format("Error léxico\nCaracter inválido <"+yytext()+"> en linea %d, columna %d", (yyline+1), (yycolumn+1))); }
