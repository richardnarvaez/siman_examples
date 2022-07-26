;El jefe de un almacén estima cada 5 minutos, según un proceso exponencial, la afluencia de sus clientes. Para el despacho de los productos, el almacén ocupa los servicios de un bodeguero, un practicante y un registrador. Un cliente que llega es atendido por el bodeguero en caso que este tenga un máximo de 1 usuario en espera, caso contrario es atendido por el practicante. Los tiempos de servicio son exponenciales con media de 3 y 6 minutos para el bodeguero y el practicante respectivamente. Una vez que el usuario es atendido, por el bodeguero o el practicante, se dirige a la sesión de registro, en donde el registrador demora aproximadamente 2 minutos, según un proceso Poisson, en realizar el proceso de verificación y registro del inventario. Si el almacén funciona 8 horas diarias, realice la simulación en Lenguaje SIMAN de 5 días laborables del funcionamiento del sistema de servicio para obtener lo siguiente: 

BEGIN;
    CREATE: EX(1, 1): MARK(1); 
    
    PRBODEGUERO ASSIGN: A(2) = 1;
    QUEUE, 1, 2, PRPRACT;
    SEIZE: BODEGUERO;
    DELAY: EX(2,2);
    RELEASE: BODEGUERO: NEXT(PRREGISTRO);

    PRPRACT ASSIGN: A(2) = 2; 
    QUEUE, 2;
    SEIZE: PRACTICANTE;
    DELAY: EX(3,3);
    RELEASE: PRACTICANTE;

    PRREGISTRO COUNT: A(2); 
    QUEUE, 3;
    SEIZE: REGISTRADOR;
    DELAY: NP(4,4);
    RELEASE: REGISTRADOR;
    TALLY: A(2),INT(1): DISPOSE;
END;