import 'dart:math';

// Define a function to calculate the integral of a polynomial term
String integratePolynomialTerm(String term) {
  // Split the term into coefficient and exponent parts
  List<String> parts = term.split('x^');
  double coefficient = parts.isNotEmpty ? double.parse(parts[0]) : 1.0;
  int exponent = parts.length > 1 ? int.parse(parts[1]) + 1 : 1;

  // Calculate the new coefficient and exponent for the integral
  double newCoefficient = coefficient / exponent;
  int newExponent = exponent;

  // Return the integral as a string
  return '${newCoefficient}x^$newExponent';
}

// Function to calculate the integral of a polynomial function
String integratePolynomial(String function) {
  // Split the function into terms
  List<String> terms = function.split(' + ');

  // Integrate each term individually
  List<String> integralTerms = terms.map((term) {
    // Check if the term contains 'x^'
    if (term.contains('x^')) {
      return integratePolynomialTerm(term);
    } else {
      // If the term doesn't contain 'x^', it's a constant term
      double constant = double.parse(term);
      return '${constant}x';
    }
  }).toList();

  // Combine the integral terms with '+' and return the result
  return integralTerms.join(' + ');
}

void main() {
  // Example polynomial function
  String function = '3x^2 + 2x + 5';

  // Calculate the integral of the function
  String integral = integratePolynomial(function);

  // Output the result
  print('Integral of $function dx = $integral + C');
}