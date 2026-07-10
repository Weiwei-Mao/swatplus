        !COMPILER-GENERATED INTERFACE MODULE: Fri Jul 10 09:02:49 2026
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SE_REACTIONS_AQUIFER__genmod
          INTERFACE 
            SUBROUTINE SE_REACTIONS_AQUIFER(IAQ,CONC_RG,K_RG,K_SLOPE)
              INTEGER(KIND=4) :: IAQ
              REAL(KIND=4) :: CONC_RG(3)
              REAL(KIND=4) :: K_RG(4,3)
              INTEGER(KIND=4) :: K_SLOPE
            END SUBROUTINE SE_REACTIONS_AQUIFER
          END INTERFACE 
        END MODULE SE_REACTIONS_AQUIFER__genmod
