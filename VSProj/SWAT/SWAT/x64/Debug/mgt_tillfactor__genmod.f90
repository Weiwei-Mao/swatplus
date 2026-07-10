        !COMPILER-GENERATED INTERFACE MODULE: Fri Jul 10 09:00:56 2026
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MGT_TILLFACTOR__genmod
          INTERFACE 
            SUBROUTINE MGT_TILLFACTOR(JJ,BIO_MIX_EVENT,EMIX,DTIL)
              INTEGER(KIND=4), INTENT(IN) :: JJ
              LOGICAL(KIND=4), INTENT(IN) :: BIO_MIX_EVENT
              REAL(KIND=4), INTENT(INOUT) :: EMIX
              REAL(KIND=4) :: DTIL
            END SUBROUTINE MGT_TILLFACTOR
          END INTERFACE 
        END MODULE MGT_TILLFACTOR__genmod
