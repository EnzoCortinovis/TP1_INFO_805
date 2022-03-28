/* --------------------------Section de Code Utilisateur---------------------*/
package fr.usmb.m1isc.compilation.simple;
import java_cup.runtime.Symbol;

%%

/* -----------------Section des Declarations et Options----------------------*/
// nom de la class a generer
%class SimpleLexer
%unicode
%line   // numerotation des lignes
%column // numerotation caracteres par ligne

// utilisation avec CUP
// nom de la classe generee par CUP qui contient les symboles terminaux
%cupsym SimpleParserSym
// generation analyser lexical pour CUP
%cup

// code a ajouter dans la classe produite
%{

%}
/* definitions regulieres */
number  =   [0-9];
plus    =   "+";
minus  =   "-";
mult   =   "*";
div     =   "/";
sep     =   \s;
finish   =   [;];

%% 
/* ------------------------Section des Regles Lexicales----------------------*/

{sep}+          { /* pas d'action */ }
{number}        { return new Symbol(SimpleParserSym.NUMBER, yyline, yycolumn, new Integer(yytext())); }
{plus}         { return new Symbol(SimpleParserSym.PLUS, yyline, yycolumn); }
{minus}           { return new Symbol(SimpleParserSym.MINUS, yyline, yycolumn); }
{mult}           { return new Symbol(SimpleParserSym.MULT, yyline, yycolumn); }
{div}           { return new Symbol(SimpleParserSym.DIV, yyline, yycolumn); }
{finish}         { return new Symbol(SimpleParserSym.FINISH, yyline, yycolumn); }
;               { return new Symbol(SimpleParserSym.ERROR, yyline, yycolumn); }