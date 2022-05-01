import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import '../../framework.dart';

//final customLogger = (Type type) =>

class CustomLogger extends ICustomLogger {
  @override
  Logger getLogger(Type type) {
    return Logger(
      printer: CustomPrinter(type.toString()),
      level: LogConstant.logLevel,
    );
  }
}

class CustomPrinter extends LogPrinter {
  final String className;
  CustomPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    final color = PrettyPrinter.levelColors[event.level];
    final emoji = PrettyPrinter.levelEmojis[event.level];
    final message = event.message;
    final level = event.level
        .toString()
        .toUpperCase()
        .split(LogConstant.dot)
        .getRange(1, 2);
    final dateTime = DateFormat(LogConstant.date_format_dd_mmm_yyyy_hh_mm_ss)
        .format(DateTime.now());
    return [color!('[ $emoji] $level [$dateTime] [$className]: $message')];
  }
}
