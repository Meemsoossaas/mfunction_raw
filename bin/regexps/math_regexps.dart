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

RegExp numberRegex = RegExp(r'\d+');

RegExp bracketRegex = RegExp(r'\([^()]*\)');

RegExp fractionRegex = RegExp(r'\((.*?)\/(.*?)\)');

RegExp logarithmicRegex =
    RegExp(r'(log|lg|ln)\(\d*\)\(\d*\)|lg\(\d*\)|ln\(\d*\)');

RegExp rootRegex = RegExp(r'sqrt\((\d+)\)|sqrt\((\d+)\)\((\d+)\)');
