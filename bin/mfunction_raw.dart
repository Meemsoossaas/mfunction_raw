import 'dart:io' show exitCode;
import 'package:args/args.dart' show ArgParser;
import 'methods/methods.dart' show analyzeFunction;
import 'typedefs/typedefs.dart' show StringList;

void main(StringList arguments) async {
  final parser = ArgParser()
    ..addFlag(
      'analyze',
      negatable: false,
      abbr: 'a',
    );

  final argResults = parser.parse(arguments);
  final paths = argResults.rest;

  await analyzeFunction(paths[0]);
  exitCode = 0;
}
