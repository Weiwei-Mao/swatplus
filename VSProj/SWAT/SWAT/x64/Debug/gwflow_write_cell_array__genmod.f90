        !COMPILER-GENERATED INTERFACE MODULE: Fri Jul 10 09:01:43 2026
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GWFLOW_WRITE_CELL_ARRAY__genmod
          INTERFACE 
            SUBROUTINE GWFLOW_WRITE_CELL_ARRAY(IUNIT,VALUES,NCELL_IN,   &
     &FMT_CODE)
              INTEGER(KIND=4), INTENT(IN) :: NCELL_IN
              INTEGER(KIND=4), INTENT(IN) :: IUNIT
              REAL(KIND=4), INTENT(IN) :: VALUES(NCELL_IN)
              INTEGER(KIND=4), INTENT(IN) :: FMT_CODE
            END SUBROUTINE GWFLOW_WRITE_CELL_ARRAY
          END INTERFACE 
        END MODULE GWFLOW_WRITE_CELL_ARRAY__genmod
