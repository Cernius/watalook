import 'package:logger/logger.dart' as LoggerLib;
import 'package:watalook/domain/providers/logger.dart';

class LoggerImpl extends Logger {
  final LoggerLib.Logger logger = LoggerLib.Logger(
      printer: LoggerLib.PrettyPrinter(
          methodCount: 0, colors: true, printEmojis: true, printTime: true));
  final LoggerLib.Logger loggerWithST = LoggerLib.Logger(
      printer: LoggerLib.PrettyPrinter(
          colors: true,
          printEmojis: true,
          printTime: true,
          errorMethodCount: 8));

  @override
  void d(message) {
    logger.d(message);
  }

  @override
  void i(message) {
    logger.i(message);
  }

  @override
  void v(message) {
    logger.v(message);
  }

  @override
  void w(message) {
    loggerWithST.w(message);
  }

  @override
  void e(message) {
    loggerWithST.e(message);
  }

  @override
  void exception(Exception e) {
    loggerWithST.e(e);
  }
}
