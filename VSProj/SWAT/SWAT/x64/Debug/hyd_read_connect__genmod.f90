        !COMPILER-GENERATED INTERFACE MODULE: Fri Jul 10 09:03:38 2026
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE HYD_READ_CONNECT__genmod
          INTERFACE 
            SUBROUTINE HYD_READ_CONNECT(CON_FILE,OBTYP,NSPU1,NSPU,NHYDS,&
     &NDSAVE)
              CHARACTER(LEN=20) :: CON_FILE
              CHARACTER(LEN=8) :: OBTYP
              INTEGER(KIND=4), INTENT(IN) :: NSPU1
              INTEGER(KIND=4), INTENT(IN) :: NSPU
              INTEGER(KIND=4), INTENT(IN) :: NHYDS
              INTEGER(KIND=4), INTENT(IN) :: NDSAVE
            END SUBROUTINE HYD_READ_CONNECT
          END INTERFACE 
        END MODULE HYD_READ_CONNECT__genmod
