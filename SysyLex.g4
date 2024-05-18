lexer grammar SysyLex;

// keyword
INT : 'int';
FLOAT : 'float';
VOID : 'void';
CONST : 'const';
RETURN : 'return';
IF : 'if';
ELSE : 'else';
WHILE : 'while';
BREAK : 'break';
CONTINUE : 'continue'; 

// delimeter
LP : '(' ;
RP : ')' ;
LB : '[' ;
RB : ']' ;
LC : '{' ;
RC : '}' ;
COMMA : ',' ;
SEMICOLON : ';';
QUESTION : '?';
COLON : ':';

// operator
MINUS : '-';
NOT : '!';
ASSIGN : '=';
ADD : '+';
MUL : '*';
DIV : '/';
MOD : '%';
AND : '&&';
OR : '||';
EQ : '==';
NEQ : '!=';
LT : '<';
LE : '<=';
GT : '>';
GE : '>=';

// integer literal
INT_LIT : ('-'|'+')?(('0'[0-7]*)|([1-9][0-9]*)|('0''x'([0-9]|[a-f]|[A-F])));

// float literal
FLOAT_LIT : (FLOAT_FRAGMENT|[0-9]+)(('e'|'E')('-'|'+')?[0-9]+)('f'|'F')?;

// fragment for float literal
fragment
FLOAT_FRAGMENT : ('-')?(([0-9]+'.'[0-9]*)|([0-9]*'.'[0-9]+));

// identifier
ID : ([A-Z]|[a-z]|'_')([A-Z]|[a-z]|'_'|[0-9])*;

// string
STRING : '"'(ESC|.)*?'"';

// for string
fragment
ESC : '\\"'|'\\\\';

// whitespace
WS : 
    [ \t\r\n] -> skip
    ;

// comments
LINE_COMMENT : '//' .*? '\r'? '\n' -> skip;
BLOCK_COMMENT : '/*'.*?'*/'-> skip ;


LEX_ERR : (('e''-'|'+')|[0-9A-Za-z])*;