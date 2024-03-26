part of 'regexps.dart';

RegExp fullFunctionRegex = RegExp(
    r'(\b[+-]?\d*\.?\d+\b)|' // Matches numbers (e.g., 3, -2.5)
    r'(\b[a-z]+\b)|' // Matches variables (e.g., x, y)
    r'(\b(sin|cos|tan|sqrt)\b\([^()]*\))|' // Matches trigonometric and sqrt functions with arguments (e.g., cos(π), sqrt(4)(x))
    r'(\b(log|lg|ln)\b\([^()]*\)\([^()]*\))|' // Matches logarithmic functions with syntaxes (e.g., log_(3)(9))
    r'(\b(log|lg|ln)\b\([^()]*\))|' // Matches logarithmic functions with syntaxes (e.g., lg(3))
    r'(\^)|' // Matches caret (^) as operator
    r'([+\-*/π])|' // Matches arithmetic operators (+, -, *, /) and π
    r'([()])' // Matches parentheses
    );

RegExp alphabetRegex = RegExp(r'[a-z]+');

RegExp integerRegex = RegExp(r'\d+');

RegExp decimalRegex = RegExp(r'^-?\d+(\.\d+)?$');

RegExp bracketRegex = RegExp(r'\([^()]*\)');

RegExp factorRegex = RegExp(r'([-+])?\(([^\/^]*)\)');

RegExp extractFactorRegex = RegExp(r'([0-9]|[a-z]|[π]+)');

RegExp fractionRegex = RegExp(r'([+-]?)(\(([a-z0-9]+)/([a-z0-9]+)\))');

RegExp logarithmicRegex = RegExp(
  r'([-+]?)(log|lg|ln)\((\d*)\)\(([a-z0-9]+)\)|lg\(([a-z0-9]+)\)|ln\(([a-z0-9]+)\)',
);

RegExp rootRegex = RegExp(
  r'([-+]?)sqrt\(([a-z0-9]+)\)|sqrt\((\d+)\)\(([a-z0-9]+)\)',
);

RegExp exponentialRegex = RegExp(r'([-+]?)\([^()]+?\^[^()]+?\)');

RegExp trigonometricRegex = RegExp(
  r'([-+]?)(sin|cos|tan)\((\d+)?\)\(([^()]+)?\)|((sin|cos|tan)\(([^()]+)?\))',
);
