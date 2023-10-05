# Motivation
To explore the syntax of FORTRAN and learn a legacy language.

# Original Problem
In Schroeder's Thermal Physics Problem 2.9, we were tasked by the author to recreate the same Figure 2.4 and then determine the most and least probable macrostate, along with their respective probabilities.
<div align="center">
  <img src="https://github.com/asherchok/fortran-multiplicity-calculator/raw/main/figures/problem2-9.JPG" alt="Problem 2.9" style="width:75%;">
  <p><em>Problem 2.9</em></p>
</div>

<div align="center">
  <img src="https://github.com/asherchok/fortran-multiplicity-calculator/raw/main/figures/figure2-4.JPG" alt="Figure 2.4" style="width:75%;">
  <p><em>Figure 2.4</em></p>
</div>

For our FORTRAN exercise, we aim to become familiar with FORTRAN syntax by solving the  `Total Multiplicity` for six harmonic oscillators and four harmonic oscillators in each Einstein Solid, with a total of six energy units.

# Original Solution
The original approach to solving this problem (back in October 2021) involved using Excel to generate the figures and address the remaining challenges.

<div align="center">
  <img src="https://github.com/asherchok/fortran-multiplicity-calculator/raw/main/figures/original-soln.png" alt="Original Solution" style="width:50%;">
  <p><em>Original Solution done in Excel</em></p>
</div>

It was relatively simple to set up and generate figures without the need for `pip install pandas` or other Python packages. To tackle this problem using a more challenging approach, we considered doing it the **FORTRAN way**.

# FORTRAN Solution
The FORTRAN approach (Checkout the .f90 file [here](https://github.com/asherchok/fortran-multiplicity-calculator/blob/main/multiplicity.f90)!) successfully achieved the same `Total Multiplicity` as the original way (a total multiplicity of 5005) with the same input. Below is a pseudocode representation of the actual FORTRAN code.
<pre>
    <code>
Program MultiplicityCalculator
  Initialize n_A, n_B, q_A, q_B, q_Total, Omega_A, Omega_B, Multiplicity, TotalMultiplicity
  
  Input n_A, n_B, q_Total
  
  q_A = 0
  q_B = q_Total
  TotalMultiplicity = 0
  
  while q_A is not equal to q_Total + 1
    Calculate Omega_A using comb(q_A + n_A - 1, q_A)
    Calculate Omega_B using comb(q_B + n_B - 1, q_B)
    Calculate Multiplicity as Omega_A * Omega_B
    
    Print q_A, Omega_A, q_B, Omega_B, Multiplicity
    
    Increment q_A by 1
    Decrement q_B by 1
    Add Multiplicity to TotalMultiplicity
    
  Print the total Multiplicity
  
Contains
  
  Define comb(n, r) function
    // Combination function implementation
    
  Define fact(n1) function
    // Factorial function implementation

End Program MultiplicityCalculator

    </code>
</pre>
<div align="center">
  <img src="https://github.com/asherchok/fortran-multiplicity-calculator/raw/main/figures/2-9-output.png" alt="Figure 2.4" style="width:75%;">
  <p><em>FORTRAN solution output for Problem 2.9</em></p>
</div>

This concludes the FORTRAN exercise.

# Problems with the FORTRAN Code
Similar code structure was implemented in Python and was able to yield the same `Total Multiplicity` for Problem 2.9, validating its functionality. The Python code successfully ran for both Problem 2.9 and Problem 2.10. However, the FORTRAN code failed to achieve the same `Total Multiplicity` for Problem 2.10, particularly when handling larger integer numbers.

<div align="center">
  <img src="https://github.com/asherchok/fortran-multiplicity-calculator/raw/main/figures/problem2-10.JPG" alt="Problem 2.10" style="width:75%;">
  <p><em>Problem 2.10</em></p>
</div>

<div align="center">
  <img src="https://github.com/asherchok/fortran-multiplicity-calculator/raw/main/figures/2-10-output.png" alt="Error Msg" style="width:75%;">
  <p><em>FORTRAN compiler error message for Problem 2.10</em></p>
</div>

The error is likely due to the fact that `50!` is a very large factorial number, and it exceeds the capacity of the integer variable, resulting in a floating-point error message.

# Fixes?
If anyone can find a solution to this problem, please feel free to submit a pull request.
