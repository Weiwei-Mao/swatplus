        !COMPILER-GENERATED INTERFACE MODULE: Fri Jul 10 09:02:02 2026
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE RES_HYDRO__genmod
          INTERFACE 
            SUBROUTINE RES_HYDRO(JRES,ID,PVOL_M3,EVOL_M3)
              INTEGER(KIND=4), INTENT(IN) :: JRES
              INTEGER(KIND=4), INTENT(IN) :: ID
              REAL(KIND=4), INTENT(IN) :: PVOL_M3
              REAL(KIND=4), INTENT(IN) :: EVOL_M3
            END SUBROUTINE RES_HYDRO
          END INTERFACE 
        END MODULE RES_HYDRO__genmod
