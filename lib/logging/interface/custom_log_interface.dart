import 'package:logger/logger.dart';

abstract class ICustomLogger {
  Logger getLogger(Type type);
}
