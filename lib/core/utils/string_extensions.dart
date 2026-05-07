extension StringTransform on String {
  /// Returns the result of [defaultValue] if the string is empty.
  String? maybeIfEmpty(String? Function() defaultValue) {
    return isEmpty ? defaultValue() : this;
  }

  /// Returns the result of [defaultValue] if the string is blank (whitespace).
  String? maybeIfBlank(String? Function() defaultValue) {
    return trim().isEmpty ? defaultValue() : this;
  }
}
