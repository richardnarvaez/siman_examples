BEGIN;
    CREATE: NP(1,1): MARK(1);
    
    QUEUE,1;
    SEIZE: FACTURACION;
    BRANCH, 1:
    WITH, 0.70, CLIENTESET:
    WITH, 0.30, CLIENTESEF;
    
    CLIENTESET ASSIGN:A(2)=1;
    DELAY : EX(3,1): NEXT(CONTINUAR);
    
    CLIENTESEF ASSIGN:A(2)=2;
    DELAY : EX(2,1);
    CONTINUAR RELEASE: FACTURACION;
    TALLY:1, INT(1);
    COUNT: A(2);
    
    OPCIONES BRANCH, 1:
    WITH, 0.5, SALIR:
    WITH, 0.40, TRASLADO:
    WITH, 0.10, REVISION;
    
    TRASLADO DELAY: EX(4,1);
    BODEGA QUEUE,2;
    SEIZE: BODEGA;
    DELAY: RN(5,1);
    RELEASE: BODEGA:NEXT(SALIR);
    
    REVISION QUEUE,3;
    SEIZE: REVISION;
    DELAY: UN(6,1);
    BRANCH, 1:
    WITH, 0.15, REEMPLAZO:
    WITH, 0.85, SALIR1;
    REEMPLAZO DELAY: EX(7,1);
    COUNT: 3;
    SALIR1 RELEASE: REVISION;
    SALIR TALLY: 2, INT(1): DISPOSE;
END;