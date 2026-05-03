/// A simple wrapper to distinguish "No Value" from "Null Value"
class Value<T> {
  final T value;
  const Value(this.value);
}
