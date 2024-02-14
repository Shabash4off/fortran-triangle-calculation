      SUBROUTINE input
      COMMON /triangle/ p(3, 2), fi, cosfi, S, pi
      DO i=1, 3
      READ *, p(i,1), p(i,2)
      END DO
      CALL area
      END

      SUBROUTINE area
      COMMON /triangle/ p(3, 2), fi, cosfi, S, pi
      c1 = (p(2,1) - p(1,1)) * (p(3,2) - p(1,2))
      c2 = (p(2,2) - p(1,2)) * (p(3,1) - p(1,1))
      S = abs(c1 - c2) / 2
      END

      SUBROUTINE m_angle
      COMMON /triangle/ p(3, 2), fi, cosfi, S, pi

      DIMENSION a(2), b(2), c(2)
            
      a(1) = p(2,1) - p(1,1)
      a(2) = p(2,2) - p(1,2)
      b(1) = p(3,1) - p(2,1)
      b(2) = p(3,2) - p(2,2)
      c(1) = p(1,1) - p(3,1)
      c(2) = p(1,2) - p(3,2)
      
      a_l=sqrt(a(1)**2+a(2)**2)
      b_l=sqrt(b(1)**2+b(2)**2)
      c_l=sqrt(c(1)**2+c(2)**2)

      IF (a_l .LE. b_l) THEN
      IF (a_l .LE. c_l) THEN
      fi = asin(2*S/(c_l*b_l))
      ELSE
      fi = asin(2*S/(a_l*b_l))
      END IF
      ELSE IF (b_l .LE. c_l) THEN
      fi = asin(2*S/(a_l*c_l))
      ELSE
      fi = asin(2*S/(a_l*b_l))
      END IF

      fi = fi*180/pi
      END

      SUBROUTINE m_cos_angle
      COMMON /triangle/ p(3, 2), fi, cosfi, S, pi

      DIMENSION a(2), b(2), c(2)

      a(1) = p(2,1) - p(1,1)
      a(2) = p(2,2) - p(1,2)
      b(1) = p(3,1) - p(2,1)
      b(2) = p(3,2) - p(2,2)
      c(1) = p(1,1) - p(3,1)
      c(2) = p(1,2) - p(3,2)
      
      a_l=sqrt(a(1)**2+a(2)**2)
      b_l=sqrt(b(1)**2+b(2)**2)
      c_l=sqrt(c(1)**2+c(2)**2)

      IF (a_l .LE. b_l) THEN
      IF (a_l .LE. c_l) THEN
      cosfi = (c(1)*(-b(1)) + c(2)*(-b(2))) / (c_l * b_l)
      ELSE
      cosfi = (b(1)*(-a(1)) + b(2)*(-a(2))) / (b_l * a_l)
      END IF
      ELSE IF (b_l .LE. c_l) THEN
      cosfi = (a(1)*(-c(1)) + a(2)*(-c(2))) / (a_l * c_l)
      ELSE
      cosfi = (b(1)*(-a(1)) + b(2)*(-a(2))) / (b_l * a_l)
      END IF
      END


      SUBROUTINE menu
      COMMON /triangle/ p(3, 2), fi, cosfi, S, pi
1     PRINT *,'1) Write coordinates'
      PRINT *,'2) Find area'
      PRINT *,'3) Find smallest angle'
      PRINT *,'4) Find cosine of a smallest angle'
      PRINT *,'5) Exit'
      READ *,n
      GO TO (10,20,30,40, 50), n
10    CALL input
      GO TO 1

20    IF (S.EQ.0.0) THEN
      PRINT *,'ERROR: TRIANGLE IS DEGENERATE OR DOES NOT EXIST'
      GO TO 1
      END IF
      PRINT *,S
      GO TO 1

30    IF (S.EQ.0.0) THEN
      PRINT *,'ERROR: TRIANGLE IS DEGENERATE OR DOES NOT EXIST'
      GO TO 1
      END IF
      CALL m_angle
      PRINT *,fi
      GO TO 1

40    IF (S.EQ.0.0) THEN
      PRINT *,'ERROR: TRIANGLE IS DEGENERATE OR DOES NOT EXIST'
      GO TO 1
      END IF
      CALL m_cos_angle
      PRINT *,cosfi
      GO TO 1

50    STOP
      END
      
      PROGRAM main
      COMMON /triangle/ p(3, 2), fi, cosfi, S, pi
      PRINT *, 'Enter pi:'
      READ *, pi
      CALL menu
      END 