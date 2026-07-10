        !COMPILER-GENERATED INTERFACE MODULE: Fri Jul 10 08:59:59 2026
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CHG_PAR__genmod
          INTERFACE 
            FUNCTION CHG_PAR(VAL_CUR,CHG_TYP,CHG_VAL,ABSMIN,ABSMAX)
              REAL(KIND=4), INTENT(IN) :: VAL_CUR
              CHARACTER(LEN=16), INTENT(IN) :: CHG_TYP
              REAL(KIND=4), INTENT(IN) :: CHG_VAL
              REAL(KIND=4) :: ABSMIN
              REAL(KIND=4) :: ABSMAX
              REAL(KIND=4) :: CHG_PAR
            END FUNCTION CHG_PAR
          END INTERFACE 
        END MODULE CHG_PAR__genmod
