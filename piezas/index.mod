BEGIN;
    
    CREATE: EX(1,2): MARK(1);
;PRIO
    ASSIGN: A(2)=2;
;STATUS
    ASSIGN: A(3)=1;
;TTRASLADO
    ASSIGN: A(4)=2;
    
    PROCESS1    QUEUE, 1;
                SEIZE: MAQUINA1;
                DELAY: EX(5, 3);
                RELEASE: MAQUINA1;

    TRASLADO    QUEUE, 2;
                SEIZE: MONTACARGAS;
                DELAY: EX(A(4), 1);
                RELEASE: MONTACARGAS;
    BRANCH, 1:
        IF, A(3) .EQ. 1, PROCESS2:
        IF, A(3) .EQ. 2, PROCESS3:
        IF, A(3) .EQ. 3, PROCESS4:
        ELSE, PROCESS3;

    PROCESS2    QUEUE, 3;
                SEIZE: MAQUINA2;
                DELAY: EX(5, 3);
                ASSIGN: A(3)=2;
                ASSIGN: A(4)=3;
                RELEASE: MAQUINA2: NEXT(TRASLADO);
    
    PROCESS3    QUEUE, 4;
                SEIZE: MAQUINA3;
                DELAY: EX(5, 3);
                RELEASE: MAQUINA3: NEXT(VERIFICACION);
    
    PROCESS4    QUEUE, 5;
                SEIZE: MAQUINA4;
                DELAY: EX(5, 3);
                ASSIGN: A(3)=4;
                ASSIGN: A(2)=1;
                ASSIGN: A(4)=7;
                RELEASE: MAQUINA4: NEXT(TRASLADO);

    VERIFICACION    QUEUE, 6;
                SEIZE: INSPECTOR;
                DELAY: UN(8, 3);
                RELEASE: INSPECTOR;

    BRANCH, 2:
        WITH, 0.70, EMPAQUETADO:
        WITH, 0.30, CHANGEDIR2;
    
    CHANGEDIR2  ASSIGN: A(3)=3;
                COUNT: A(2);
                ASSIGN: A(4)=7: NEXT(TRASLADO);

    EMPAQUETADO     QUEUE, 7;
                    SEIZE: EMPLEADO;
                    DELAY: EX(6, 3);
                    RELEASE: EMPLEADO;

    SALIDA COUNT: A(2);
        TALLY: 1, INT(1): DISPOSE;

END;