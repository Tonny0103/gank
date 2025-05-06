grammar Gank;

EspecificadorDeTipo: 'string' | 'int';
FOR: 'for';
IF: 'if';
ELSE: 'else';
WRITE: 'write';
READ: 'read';

OperadorAritmetico: '+' | '-' | '*' | '/';
OperadorLogico: '&&' | '||' | '!' | '==' | '!=' | '<' | '>' | '<=' | '>=';
OperadorDeAtribuicao: '=' | '+=' | '-=' | '*=' | '/=';
OperadorDeIncrementacao: '++' | '--';

Identificador: [a-zA-Z_] [a-zA-Z0-9_]*;
STRING: '"' ( '\\' . | ~["\\\r\n] )* '"';
INTEIRO: [0-9]+;

PONTO_VIRGULA: ';';
ABRE_CHAVES: '{';
FECHA_CHAVES: '}';
ABRE_PARENTESES: '(';
FECHA_PARENTESES: ')';

WS: [ \t\n\r]+ -> skip;

programa: (declaracao | comando | estruturaControle)* EOF;

declaracao: EspecificadorDeTipo Identificador ('=' expressao)? PONTO_VIRGULA;

comando:
    expressao PONTO_VIRGULA
    | comandoWrite
    | comandoRead
    ;

estruturaControle:
    comandoFor
    | comandoIfElse
    ;

comandoFor:
    FOR ABRE_PARENTESES
    (declaracao | expressao? PONTO_VIRGULA)
    expressao? PONTO_VIRGULA
    expressao?
    FECHA_PARENTESES
    bloco;

comandoIfElse:
    IF ABRE_PARENTESES expressao FECHA_PARENTESES bloco (ELSE bloco)?;

comandoWrite:
    WRITE ABRE_PARENTESES expressao FECHA_PARENTESES PONTO_VIRGULA;

comandoRead:
    READ ABRE_PARENTESES expressao FECHA_PARENTESES PONTO_VIRGULA;

bloco:
    ABRE_CHAVES (comando | declaracao | estruturaControle)* FECHA_CHAVES
    | comando | declaracao
    ;

expressao:
    valorInt
    | valorString
    | Identificador
    | Identificador OperadorDeIncrementacao
    | expressao OperadorAritmetico expressao
    | expressao OperadorLogico expressao
    | ABRE_PARENTESES expressao FECHA_PARENTESES
    | Identificador OperadorDeAtribuicao expressao
    | expressao OperadorDeAtribuicao expressao
    ;

valorInt: INTEIRO;
valorString: STRING;