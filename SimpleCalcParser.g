parser grammar SimpleCalcParser;

options {
    language=C;
    output=AST;
    tokenVocab=SimpleCalcLexer;
}

@members
{
     #define PARSER_INIT_TRACE(name)
     #define PARSER_TRACE(name)
     #define PARSER_TREE(p)  p->expr(p, 0).tree
     #include <iostream>
     #include <string>
}

/*------------------------------------------------------------------
 * PARSER RULES
 *------------------------------------------------------------------*/
 
// PARSER

prog: stat+;


stat
    : 
        expr {std::cout << $expr.value << std::endl;}
        ->^(expr)
    ;    

expr returns [int value]
    :
        e=multExpr {$value = $e.value;}
        (
            PLUS^ e=multExpr {$value += $e.value;}
            |
            MINUS^ e=multExpr {$value -= $e.value;}
        )*
    ;

multExpr returns [int value]
    :
        e=atom {$value = $e.value;}
        (
            MULT^ e=atom {$value *= $e.value;}
            |
            DIV^ e=atom {$value /= $e.value;}
        )*
    ;

atom returns [int value]
    :
        INT {$value = $INT->getText($INT)->toInt32($INT->getText($INT));}
        |
        OPENBRACKET expr CLOSEBRACKET {$value = $expr.value;} ->expr
    ;
