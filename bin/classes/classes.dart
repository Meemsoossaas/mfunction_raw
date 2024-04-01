import 'dart:async';
import 'dart:io' show stdout;
import 'dart:math' as math;

import 'package:equatable/equatable.dart' show Equatable;
import 'package:equations/equations.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:test/test.dart';
import '../constants/constants.dart' as constants;
import '../enumerations/enumerations.dart'
    show
        ComponentType,
        DefinitionSetValidationScenario,
        FunctionModificationType,
        IncrementDirection,
        MathAnalysisOperations,
        NumberTypes,
        VariableLimits;
import '../extensions/extensions.dart';
import '../regexps/regexps.dart' as regexps;
import '../typedefs/typedefs.dart';

// Analysis

part 'analysis_context.dart';

part 'analysis_limits.dart';

part 'definition_set.dart';

part 'math_analysis_service.dart';

part 'math_integral_service.dart';

part 'vector.dart';

// Console

part 'console_service.dart';

// LaTex

part 'latex_code.dart';

part 'latex_handler.dart';

// String Manipulation

part 'math_function.dart';

part 'string_manipulation_service.dart';

part 'function_manipulation_options.dart';

part 'function_convert_service.dart';
