import 'dart:developer';

mixin Logger {
  static void write(String text, {bool isError = false}) {
    Future.microtask(() => log('** $text. isError: [$isError]'));
  }
}
