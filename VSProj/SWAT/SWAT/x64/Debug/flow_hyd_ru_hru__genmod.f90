        !COMPILER-GENERATED INTERFACE MODULE: Fri Jul 10 09:02:31 2026
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FLOW_HYD_RU_HRU__genmod
          INTERFACE 
            SUBROUTINE FLOW_HYD_RU_HRU(IDAY_START,SURFQ,LATQ,TILEQ,UH,  &
     &HYD_FLO)
              INTEGER(KIND=4), INTENT(IN) :: IDAY_START
              REAL(KIND=4), INTENT(IN) :: SURFQ
              REAL(KIND=4), INTENT(IN) :: LATQ
              REAL(KIND=4), INTENT(IN) :: TILEQ
              REAL(KIND=4), INTENT(IN) :: UH(BSN_PRM%DAY_LAG_MX,TIME%   &
     &STEP)
              REAL(KIND=4), INTENT(INOUT) :: HYD_FLO(BSN_PRM%DAY_LAG_MX,&
     &TIME%STEP)
            END SUBROUTINE FLOW_HYD_RU_HRU
          END INTERFACE 
        END MODULE FLOW_HYD_RU_HRU__genmod
