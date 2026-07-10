        !COMPILER-GENERATED INTERFACE MODULE: Fri Jul 10 08:59:56 2026
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE NUT_NP_FLOW__genmod
          INTERFACE 
            SUBROUTINE NUT_NP_FLOW(C_A,E_A,CETOB,C_ATOB,CO2FROMA,E_ATOB,&
     &IMM_ATOB,MNR_ATOB)
              REAL(KIND=4), INTENT(IN) :: C_A
              REAL(KIND=4), INTENT(IN) :: E_A
              REAL(KIND=4), INTENT(IN) :: CETOB
              REAL(KIND=4), INTENT(IN) :: C_ATOB
              REAL(KIND=4), INTENT(IN) :: CO2FROMA
              REAL(KIND=4), INTENT(OUT) :: E_ATOB
              REAL(KIND=4), INTENT(OUT) :: IMM_ATOB
              REAL(KIND=4), INTENT(OUT) :: MNR_ATOB
            END SUBROUTINE NUT_NP_FLOW
          END INTERFACE 
        END MODULE NUT_NP_FLOW__genmod
