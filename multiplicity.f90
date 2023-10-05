! A program that calculates the multiplicity of two Einstein Solids!
! Schroeders Thermal Physics HW 2.9 in FORTRAN

Program MultiplicityCalculator
  implicit none 
  integer :: n_A, n_B, q_A, q_B, q_Total, Omega_A, Omega_B, Multiplicity, TotalMultiplicity

  print *, "Enter an integer number for n_A:"
  read *, n_A
  print *, "Enter an integer number for n_B:"
  read *, n_B
  print *, "Enter an integer number for q_Total:"
  read *, q_Total
  
  q_A = 0
  q_B = q_Total
  TotalMultiplicity = 0
  
  do while (q_A /= q_Total + 1)
    Omega_A = comb(q_A + n_A - 1, q_A)
    Omega_B = comb(q_B + n_B - 1, q_B)
    Multiplicity = Omega_A * Omega_B
    print *, q_A, Omega_A, q_B, Omega_B, Multiplicity
    q_A = q_A + 1
    q_B = q_B - 1
    TotalMultiplicity = TotalMultiplicity + Multiplicity
  end do

  print *, "The total Multiplicity of n_A =", n_A, "& n_B =", n_B, "with q_Total of", q_Total, "is", TotalMultiplicity 
  
Contains
  
  ! Combination function
  INTEGER function comb(n, r)
    INTEGER::n, r, value
    value = fact(n) / (fact(r) * fact(n - r))
    comb = value
  end function comb

  ! Factorial function
  INTEGER function fact(n1)
    INTEGER::n1, i1, fact1
    if (n1 == 0) then
      fact = 1  ! Factorial of 0 is 1
    else
      fact1 = 1
      do i1 = 1, n1
        fact1 = fact1 * i1
      end do
      fact = fact1
    end if
  end function fact

End Program MultiplicityCalculator


--OUTPUT-- 

[?2004l
 Enter an integer number for n_A:
6
 Enter an integer number for n_B:
4
 Enter an integer number for q_Total:
6
           0           1           6          84          84
           1           6           5          56         336
           2          21           4          35         735
           3          56           3          20        1120
           4         126           2          10        1260
           5         252           1           4        1008
           6         462           0           1         462
 The total Multiplicity of n_A =           6 & n_B =           4 with q_Total of           6 is        5005
[?2004h