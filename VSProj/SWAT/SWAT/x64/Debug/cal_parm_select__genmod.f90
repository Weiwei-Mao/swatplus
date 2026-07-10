        !COMPILER-GENERATED INTERFACE MODULE: Fri Jul 10 09:01:36 2026
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CAL_PARM_SELECT__genmod
          INTERFACE 
            SUBROUTINE CAL_PARM_SELECT(IELEM,LY,CHG_PARM,CHG_TYP,CHG_VAL&
     &,ABSMIN,ABSMAX,NUM_DB)
              INTEGER(KIND=4), INTENT(IN) :: IELEM
              INTEGER(KIND=4), INTENT(IN) :: LY
              CHARACTER(LEN=16), INTENT(IN) :: CHG_PARM
              CHARACTER(LEN=16), INTENT(IN) :: CHG_TYP
              REAL(KIND=4), INTENT(IN) :: CHG_VAL
              REAL(KIND=4), INTENT(IN) :: ABSMIN
              REAL(KIND=4), INTENT(IN) :: ABSMAX
              INTEGER(KIND=4), INTENT(IN) :: NUM_DB
            END SUBROUTINE CAL_PARM_SELECT
          END INTERFACE 
        END MODULE CAL_PARM_SELECT__genmod
