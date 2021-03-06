import 'package:logger/logger.dart';

class ApplicationLogger {
  static final logger = Logger(
    printer: PrettyPrinter(
      colors: true,
      errorMethodCount: 1,
      printEmojis: true,
      printTime: true,
      lineLength: 80,
      methodCount: 0,
    ),
  );
}
