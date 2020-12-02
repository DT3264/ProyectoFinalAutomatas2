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
P_PUBLIC = public
P_PRIVATE = private
P_PROTECTED = protected
P_DEFAULT = default
P_BYTE = byte
P_SHORT = short
P_INT = int
P_LONG = long
P_FLOAT = float
P_DOUBLE = double
P_CHAR = char
P_BOOLEAN = boolean
P_CONST = const
P_VOID = void
P_STRING = String
OP_SUM = [\+]
OP_RES = [-]
OP_MUL = [\*]
OP_DIV = [\/]
OP_MOD = [%]
OP_ASIG = [=]
OP_SUMASIG = (\+=)
OP_RESASIG = (-=)
OP_DIVASIG = (\/=)
OP_MULASIG = (\*=)
OP_MODASIG = (%=)
OPR_IG = (==)
OPR_DIF = (\!=)
OPR_MAY = (>)
OPR_MEN = (<)
OPR_MAYIG = (>=)
OPR_MENIG = (<=)
OPL_AND = (&&)
OPL_OR = (\|\|)
OPL_ANDSIMP = (&)
OPL_ORSIMP = (\|)
OPU_INC = (\+\+)
OPU_NEG = (-)
OPU_DEC = (--)
P_NULL = null
P_TRUE = true
P_FALSE = false
AG_PA = \(
AG_PC = \)
AG_LLA = (\{)
AG_LLC = (})
AG_CA = \[
AG_CC = ]
P_DO = do
P_WHILE = while
P_FOR = for
P_BREAK = break
P_IF = if
P_ELSE = else
P_ELSEIF = (else if)
P_SWITCH = switch
P_CASE = case
P_TRY = try
P_CATCH = catch
P_FINALLY = finally
P_CONTINUE = continue
UPT = (\.)
DPT = (\.\.)
TPT = (\.\.\.)
CM = (,)
DP = (:)
CE = (;)
CMD = (\")
CMS = (')
P_ABSTRACT = abstract
P_STATIC = static
P_EXTENDS = extends
P_IMPLEMENTS = implements
P_CLASS = class
P_IMPORT = import
P_PACKAGE = package
P_NEW = new
P_FINAL = final
P_THROWS = throws
P_RETURN = return

LineTerminator = \r|\n|\r\n
WhiteSpace     = {LineTerminator} | [ \t\f]
MLCOMMENTSTART = "/*"
MLCOMMENTCONTENTS = ([^*]|\*[^/])
MLCOMMENTEND = "*/"
MLCOMMENT = {MLCOMMENTSTART}{MLCOMMENTCONTENTS}*{MLCOMMENTEND}
SLCOMMENT = "//".*{LineTerminator}
COMENT = {MLCOMMENT} | {SLCOMMENT}
ID = ([a-zA-Z_$])([a-zA-Z0-9_$]+)?
VN = ((0)|([1-9][0-9]*))
VD = ([0-9]+(\.)[0-9]+)d
VC = '[\w\d]?'
VS = [\"].*[\"]
   
%%
/* ------------------------Lexical Rules Section---------------------- */
/* - Para que regrese el texto, symbol debe recibir (Símbolo, yytext)- */
{P_PUBLIC}		{ agregaElemento("P_PUBLIC", yytext()); return symbol(sym.P_PUBLIC); }
{P_PRIVATE}		{ agregaElemento("P_PRIVATE", yytext()); return symbol(sym.P_PRIVATE); }
{P_PROTECTED}		{ agregaElemento("P_PROTECTED", yytext()); return symbol(sym.P_PROTECTED); }
{P_DEFAULT}		{ agregaElemento("P_DEFAULT", yytext()); return symbol(sym.P_DEFAULT); }
{P_BYTE}		{ agregaElemento("P_BYTE", yytext()); return symbol(sym.P_BYTE); }
{P_SHORT}		{ agregaElemento("P_SHORT", yytext()); return symbol(sym.P_SHORT); }
{P_INT}                 { agregaElemento("P_INT", yytext()); return symbol(sym.P_INT); }
{P_LONG}		{ agregaElemento("P_LONG", yytext()); return symbol(sym.P_LONG); }
{P_FLOAT }		{ agregaElemento("P_FLOAT ", yytext()); return symbol(sym.P_FLOAT ); }
{P_DOUBLE}		{ agregaElemento("P_DOUBLE", yytext()); return symbol(sym.P_DOUBLE); }
{P_CHAR}		{ agregaElemento("P_CHAR", yytext()); return symbol(sym.P_CHAR); }
{P_BOOLEAN}		{ agregaElemento("P_BOOLEAN", yytext()); return symbol(sym.P_BOOLEAN); }
{P_CONST}		{ agregaElemento("P_CONST", yytext()); return symbol(sym.P_CONST); }
{P_VOID}		{ agregaElemento("P_VOID", yytext()); return symbol(sym.P_VOID); }
{P_STRING}		{ agregaElemento("P_STRING", yytext()); return symbol(sym.P_STRING); }
{OP_SUM}		{ agregaElemento("OP_SUM", yytext()); return symbol(sym.OP_SUM); }
{OP_RES}		{ agregaElemento("OP_RES", yytext()); return symbol(sym.OP_RES); }
{OP_MUL}		{ agregaElemento("OP_MUL", yytext()); return symbol(sym.OP_MUL); }
{OP_DIV}		{ agregaElemento("OP_DIV", yytext()); return symbol(sym.OP_DIV); }
{OP_MOD}		{ agregaElemento("OP_MOD", yytext()); return symbol(sym.OP_MOD); }
{OP_ASIG}		{ agregaElemento("OP_ASIG", yytext()); return symbol(sym.OP_ASIG); }
{OP_SUMASIG}		{ agregaElemento("OP_SUMASIG", yytext()); return symbol(sym.OP_SUMASIG); }
{OP_RESASIG}		{ agregaElemento("OP_RESASIG", yytext()); return symbol(sym.OP_RESASIG); }
{OP_DIVASIG}		{ agregaElemento("OP_DIVASIG", yytext()); return symbol(sym.OP_DIVASIG); }
{OP_MULASIG}		{ agregaElemento(" OP_MULASIG", yytext()); return symbol(sym. OP_MULASIG); }
{OP_MODASIG}		{ agregaElemento("OP_MODASIG", yytext()); return symbol(sym.OP_MODASIG); }
{OPR_IG}		{ agregaElemento("OPR_IG", yytext()); return symbol(sym.OPR_IG); }
{OPR_DIF}		{ agregaElemento("OPR_DIF", yytext()); return symbol(sym.OPR_DIF); }
{OPR_MAY}		{ agregaElemento("OPR_MAY", yytext()); return symbol(sym.OPR_MAY); }
{OPR_MEN}		{ agregaElemento("OPR_MEN", yytext()); return symbol(sym.OPR_MEN); }
{OPR_MAYIG}		{ agregaElemento("OPR_MAYIG", yytext()); return symbol(sym.OPR_MAYIG); }
{OPR_MENIG}		{ agregaElemento("OPR_MENIG", yytext()); return symbol(sym.OPR_MENIG); }
{OPL_AND}		{ agregaElemento("OPL_AND", yytext()); return symbol(sym.OPL_AND); }
{OPL_OR}		{ agregaElemento("OPL_OR", yytext()); return symbol(sym.OPL_OR); }
{OPL_ANDSIMP}		{ agregaElemento("OPL_ANDSIMP", yytext()); return symbol(sym.OPL_ANDSIMP); }
{OPL_ORSIMP}		{ agregaElemento("OPL_ORSIMP", yytext()); return symbol(sym.OPL_ORSIMP); }
{OPU_INC}		{ agregaElemento("OPU_INC", yytext()); return symbol(sym.OPU_INC); }
{OPU_NEG}		{ agregaElemento("OPU_NEG", yytext()); return symbol(sym.OPU_NEG); }
{OPU_DEC}		{ agregaElemento("OPU_DEC", yytext()); return symbol(sym.OPU_DEC); }
{P_NULL}		{ agregaElemento("P_NULL", yytext()); return symbol(sym.P_NULL); }
{P_TRUE}		{ agregaElemento("P_TRUE", yytext()); return symbol(sym.P_TRUE); }
{P_FALSE}		{ agregaElemento("P_FALSE", yytext()); return symbol(sym.P_FALSE); }
{AG_PA}                 { agregaElemento("AG_PA", yytext()); return symbol(sym.AG_PA); }
{AG_PC}                 { agregaElemento("AG_PC", yytext()); return symbol(sym.AG_PC); }
{AG_LLA}		{ agregaElemento("AG_LLA", yytext()); return symbol(sym.AG_LLA); }
{AG_LLC}		{ agregaElemento("AG_LLC", yytext()); return symbol(sym.AG_LLC); }
{AG_CA}                 { agregaElemento("AG_CA", yytext()); return symbol(sym.AG_CA); }
{AG_CC}                 { agregaElemento("AG_CC", yytext()); return symbol(sym.AG_CC); }
{P_DO}                  { agregaElemento("P_DO", yytext()); return symbol(sym.P_DO); }
{P_WHILE}		{ agregaElemento("P_WHILE", yytext()); return symbol(sym.P_WHILE); }
{P_FOR}                 { agregaElemento("P_FOR", yytext()); return symbol(sym.P_FOR); }
{P_BREAK}		{ agregaElemento("P_BREAK", yytext()); return symbol(sym.P_BREAK); }
{P_IF}                  { agregaElemento("P_IF", yytext()); return symbol(sym.P_IF, yytext()); }
{P_ELSE}		{ agregaElemento("P_ELSE", yytext()); return symbol(sym.P_ELSE); }
{P_ELSEIF}		{ agregaElemento("P_ELSEIF", yytext()); return symbol(sym.P_ELSEIF); }
{P_SWITCH}		{ agregaElemento("P_SWITCH", yytext()); return symbol(sym.P_SWITCH); }
{P_CASE}		{ agregaElemento("P_CASE", yytext()); return symbol(sym.P_CASE); }
{P_TRY}                 { agregaElemento("P_TRY", yytext()); return symbol(sym.P_TRY); }
{P_CATCH}		{ agregaElemento("P_CATCH", yytext()); return symbol(sym.P_CATCH); }
{P_FINALLY}		{ agregaElemento("P_FINALLY", yytext()); return symbol(sym.P_FINALLY); }
{P_CONTINUE}		{ agregaElemento("P_CONTINUE", yytext()); return symbol(sym.P_CONTINUE); }
{UPT}                   { agregaElemento("UPT", yytext()); return symbol(sym.UPT); }
{DPT}                   { agregaElemento("DPT", yytext()); return symbol(sym.DPT); }
{TPT}                   { agregaElemento("TPT", yytext()); return symbol(sym.TPT); }
{CM}                    { agregaElemento("CM", yytext()); return symbol(sym.CM); }
{DP}                    { agregaElemento("DP", yytext()); return symbol(sym.DP); }
{CE}                    { agregaElemento("CE", yytext()); return symbol(sym.CE); }
{CMD}                   { agregaElemento("CMD", yytext()); return symbol(sym.CMD); }
{CMS}                   { agregaElemento("CMS", yytext()); return symbol(sym.CMS); }
{P_ABSTRACT}		{ agregaElemento("P_ABSTRACT", yytext()); return symbol(sym.P_ABSTRACT); }
{P_STATIC}		{ agregaElemento("P_STATIC", yytext()); return symbol(sym.P_STATIC); }
{P_EXTENDS}		{ agregaElemento("P_EXTENDS", yytext()); return symbol(sym.P_EXTENDS); }
{P_IMPLEMENTS}		{ agregaElemento("P_IMPLEMENTS", yytext()); return symbol(sym.P_IMPLEMENTS); }
{P_CLASS}		{ agregaElemento("P_CLASS", yytext()); return symbol(sym.P_CLASS); }
{P_IMPORT}		{ agregaElemento("P_IMPORT", yytext()); return symbol(sym.P_IMPORT); }
{P_PACKAGE}		{ agregaElemento("P_PACKAGE", yytext()); return symbol(sym.P_PACKAGE); }
{P_NEW}                 { agregaElemento("P_NEW", yytext()); return symbol(sym.P_NEW); }
{P_FINAL}		{ agregaElemento("P_FINAL", yytext()); return symbol(sym.P_FINAL); }
{P_THROWS}		{ agregaElemento("P_THROWS", yytext()); return symbol(sym.P_THROWS); }
{P_RETURN}		{ agregaElemento("P_RETURN", yytext()); return symbol(sym.P_RETURN); }
{COMENT }		{ agregaElemento("COMENT ", yytext()); return symbol(sym.COMENT, yytext().replaceAll("\n","")); }
{ID}                    { agregaElemento("ID", yytext()); return symbol(sym.ID, yytext()); }
{VN}                    { agregaElemento("VN", yytext()); return symbol(sym.VN); }
{VD}                    { agregaElemento("VD", yytext()); return symbol(sym.VD); }
{VC}                    { agregaElemento("VC", yytext()); return symbol(sym.VC); }
{VS}                    { agregaElemento("VS", yytext()); return symbol(sym.VS); }
{WhiteSpace}            { /*Sólo ignorar*/ }   
[^]                     { throw new Exception(String.format("Error léxico\nCaracter inválido <"+yytext()+"> en linea %d, columna %d", (yyline+1), (yycolumn+1))); }
