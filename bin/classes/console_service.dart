part of 'classes.dart';

mixin class ConsoleService {
  static const int progressBarWidth = 80;

  static final ConsoleService instance = ConsoleService._internal();

  factory ConsoleService() => instance;

  ConsoleService._internal();

  Future<Timer> createProgressBar(
    int tasks,
  ) async {
    int completedTasks = 0;
    var timer = Timer.periodic(
      Duration(
        milliseconds: 100,
      ),
      (timer) {
        completedTasks++;
        _updateProgressBar(completedTasks);
        if (completedTasks >= 100) {
          timer.cancel();
          print('\nAll tasks completed!');
        }
      },
    );
    return timer;
  }

  void _updateProgressBar(int progress) {
    final fillLength = (progress * progressBarWidth).round();
    final progressBar =
        '[${'=' * fillLength}${' ' * (progressBarWidth - fillLength)}]';
    stdout.write(
        '\rProgress: $progressBar ${(progress * 100).toStringAsFixed(1)}%');
  }
}
