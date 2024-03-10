def sign(value):
  """
  This function checks the sign of a value and returns True for positive, False for negative.
  """
  return value >= 0

def eval_polynomial(coeff, x):
  """
  This function evaluates the polynomial at a given x value.

  Args:
      coeff: List containing the coefficients of the polynomial.
      x: Float representing the value to evaluate the polynomial at.

  Returns:
      Float representing the value of the polynomial at x.
  """
  result = 0
  i=0
  for i in range(len(coeff)):
    result += coeff[i] * x**i
  return result


def bisection(degree, coeff, tolerance=0.0001):
  """
  This function implements the bisection method to find a root of a polynomial.

  Args:
      degree: Integer representing the degree of the polynomial.
      coeff: List containing the coefficients of the polynomial (highest power to constant term).
      tolerance: Optional argument specifying the minimum acceptable interval size (default: 0.001).

  Returns:
      Float representing the approximated root of the polynomial.
  """
  print(coeff)
  x1, x2 = 0.0, 1.0  # Initial interval (can be adjusted based on the polynomial)
  func_x0 = 0.0  # Variable to store the function value at the midpoint

  # Find an initial interval where the function changes sign (indicating a root)
  prev_sign = sign(eval_polynomial(coeff, x1))
  for i in range(1, 100):  # Limit iterations to avoid infinite loops (adjust as needed)
    x = x1 + i * (x2 - x1) / (degree + 1)  # Check function value at evenly spaced points
    current_sign = sign(eval_polynomial(coeff, x))
    if prev_sign != current_sign:
      x1 = x - (x2 - x1) / 2
      x2 = x  # Update interval based on sign change
      break
    prev_sign = current_sign

  # Bisection loop until the interval is small enough
  while abs(x2 - x1) > tolerance:
    x0 = (x1 + x2) / 2.0
    func_x0 = eval_polynomial(coeff, x0)

    # Update the interval based on the sign of the function at the midpoint
    if sign(func_x0):
      x2 = x0
    else:
      x1 = x0

  return x0  # Return the final approximation of the root


poly_degree = int(input("Degree of the polynomial = "))
poly_coeff = []
for x in range(poly_degree+1):
    next_coeff = float(input(f"Coefficient {x} = "))
    poly_coeff.append(next_coeff)

poly_coeff.reverse()  # Reverse the coefficient list

print(f'Root of the polynomial: {bisection(poly_degree, poly_coeff)}')
