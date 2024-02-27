      SUBROUTINE input
      COMMON /triangle/ p(3, 2),fi,cosfi,S,pi,a_l,b_l,c_l,a(2),b(2),c(2)
      DO i=1, 3
      READ *, p(i,1), p(i,2)
      END DO
      CALL pre
      CALL area
      END

      SUBROUTINE check_degeneracy
      COMMON /triangle/ p(3, 2),fi,cosfi,S,pi,a_l,b_l,c_l,a(2),b(2),c(2)
      IF (S.EQ.0.0) THEN
      PRINT *,'ERROR: TRIANGLE IS DEGENERATE OR DOES NOT EXIST'
      STOP
      END IF
      END

      SUBROUTINE area
      COMMON /triangle/ p(3, 2),fi,cosfi,S,pi,a_l,b_l,c_l,a(2),b(2),c(2)
      S = abs(a(1)*c(2) - a(2)*c(1)) / 2
      END

      SUBROUTINE pre
      COMMON /triangle/ p(3, 2),fi,cosfi,S,pi,a_l,b_l,c_l,a(2),b(2),c(2)

      REAL temp_l
      DIMENSION temp(2)

      a(1) = p(2,1) - p(1,1)
      a(2) = p(2,2) - p(1,2)
      b(1) = p(3,1) - p(2,1)
      b(2) = p(3,2) - p(2,2)
      c(1) = p(1,1) - p(3,1)
      c(2) = p(1,2) - p(3,2)

      a_l=sqrt(a(1)**2+a(2)**2)
      b_l=sqrt(b(1)**2+b(2)**2)
      c_l=sqrt(c(1)**2+c(2)**2)
      
      IF (b_l < a_l) THEN
      temp_l = b_l
      b_l = a_l
      a_l = temp_l

      temp = b
      b = a
      a = temp
      END IF

      IF (c_l < a_l) THEN
      temp_l = c_l
      c_l = a_l
      a_l = temp_l

      temp = c
      c = a
      a = temp
      END IF
      END

      SUBROUTINE m_angle
      COMMON /triangle/ p(3, 2),fi,cosfi,S,pi,a_l,b_l,c_l,a(2),b(2),c(2)

      fi = asin(2*S/(c_l*b_l))*(180/pi)
      END

      SUBROUTINE m_cos_angle
      COMMON /triangle/ p(3, 2),fi,cosfi,S,pi,a_l,b_l,c_l,a(2),b(2),c(2)

      cosfi = (c(1)*(-b(1)) + c(2)*(-b(2))) / (c_l * b_l)
      END

      SUBROUTINE menu
      COMMON /triangle/ p(3, 2),fi,cosfi,S,pi,a_l,b_l,c_l,a(2),b(2),c(2)
1     PRINT *,'1) Write coordinates'
      PRINT *,'2) Find area'
      PRINT *,'3) Find smallest angle'
      PRINT *,'4) Find cosine of a smallest angle'
      PRINT *,'5) Exit'
      READ *,n
      GO TO (10,20,30,40, 50), n
10    CALL input
      GO TO 1

20    CALL check_degeneracy
      PRINT *,S
      GO TO 1

30    CALL check_degeneracy
      CALL m_angle
      PRINT *,fi
      GO TO 1

40    CALL check_degeneracy
      CALL m_cos_angle
      PRINT *,cosfi
      GO TO 1

50    STOP
      END
      
      PROGRAM main
      COMMON /triangle/ p(3, 2),fi,cosfi,S,pi,a_l,b_l,c_l,a(2),b(2),c(2)
      PRINT *, 'Enter pi:'
      READ *, pi
      CALL menu
      END 