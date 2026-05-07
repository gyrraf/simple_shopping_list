import 'package:simple_shopping_list/core/utils/value.dart';

class Item {
  final int id; // TODO: maybe this should be a UUID instead.
  final String name;
  final String? amountString;
  final bool purchaseNecessary;

  Item({
    required this.id,
    required this.name,
    required this.amountString,
    required this.purchaseNecessary,
  });

  bool isSameItem(Item other) {
    return id == other.id;
  }

  Item copyWith({
    int? id,
    String? name,
    Value<String?>? amountString,
    bool? purchaseNecessary,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      amountString: amountString == null
          ? this.amountString
          : amountString.value,
      purchaseNecessary: purchaseNecessary ?? this.purchaseNecessary,
    );
  }
}
