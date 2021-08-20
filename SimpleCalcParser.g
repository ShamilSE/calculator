parser grammar SimpleCalcParser;

options {
    language=C;
    output=AST;
    tokenVocab=SimpleCalc;
}

@members
{
     #define PARSER_INIT_TRACE(name)
     #define PARSER_TRACE(name)
     #define PARSER_TREE(p)  p->expr(p, 0).tree
     #include <iostream>
}

/*------------------------------------------------------------------
 * PARSER RULES
 *------------------------------------------------------------------*/

expr returns [int value]
    :   e=minus   {$value = $e.value;}
     ->^($e)
    ;

minus returns [int value]
    :   e=plus {$value = $e.value;} (MINUS e=plus {$value -= $e.value;})*
    ->^(MINUS plus+)
    ; 

plus returns [int value]
    :   e=div {$value = $e.value;} (PLUS  e=div {$value += $e.value;})*
    ->^(PLUS div+)
    ; 

div returns [int value]
    :   e=mult {$value = $e.value;} (DIV  e=mult {$value /= $e.value;})*
    ->^(DIV mult+)
    ; 

mult returns [int value]
    : e=factor {$value = $e.value;} (MULT e=factor {$value *= $e.value;})*
    ->^(MULT factor+)
    ;

factor returns [int value]
    : NUMBER {$value = $NUMBER->getText($NUMBER)->toInt32($NUMBER->getText($NUMBER));}
    ;
