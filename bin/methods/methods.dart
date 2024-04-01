import 'dart:async';
import 'dart:ffi';
import 'package:math_expressions/math_expressions.dart'
    hide MathFunction
    show Expression, Parser;
import 'package:equations/equations.dart';
import 'package:test/test.dart';

import '../classes/classes.dart'
    show AnalysisContext, FunctionConvertService, MathAnalysisService, MathFunction, StringManipulationService;
import '../enumerations/enumerations.dart';
import '../exceptions/exceptions.dart';
import '../extensions/extensions.dart';
import '../typedefs/typedefs.dart';

part 'analyze_function.dart';
