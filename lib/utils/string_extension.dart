extension StringExtension on String {
  static final exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  String toPlainText() {
    return this.replaceAll(exp, '');
  }
}
