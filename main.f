      !Read points coords from std in
      SUBROUTINE input
      COMMON /triangle/ p(3, 2), a, b, c, fi, cosfi, S, pi
      DO i=1, 3
      READ *, p(i,1), p(i,2)
      END DO
      END

      !Calculate area of triangle
      SUBROUTINE area
      COMMON /triangle/ p(3, 2), a, b, c, fi, cosfi, S, pi
      c1 = (p(2,1) - p(1,1)) * (p(3,2) - p(1,2))
      c2 = (p(2,2) - p(1,2)) * (p(3,1) - p(1,1))
      S = abs(c1 - c2) / 2
      END

      !Calculate sides length of triangle
      SUBROUTINE sides
      COMMON /triangle/ p(3,2),a,b,c,fi,cosfi,S,pi
      a=sqrt((p(2,1)-p(1,1))**2+(p(2,2)-p(1,2))**2)
      b=sqrt((p(3,1)-p(2,1))**2+(p(3,2)-p(2,2))**2)
      c=sqrt((p(1,1)-p(3,1))**2+(p(1,2)-p(3,2))**2)
      IF (a.EQ.0.0 .OR. b.EQ.0.0 .OR. c.EQ.0.0) THEN
      PRINT *,'ERROR: ZERO SIDE LENGTH'
      STOP
      END IF
      END

      REAL FUNCTION cos_angle(a,b,c)
      REAL a,b,c
      cos_angle=(a**2+b**2-c**2)/(2*a*b)
      END

      !Calculate smallest angle of triangle
      SUBROUTINE m_angle
      COMMON /triangle/ p(3,2),a,b,c,fi,cosfi,S,pi
      CALL sides
      IF (a.LE.b.AND.a.LE.c) cosfi=cos_angle(b,c,a)
      IF (b.LE.a.AND.b.LE.c) cosfi=cos_angle(a,c,b)
      IF (c.LE.a.AND.c.LE.b) cosfi=cos_angle(a,b,c)
      fi=acos(cosfi)*180/pi
      END


      SUBROUTINE menu
      COMMON /triangle/ p(3,2),a,b,c,fi,cosfi,S,pi
    1 PRINT *,'1) Write coordinates'
      PRINT *,'2) Find area'
      PRINT *,'3) Find smallest angle'
      PRINT *,'4) Find cosine of a smallest angle'
      PRINT *,'5) Exit'

      READ *,n
      SELECT CASE (n)
      CASE (1)
        CALL input
      CASE (2)
        CALL area
        PRINT *,S
      CASE (3)
        CALL m_angle
        PRINT *,fi
      CASE (4)
        CALL m_angle
        PRINT *,cosfi
      CASE (5)
      STOP
      END SELECT
      GO TO 1
      END
      
      PROGRAM main
      COMMON /triangle/ p(3,2),a,b,c,fi,cosfi,S,pi
      READ *,pi
      CALL menu
      END 