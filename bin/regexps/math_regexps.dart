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

RegExp alphabetRegex = RegExp(
  r'[a-z]+',
);

RegExp integerRegex = RegExp(
  r'\d+',
);

RegExp decimalRegex = RegExp(
  r'^-?\d+(\.\d+)?$',
);

RegExp bracketRegex = RegExp(
  r'\([^()]*\)',
);

RegExp singleRegex = RegExp(
  r'([-+])?\s*\b(?:\d+|[a-zπi])',
);

RegExp factorRegex = RegExp(
  r'([-+]?(\d+|[a-z]|[(][^()]*[)]))?\(([^()]*)\)(?![^()]*\))',
);

RegExp extractFactorRegex = RegExp(
  r'([0-9]|[a-z]|[π]+)',
);

RegExp fractionRegex = RegExp(
  r'([+-]?)(\(([a-z0-9+\-*/^π]+)/([a-z0-9+\-*/^π]+)\))',
);

RegExp logarithmicRegex = RegExp(
  r'([+-]?)(log)\(([0-9]+)\)\(([a-z0-9+\-*/^π]+)\)|([+-]?)(ln)\(([a-z0-9+\-*/^π]+)\)|([+-]?)(lg)\(([a-z0-9+\-*/^π]+)\)',
);

RegExp rootRegex = RegExp(
  r'([+-]?)sqrt\((.*?)\)(?:\((.*?)\))?',
);

RegExp exponentialRegex = RegExp(
  r'([-+]?)\([^()]+?\^[^()]+?\)',
);

RegExp trigonometricRegex = RegExp(
    r'([+-]?)(sin|cos|tan)\(([^()]*(\([^()]*\)[^()]*)*)(\(([^()]*(\([^()]*\)[^()]*)*)\))??'
);

RegExp trigonometricRegex2 = RegExp(
  r'([-+])?\b(sin|cos|tan)\((\d+)?\)\(([^()]+)?\)|((sin|cos|tan)\(([^()]*)?\))',
);
