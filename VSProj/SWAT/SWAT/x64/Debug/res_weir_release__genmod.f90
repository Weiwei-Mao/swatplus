        !COMPILER-GENERATED INTERFACE MODULE: Fri Jul 10 09:01:50 2026
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE RES_WEIR_RELEASE__genmod
          INTERFACE 
            SUBROUTINE RES_WEIR_RELEASE(JRES,ID,IHYD,EVOL_M3,DEP,       &
     &WEIR_HGT)
              INTEGER(KIND=4), INTENT(IN) :: JRES
              INTEGER(KIND=4), INTENT(IN) :: ID
              INTEGER(KIND=4), INTENT(IN) :: IHYD
              REAL(KIND=4), INTENT(IN) :: EVOL_M3
              REAL(KIND=4), INTENT(IN) :: DEP
              REAL(KIND=4), INTENT(IN) :: WEIR_HGT
            END SUBROUTINE RES_WEIR_RELEASE
          END INTERFACE 
        END MODULE RES_WEIR_RELEASE__genmod
