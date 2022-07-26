BEGIN;

CREATE: EX(1,2): MARK(1);
BRANCH, 1:
    WITH, 0.5, VENT:
    WITH, 0.3, CAJERO:
    WITH, 0.2, SB;

VENT ASSIGN: A(2) = 1;
    QUEUE, 1;
    SEIZE: Ventanilla;
    DELAY: NP(2, 3);
    RELEASE: Ventanilla: NEXT(SALIDA);

CAJERO ASSIGN: A(2) = 2;
    QUEUE, 2;
    SEIZE: Cajero;
    DELAY: NP(3, 3);
    RELEASE: Cajero: NEXT(SALIDA);

SB  ASSIGN: A(2) = 3;
    QUEUE, 3;
    SEIZE: Servicio;
    DELAY: NP(4, 5);
    RELEASE: Servicio;

SALIDA COUNT: A(2);
    TALLY: A(2), INT(1): DISPOSE;
END;