K�    	          CREATE:EX(1,1):MARK(1);  	               ��]     �?  �?
  
        PRBODEGUEROASSIGN:A(2)=1; 
           �  �     @  �?  
       QUEUE,1,2,PRPRACT;         ��    �     @             SEIZE:BODEGUERO;"                 ��          "            DELAY:EX(2,2);            ��]      @   @ # 
         #RELEASE:BODEGUERO:NEXT(PRREGISTRO);#              	   ! 
  
        PRPRACTASSIGN:A(2)=2; 
           �  �     @   @  
          QUEUE,2;         ��              	   SEIZE:PRACTICANTE;"                 ��          "         
   DELAY:EX(3,3);            ��]     @@  @@  
         RELEASE:PRACTICANTE;               	  '          PRREGISTROCOUNT:A(2);
 '          �      @  
          QUEUE,3;         ��                 SEIZE:REGISTRADOR;"                 ��          "            DELAY:NP(4,4);            ��_     �@  �@  
         RELEASE:REGISTRADOR;               	  &  
        TALLY:A(2),INT(1):DISPOSE;  &   ��       �      @               �