lexer grammar SimpleCalcLexer;

options {
    language=C;
}

@members
{
    #define LEXER_TRACE(name)
}
 
/*------------------------------------------------------------------
 * LEXER RULES
 *------------------------------------------------------------------*/

INT: '0'..'9'+;
WS: (' ' | '\t' | '\n' | '\r')+ {$channel = HIDDEN;};
PLUS: '+';
MINUS: '-';
MULT: '*';
DIV: '/';
OPENBRACKET: '('; {$channel = HIDDEN;};
CLOSEBRACKET: ')'; {$channel = HIDDEN;};
