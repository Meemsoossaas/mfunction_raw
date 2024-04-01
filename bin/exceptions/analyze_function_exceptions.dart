part of 'exceptions.dart';

base class AnalyzeFunctionException extends MFunctionRawException {
  const AnalyzeFunctionException(
    super.code,
  );

  String get message => switch (code) {
        1 => "Function is not a function!",
        _ => "Generic 'analyzeFunction' exception",
      };

  @override
  StackTrace? get stackTrace => StackTrace.current;

  @override
  String toString() => 'AnalyzeFunctionException: {code: $code -> $message}';
}
