;A(1) : MARK
;A(2) : UNKNOWN
;A(3) : TIPO | 1, 2
;A(4) : UNKNOWN

;X(1) : STEP

BEGIN;
    
    CREATE: EX(1, 2): MARK(1);
        ASSIGN: A(3)=1;
        ASSIGN: X(1)=1: NEXT(PROCESSM1);
   
    CREATE: EX(2, 2): MARK(1);
        ASSIGN: A(3)=2;
        ASSIGN: X(1)=1: NEXT(PROCESSM2);
    
    PROCESSM1 QUEUE, 1;
        SEIZE: MAQUINA1;
        DELAY: EX(3, 2);
        RELEASE: MAQUINA1;
        COUNT: 1;

    BRANCH, 1:
        IF, (A(3).EQ.1).AND.(X(1).EQ.1), T1TO2:
        ELSE, T1TO3;

    PROCESSM2 QUEUE, 2;
        SEIZE: MAQUINA2;
        DELAY: EX(3, 2);
        RELEASE: MAQUINA2;
        COUNT: 2;
    
    BRANCH, 1:
        IF, (A(3).EQ.2).AND.(X(1).EQ.1), T1TO2:
        ELSE, T1TO3;

    T1TO2 ASSIGN: X(1)=2: NEXT(TRASLADO);
    T1TO3 ASSIGN: X(1)=3: NEXT(TRASLADO);

    TRASLADO QUEUE, 3;
        SEIZE: MONTACARGAS;
        DELAY: EX(3, 2);
        RELEASE: MONTACARGAS;

    COUNT: 3;

    BRANCH, 1:
        IF, (A(3).EQ.1).AND.(X(1).EQ.2), PROCESSM2:
        IF, (A(3).EQ.2).AND.(X(1).EQ.2), PROCESSM1:
        IF, X(1).EQ.3, PROCESSM3:
        ELSE, PROCESSM4;

    PROCESSM3 QUEUE, 4;
        SEIZE: MAQUINA3;
        DELAY: EX(3, 2);
        RELEASE: MAQUINA3: NEXT(PROCESSM4);

    PROCESSM4 QUEUE, 5;
        SEIZE: MAQUINA4;
        DELAY: EX(3, 2);
        RELEASE: MAQUINA4;

;ID A GUARDAR,  ID TO MIN TNOW
    SALIDA TALLY: 3, INT(1);
        TALLY: A(3), INT(1): DISPOSE;

END;





;A(1) : MARK
;A(2) : UNKNOWN
;A(3) : TIPO | 1, 2
;A(4) : UNKNOWN

;X(1) : STEP

BEGIN;
    
    CREATE: EX(1, 2): MARK(1);
    ASSIGN: A(3)=1;
    ASSIGN: X(1)=1: NEXT(PROCESSM1);
   
    CREATE: EX(2, 2): MARK(1);
    ASSIGN: A(3)=2;
    ASSIGN: X(1)=1: NEXT(PROCESSM2);
    
    PROCESSM1 QUEUE, 1;
        SEIZE: MAQUINA1;
        DELAY: EX(3, 2);
        RELEASE: MAQUINA1;
        COUNT: 1;

    BRANCH, 1:
        IF, (A(3).EQ.1).AND.(X(1).EQ.1), T1TO2:
        ELSE, PROCESSM3;

    PROCESSM2 QUEUE, 2;
        SEIZE: MAQUINA2;
        DELAY: EX(3, 2);
        RELEASE: MAQUINA2;
        COUNT: 2;
    
    BRANCH, 1:
        IF, (A(3).EQ.2).AND.(X(1).EQ.1), T1TO2:
        ELSE, PROCESSM3;

    T1TO2 ASSIGN: X(1)=2: NEXT(TRASLADO);
    T1TO3 ASSIGN: X(1)=3: NEXT(TRASLADO);

    TRASLADO QUEUE, 3;
        SEIZE: MONTACARGAS;
        DELAY: EX(3, 2);
        RELEASE: MONTACARGAS;

    COUNT: 3;

    BRANCH, 1:
        IF, (A(3).EQ.1).AND.(X(1).EQ.2), PROCESSM2:
        IF, (A(3).EQ.2).AND.(X(1).EQ.2), PROCESSM1:
        ELSE, PROCESSM3;

    PROCESSM3 QUEUE, 4;
        SEIZE: MAQUINA3;
        DELAY: EX(3, 2);
        RELEASE: MAQUINA3;

;ID A GUARDAR,  ID TO MIN TNOW
    SALIDA TALLY: 3, INT(1);
    TALLY: A(3), INT(1): DISPOSE;

END;