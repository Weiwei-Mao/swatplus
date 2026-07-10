        !COMPILER-GENERATED INTERFACE MODULE: Fri Jul 10 09:01:16 2026
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE WQ_SEMIANALYT__genmod
          INTERFACE 
            FUNCTION WQ_SEMIANALYT(TRES,TDEL,TERM_M,PROCK,CPREV,CINT)
              REAL(KIND=4), INTENT(IN) :: TRES
              REAL(KIND=4), INTENT(IN) :: TDEL
              REAL(KIND=4), INTENT(IN) :: TERM_M
              REAL(KIND=4), INTENT(IN) :: PROCK
              REAL(KIND=4), INTENT(IN) :: CPREV
              REAL(KIND=4), INTENT(IN) :: CINT
              REAL(KIND=4) :: WQ_SEMIANALYT
            END FUNCTION WQ_SEMIANALYT
          END INTERFACE 
        END MODULE WQ_SEMIANALYT__genmod
