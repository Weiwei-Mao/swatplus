        !COMPILER-GENERATED INTERFACE MODULE: Fri Jul 10 09:01:23 2026
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GWFLOW_PUMP_ALLO__genmod
          INTERFACE 
            SUBROUTINE GWFLOW_PUMP_ALLO(OB_ID_DMD,DEMAND_VOL,EXTRACTED, &
     &DMD_UNMET)
              INTEGER(KIND=4), INTENT(IN) :: OB_ID_DMD
              REAL(KIND=4), INTENT(IN) :: DEMAND_VOL
              REAL(KIND=4), INTENT(INOUT) :: EXTRACTED
              REAL(KIND=4), INTENT(INOUT) :: DMD_UNMET
            END SUBROUTINE GWFLOW_PUMP_ALLO
          END INTERFACE 
        END MODULE GWFLOW_PUMP_ALLO__genmod
