        !COMPILER-GENERATED INTERFACE MODULE: Fri Jul 10 09:01:37 2026
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE UNIT_HYD__genmod
          INTERFACE 
            SUBROUTINE UNIT_HYD(TC,UH)
              REAL(KIND=4), INTENT(IN) :: TC
              REAL(KIND=4), INTENT(OUT) :: UH(BSN_PRM%DAY_LAG_MX,TIME%  &
     &STEP)
            END SUBROUTINE UNIT_HYD
          END INTERFACE 
        END MODULE UNIT_HYD__genmod
