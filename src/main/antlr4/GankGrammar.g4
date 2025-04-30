grammar GankGrammar;

program     : statement+ ;

statement   : input
           | output
           | assignment
           | conditional
           | loop;

input  : 'read' '(' IDENTIFIER ')' ';' ;

output : 'write' '(' expression ')' ';' ;

assignment  : IDENTIFIER '=' expression ';' ;

conditional : 'if' '(' expression ')' '{' statement+ '}' ('else' '{' statement+ '}')? ;

loop        : 'for' '(' assignment ';' expression ';' assignment ')' '{' statement+ '}' ;

expression : arithmetic_expr
          | logical_expr
          | STRING ;

arithmetic_expr : '(' arithmetic_expr ')'
               | arithmetic_expr ('+' | '-' | '*' | '/') arithmetic_expr
               | IDENTIFIER
               | NUMBER ;

logical_expr : '(' logical_expr ')'
            | logical_expr ('&&' | '||' | '==' | '!' | '<' | '>') logical_expr
            | IDENTIFIER
            | NUMBER
            | BOOLEAN ;

IDENTIFIER  : [a-zA-Z_][a-zA-Z0-9_]* ;
NUMBER      : [0-9]+ ;
STRING      : '"' (~["\r\n])* '"';
BOOLEAN     : 'true' | 'false' ;

WS          : [ \t\r\n]+ -> skip ;