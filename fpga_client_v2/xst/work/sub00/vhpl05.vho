      H  �X        TW��         !         G   unisim       unisim 9     �   �   unisim   all         9     :   IMP  q 9        .  qI  y  ��  ��  �A  �	  �  ��  ��  ��  ��  ��  ��  ��  � (� <i D9 L	 S� [� cy kI s z� � �� � Y .� M� x� �� �9 ֑ �� ,� �y x� �� �) �� 	�� 	�� 
L� ��  r   )  u1  }  ��  ��  �)  �!  �i  ��  �� ,� @Q H! O� W� _� ga o1 w ~� �� �� � A 2� Q� |� �� �! �y �� 0i Б t� �� � � 	�� 	�� 
P� �  �       % (� 89 ~A �� �� .	 `� �� �! �� �a � � �A � +� Ca Z� �� �	 �� -� �� 	R� 	� 
� 
H� 
�I 
�� 
�Y 
�) B� VY i� �� �� �Q  q       �  �     9          #)  *�  2�  FQ  Y�  a�  iy         '  .�  6�  J9  ]�  e�  ma          u1     v  ��          '     :   Bit_Clk  '  Y     p   �  #)      A          Y     :   Reset  .�  Y     p   �  *�      A          Y     :   Sync  6�  Y     p   �  2�     A          Y     @      >�      Q4     :�  Bi      J9     @     >�     :   Bit_Num  J9  Y     p   �  FQ     >�          Y     @      R	      Q4     N!  U�      ]�     @     R	     :   Slot_Num  ]�  Y     p   �  Y�     R	          Y     :   Slot_End  e�  Y     p   �  a�     A          Y     :   	Frame_End  ma  Y     p   �  iy     A          Y     :   ac97_timing  u1  �        �  qI  Y  �     :   last_frame_cycle  }  �     p   �  y     A  �      �     :   sync_i  ��  �     p   �  ��     A  �      �     :   slot_end  ��  �     p   �  ��     A  �      �     @      �q      Q4     ��  �Y      �)     @     �q     :   slot_No  �)  �     p   �  �A     �q  ��      �     -   idle  �i      �     -   wait_for_new_frame  �i     �     -   send_request_frame  �i     �     -   response_slot0  �i     �     -   response_slot1  �i     �     -   response_slot2  �i     �     -   	end_state  �i     �     ,   �  �  �	  �       �	     �  ��  ��  ��  ��  ��  ��             .  �Q  �!     |   �  �	  �9  �     :   reg_if_states  �!  �     v  �	          ��     :   reg_if_state  ��  �     p   �  ��     ��  �      �     @      �      Q4     ީ  �y      �a     @     �     v  �[     �      ��     V          �1     
    	�  [  �       �a     �1  ��     :   register_addr  ��  �     p   �  �     �a  �      �     @     	�     @    	�      Q4    � �      �1     @     q      Q4    � Y     A     @    q     v  �[    q     ,�     V         !     
    8�  [ $�      A    ! ,�     :   register_data ,�  �     p   � (�    A $�      �     @     8�     @    8�      Q4    0� 4�     !     :   register_write_cmd @Q  �     p   � <i     A  [      �     :   ac97_reg_error_i H!  �     p   � D9     A  [      �     :   ac97_reg_busy_i O�  �     p   � L	     A  [      �     :   valid_Frame W�  �     p   � S�     A  �      �     :   valid_Control_Addr _�  �     p   � [�     A  �      �     :   record_pcm_left_valid ga  �     p   � cy     A  �      �     :   record_pcm_right_valid o1  �     p   � kI     A  �      �     :   accept_pcm_left w  �     p   � s     A  �      �     :   accept_pcm_right ~�  �     p   � z�     A  �      �     @    ��     ' Q4    �� ��     �q     @     ��     v  �[    ��     ��     V         �A     
    ��  [ �)      �q    �A ��     :   new_data_out ��  �     p   � �    �q �)      �     @     ��     @    ��     ' Q4    �� ��     �A     @    ��     ' Q4    �� �i     �Q     @     ��     v  �[    ��     ��     V         �!     
    ܑ  [ �	      �Q    �! ��     :   data_out ��  �     p   � ��    �Q �	      �     @     ܑ     @    ܑ     ' Q4    ة ��     �!     @    �a     ' Q4    �y �I     �1     @     �a     v  �[    �a     �     :   data_in �  �     p   � �    �1 ��      �     
    �a  � ��      �1    �� �     @    �     ' Q4    �� �     q     @     �     v  �[    �     A     :   slot0 A  �     p   � Y    q       �     
    �  �       q    ) A     @    "�     ' Q4    � &�     *�     @     "�     v  �[    "�     2�     :   slot1 2�  �     p   � .�    *� :Q      �     
    "�  � :Q      *�    6i 2�     @    B!     ' Q4    >9 F	     I�     @     B!     v  �[    B!     Q�     :   slot2 Q�  �     p   � M�    I� Y�      �     
    B!  � Y�      I�    U� Q�     @    aa     ' Q4    ]y eI     i1     @     aa     v  �[    aa     |�     V         q     
    �q  [ t�      i1    q |�     :   slot3 |�  �     p   � x�    i1 t�      �     @     �q     @    �q     ' Q4    �� ��     q     @    �A     ' Q4    �Y �)     �     @     �A     v  �[    �A     ��     V         ��     
    �Q  [ ��      �    �� ��     :   slot4 ��  �     p   � ��    � ��      �     @     �Q     @    �Q     ' Q4    �i ��     ��     :   codec_rdy_i �!  �     p   � �9     A  [      �     @     ��      Q4    �	 ��     ҩ     S  $     ' �� ��     @    ��     v  �[    ��     �y     :   PCM_Record_Left_i �y  �     p   � ֑    ҩ �I      �     
    ��  � �I      ҩ    �a �y     @     �      Q4    �1 �     ��     S  $     ' �� �     @    �     v  �[    �     ��     :   PCM_Record_Right_i ��  �     p   � ��    �� q      �     
    �  � q      ��    � ��     \     #)  :� (�     \     *�  2� (�     \     2�  �� (�     } �     \     FQ  (�     \     Y�  �A (�     \     a�  �� (�     \     iy  y (�        ,�  qI    	Y A ) � �  � $�      �     :   ac97_timing_I_1 0i  �     E   ,� (�  �     �  ��         89            4Q  Bj              �                         zY ~A     S �y     2�  C vq     �  �         G�     o       C�  ��         vq     �  [         O�     o       K� L	         vq     �  [         Wy     o       S� D9         vq     �  [         _I     o       [a  �j         vq       ��     :�  �\ k     S �y     :�  C k     S ��    c1 g r�                �� A "� �� ) Ky b� n�  �� r�     S �y     �*  C z�     S �y     ��  C z�     S �|    r� v� �q     S �y    �9  C �q     S ��    z� ~� �1     �  ��         �A     o  (     �Y  ��         �1     �  C         �     o  )     �) L	         �1     �  [         ��     o  *     �� D9         �1     �  [         ��     o  +     ��  �j         �1     �  iz         ��     o  ,     ��  �         �1     S �y     ��  C �a     �  ��         �9     o  .     �Q (�         �a     �  C         �	     o  /     �! <i         �a     �  [         ��     o  1     �� <i         ��     r          �<    �� �I     v  ��         Б     U     �y     FS  FS  �� ̩  �     T   = Б  �     r         �i    �9 �	 �I     <  -        �a �� �1     r         �q    �A � �� �� �� �I �     <  %        �1 ��          � ��     r         �    � n�     S �y     y  C ��     �  ��         ��     o  :     �  ��         ��     r         ��    �� �q     <  9        �� A          �� A     r         Y    �q n�     S �y     y  C �     �  ��         �     o  @       ��         �     r         )    � �     <  ?        � "�          �� "�     r         �    � n�     S w�     �A *i 29     @     &�     S �y     ��  C 29     S ��    &� .Q ��     S �y    <i  [ ��     @    =�     >    � :	 A�     S x�    =�  C Qy     @    I�     >    � E� M�     S x�    I�  C Qy     S �|    A� M� |q     �  C         YI     o  N     Ua D9         |q     �  ��         a     o  O     ]1  ��         |q     �  ��         h�     o  Q     e  ��         l�     r          �<    h� �Y     v  ��         t�     U     x�     FS  FS  �� p�  �     T   /= t�  �     r         Qy    YI a �Y     <  H        |q l� ��     �  ��         �)     o  U     �A  ��         �     r          �<    �) ��     r         6!    �Y ��     <  G        �� � ��     r         29    �� ��     <  F        �� ��          �� ��     r         ��    �� n�     S w�     �A �Q �!     @    �i     S �y     ��  C �!     S ��    �i �9 �q     @    ��     ' Q4    �	 ��     ��     @    ��     q    � �� Ʃ     S ��    ��  � �     �  C         �y     o  ^     ʑ D9         �     �  ��         �I     o  _     �a  ��         �     �  ��         �     o  b     �1  ��         �     r          �<    � ��     v  ��         ��     U     ��     �[  �[  �� ��  �     T   /= ��  �     r         Ʃ    �y �I ��     <  ]        � � �q     r         �!    �� �Y     <  \        �q )          �� )     r         A    �Y n�     S w�     �A � �     @    	     S �y     ��  C �     S ��    	 � ?�     @    �     ' Q4    �  �     $i     @    �     q    � � (Q     � $i         ,9     o  h     (Q  �Z         ?�     �  C         4	     o  i     0!  �j         ?�     �  ��         ;�     o  j     7�  ��         ?�     r         �    ,9 4	 ;� C�     <  g        ?� Ky          �� Ky     r         G�    C� n�     �  [         SI     o  n     Oa L	         b�     �  �         [     o  o     W1  ��         b�          �� b�     r         _    SI [ n�     V         j�         f� n�     r         j�     n�     r         k    n� zY     r         @	    G� O� Wy _I zY     <          vq r� <!     a   �) <!     :�  �     :   register_if_PROCESS �  �     E   �) ~A  �     � L	         ��       v     ��  ��              �     � D9         ��       w     ��  ��              �     @     ��      Q4    �� �i     �Q     @    ��     q    s �� .	     s   000  �[ �!     � �9         �	     �    � �! ��     J    �	 �� �a � �� � �A 
� .	     s   001  �[ ��     � ��         ��     �    � �� ��     s   010  �[ �y     � đ         �a     �    � �y ��     s   011  �[ �1     � �I         �     �    � �1 ��     s   100  �[ ��     � �         ��     �    i �� ��     s   101  �[ �     � �         �     �    "Q � ��     s   110  �[ �Y     � �q         �A     �    &9 �Y ��     s   000  �[      � �)         
�     V         
�     �    *!  ��          �              ��              ��              ��              ��              ��              ��             �         n  y     �� �Q          ��      �     @    5�      Q4    1� 9�     =�     @    5�     q    s 5� `�     V         Ey     
    \�  [ Ia      Q1    Ey MI     � Ia         `�     v  �[    5�             @    \�     @    \�      Q4    U Y     Ey       �     MI =�              �     �  C         l�     S ��     ��  �� l�     �    h� d� pq     J    l� xA ��     �  [         xA     �     �< tY pq     v  ��         �     U     ��     �	  �	  �� |)  �     T   = �  �       �     pq [�              �     S +    �� �i ��     S +    �Q �9 ��     � ��         �!     Y    � [�         Y    [  ��         Y    � ��         Y    [ �           �     �� S�              �     @    ��     >    Y �	 ��     � S�         ��       �     �� ��              �     @    ��     >    Y �� �a     � [�         �a       �     �y ��              �     @    �1     >    Y �I �     � <i         �       �     � �1              �     @    ��     >    Y �� �     �  ��         �       �     � ��              �     @    �q     >    Y � �A     � �         �A       �     �Y �q              �     @   
 �     ' Q4    �)  �     �     @    �     q    Y � �     s   	000000000  �[ �     � �         �       �     � �              �     @    i     ' Q4    � Q      9     @     i     q    Y i +�     s   00  �[ (	     � $!         +�       �     (	  9              �     @    3�     >    .� /� Ca     S �[    ?y ;�     � 7�         Ca     Y    �� <i           �     ;� 3�              �     @    K1     ' Q4    GI O     S     @    K1     q    .� K1 Z�     �  �         Z�       �     V� S              �     @    b�     ' Q4    ^� f�     jq     @     b�     q    .� b� ��     V         rA     
    ��  [ v)      }�    rA z     � v)         ��     v  �[    b�             @     ��     @    ��     ' Q4    �� ��     rA       �     z jq              �     @    �i     ' Q4    �� �Q     �9     @    �i     q    M� �i �	     � (�         �	       �     �! �9              �     @    ��     ' Q4    �� ��     ��     @     ��     q    M� �� ��     V         �y     
    ��  [ �a      �1    �y �I     � �a         ��     v  �[    ��             @     ��     @    ��     ' Q4    � �     �y       �     �I ��              �                         � )� -�     @    �     S  $    ߡ  ' �q     S  $    � �Y �A     @    �q     ' Q4    �q �)     �     @     �A     q    x� �A �     V     �A ��     
    ��  [ �      
�    �� �     � �         �     v  �[    �A             o  �     � �         ۹     @    Q     ' Q4    i !     "	     @    !     S  $    9  ' Q     q    x� Q )�     �  ��         )�     o  �     %� "	         ۹     a  �     ۹     ��  �                         dq � ��     @    9y     S  $    5�  ' =a     S  $    9y AI E1     @    =a     ' Q4    =a I     M     @     E1     q    �� E1 dq     V     E1 T�     
    P�  [ X�      `�    T� \�     � X�         dq     v  �[    E1             o  �     \� M         1�     @    lA     ' Q4    hY t     w�     @    t     S  $    p)  ' lA     q    �� lA �     �  �         �     o  �     {� w�         1�     a  �     1�     �  �                         �� 	N� 	R�     V         �i     
    ��  [ �Q      �q    �i �9     � �Q         ��     @     ��     @    ��     ' Q4    �	 �!     �i     o  �     �9 �         ��     S �y     y  C 	J�     @    ��     ' Q4    �� �y     �a     @    ��     q    � �� �1     � Y         �1     o  �     �I �a         	J�     S �y     ��  C 	G       �        �) 	Q 	#� 	7a 	C  �A 	G     @     �A      �    .�  } �q չ     v Q4    ��     ١     q    � չ �Y     � .�         �Y     @            o  �     ݉ ١         �)         �� �)     r         �A    �Y �     @    	i      �    M�  } 	� ��     v Q4    ��     ��     q    � �� 	�     � M�         	�     @            o  �     	 � ��         	Q         � 	Q     r         	i    	� �     @    	�     � x�         		     o  �     	! �         	#�         	9 	#�     r         	�    		 �     @    	3y     � ��         	/�     o  �     	+� �         	7a         	'� 	7a     r         	3y    	/� �     V         	?1         	;I 	C     r         	?1     �     r         �    � 	N�     r         ��    �1 	N�     <  �        	J� 	G ��     a  �     ��     y  ��  �A Y .� M� x� ��  �                         	�) 	�     S �y     2�  C 	�A     V         	bY     
    	u�  [ 	fA      �Q    	bY 	j)     � 	fA         	y�     @     	u�     @    	u�     ' Q4    	q� 	n     	bY     o  �     	j) ��         	�A       ��     :�  �\ 	��     S �y     :�  C 	��     S ��    	}� 	�� 	�Y     S �y     y  C 	�9     S �y     ��  C 	�9     S �|    	�i 	�Q 	׉     � �         	�	     o  �     	�! ��         	׉     @    	��     ' Q4    	�� 	��     	��     @     	��     q    �� 	�� 	Ϲ     @    	�y     ' Q4    	�� 	�a     	�I     @     	�y     q    �� 	�y 	�1     S 	��    	�I  [ 	�     � 	�1         	Ϲ     v  �[         	��     U     	��     �[  FS  �[ 	�  �     T   & 	��  �     o  �     	� 	��         	ӡ     r          �<    	Ϲ 	�q     r         	�9    	�	 	�q     <  �        	׉ 	ӡ 	�Y     r         	��    	�q 	�)     r         	Z�    	y� 	�)     <  �        	�A 	�Y 	V�     a  � 	�� 	V�     :�  �     :   Data_Out_Handle 	��  �     E  � 	�� 	�  �     @    	��     >    �� 	�� 	��     � 	��         
�            	��  J:              �                         
D� 
H�       ��     :�  �\ 
!     S �y     :�  [ 
!     S ��    

Q 
9 
A     @    
�     ' Q4    
	 
�     
!�     @     
�     q    � 
� 
=     @    
)�     ' Q4    
%� 
-y     
1a     @     
)�     q    � 
)� 
5I     S 	��    
1a  R
 
91     � 
5I         
=     o       
91 
!�         
A     r         
!    
= 
D�     <          
A 
i     a   
L� 
i     :�  �     :   Shifting_Data_Coming_Back 
P�  �     E   
L� 
H�  �                         
�a 
�I       ��     :�  �\ 
`A     S �y     :�  C 
`A     S ��    
Xq 
\Y 
�y     S w�     �A 
h 
o�     @     
d)     S �y     ��  C 
o�     S ��    
d) 
k� 
��     @    
w�     >    � 
s� 
{�     � 
w�         
�     o       
{� �9         
��     @    
�Q     >    � 
�i 
�9     � 
�Q         
�!     o  #     
�9 cy         
��     @    
��     >    � 
�	 
��     � 
��         
��     o  $     
�� kI         
��     r         
o�    
� 
�! 
�� 
��     <          
�� 
�y     r         
`A    
�� 
�a     <          
�y 
T�     a       
T�     :�  �     S  ޫ    
� 
�� 
�     � 
�1         
��     Y     � cy         Y     ��  y           )     
� S�              �     S  ޫ    
щ 
�q 
͡     � 
ɹ         
�Y     Y     � kI         Y     ��  y           *     
͡ [�              �     � �9         
�)       ,     
�A z�              �                         >� B�       ��     :�  �\ 
��     S �y     :�  C 
��     S ��    
�� 
�� ;     S �y     ��  C  i     S w�     �A 
��  i     @    
��     S ��    
�� 
�� 31     @    9     >    � Q !     S �[    � 	     � !         �     Y    �� 9         o  5     	 s         31     @   
 �     >    � � #�     S �[    +a 'y     � #�         /I     Y    �� �         o  6     'y z�         31     r          i    � /I 7     <  4        31 ;     r         
��    7 >�     <  3        ; 
�     a  1     
�     :�  �     S  ޫ    N� Rq J�     � F�         VY     Y     � s         Y     ��  y           ;     J� �              �     S  ޫ    b e� ^)     � ZA         i�     Y     � z�         Y     ��  y           <     ^) Z              �                         �� ��       ��     :�  �\ y�     S �y     :�  C y�     S ��    q� u� �     S �y     ��  C �!     S w�     �A �9 �!     @    �Q     S ��    }i �Q �A     @    ��     ' Q4    �	 ��     ��     @    ��     S  $    ��  ' ��     q    � �� ��     � ��         �y     o  H     �� ֑         �A     S �y     ��  C �     S w�     �A �1 �     @    �I     S ��    �a �I �Y     @    ��     ' Q4    � ù     ǡ     @    ù     S  $    ��  ' ��     q    � �� ˉ     � ǡ         �q     o  O     ˉ ��         �Y     r         �    �q �)     r         �!    �y �)     <  G        �A �Y �     r         y�    �) ��     <  F        � m�     a  A �� m�     :�  �     :   Get_Record_Data �  �     E  A �� ��  �     � ֑         ��       X     � 0�              �     � ��         �Q       Y     �i L
              �     %     �  �  � ��     �  q !     �   $C:/VHDL/fpga_client_v2/ac97_core.vhd 9  �                	ac97_core   IMP   work      	ac97_core   IMP   work      	ac97_core       work      std_logic_1164       IEEE      standard       std