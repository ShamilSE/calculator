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

PLUS        : '+' ;
MINUS       : '-' ;
MULT        : '*' ;
DIV         : '/' ;
 
NUMBER      : (DIGIT)+
            ;
 
WHITESPACE  : ( '\t' | ' ' | '\r' | '\n'| '\u000C' )+
              {
                 $channel = HIDDEN;
              }
            ;

fragment 
DIGIT       : '0'..'9'
            ;

