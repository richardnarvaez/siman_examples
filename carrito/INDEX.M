K�    	          CREATE:EX(1,1);  	                ��]     �?  �?  
          SELECCIONAR_CARRITOQUEUE,1;        ��                 SEIZE:CARRITO;"                 ��          "   4        4BRANCH,1:WITH,0.4,NMDPRODUCTOS:WITH,0.6,MDPRODUCTOS;4          ����      �  �  ���>��? )  3 
 " 
        "NMDPRODUCTOSASSIGN:A(2)=1:MARK(1);" 
          �  �     @  �? !        !DELAY:EX(4,4):NEXT(CAJA_EXPRESS);!           ��]     �@  �@  
  
        MDPRODUCTOSASSIGN:A(2)=2; 
           �  �     @   @           DELAY:EX(5,5):NEXT(CAJA_NORMAL);            ��]     �@  �@    
       	   CAJA_EXPRESSQUEUE,2;        ��              
   SEIZE:CAJAE;"                 ��          "  '          COUNT:A(2);  '          �      @          DELAY:EX(2,2);            ��]      @   @  
         RELEASE:CAJAE;               	    
         RELEASE:CARRITO;               	  &  
          TALLY:1,INT(1):DISPOSE;  &   ��   ��     
          CAJA_NORMALQUEUE,3;        ��                 SEIZE:CAJAN;"                 ��          "  '          COUNT:A(2);  '          �      @  
         RELEASE:CAJAN;               	    
         RELEASE:CARRITO;               	            DELAY:UN(3,3):DISPOSE;     ��     ��c     @@  @@               �