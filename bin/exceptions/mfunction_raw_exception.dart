part of 'exceptions.dart';

abstract base class MFunctionRawException extends Equatable
    implements Exception, Error {
  final int code;

  const MFunctionRawException(
    this.code,
  );

  String get message;

  @override
  StackTrace? get stackTrace;

  @override
  List<Object?> get props => [code];
}
