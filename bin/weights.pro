pro weights, res

   ; 0.5 x 0.625 MERRA-2 native grid
   OldType = CTM_Type( 'GEOS5', res=[ 0.625D,  0.5D ] )
   OldGrid = CTM_Grid( OldType )
   
   ; New grid
   NewType = CTM_Type( 'GEOS5', res=Res )
   NewGrid = CTM_Grid( NewType )

   ; Format string
   case ( Res[0] ) of
      2     : fmtStr = '(3x,12f8.4)'
      2.5   : fmtStr = '(3x,12f8.4)'
      4     : fmtStr = '(3x,12f7.3)'  
      5     : fmtStr = '(3x,12f7.3)'  
      else  : fmtStr = '(3x,12f8.4)'  
   endcase

   ; Filename
   case ( Res[0] ) of
      2    : WeightFile = 'weights_05x0625_to_2x25.txt'
      2.5  : WeightFile = 'weights_05x0625_to_2x25.txt'
      4    : WeightFile = 'weights_05x0625_to_4x5.txt'
      5    : WeightFile = 'weights_05x0625_to_4x5.txt'
      else : WeightFile = ''
   endcase

   ; Make the weight file
   CTM_GetWeight, OldGrid, NewGrid, $
                  WeightFile=WeightFile, WeightFormat=fmtStr

end


;    IF ( IMX == 72 .and. JMX == 46 ) THEN
;       fmtStr = '(3x,12f7.3)'                           ! 4 x 5
;    ELSE IF ( IMX == 144 .and. JMX == 91 ) THEN
;       fmtStr = '(3x,12f8.4)'                           ! 2 x 2.5
;    ELSE IF ( IMX == 288 .and. JMX == 181 ) THEN
;       fmtStr = '(3x,12f9.5)'                           ! 1 x 1.25
;    ELSE IF ( IMX == 360 .and. JMX == 181 ) THEN
;       fmtStr = '(3x,12f8.4)'                           ! 1 x 1           
;    ENDIF
