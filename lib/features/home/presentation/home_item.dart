import 'package:flutter/material.dart';
import 'package:simple_shopping_list/features/home/data/item.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({
    super.key,
    required this.item,
    required this.onClick,
    required this.onCheckedChanged,
  });

  final Item item;
  final VoidCallback onClick;
  final ValueChanged<bool> onCheckedChanged;

  @override
  Widget build(BuildContext context) {
    final amountString = item.amountString;
    return GestureDetector(
      onTap: onClick,
      child: Row(
        children: [
          Checkbox(
            value: item.purchaseNecessary,
            onChanged: (newValue) {
              onCheckedChanged(newValue ?? false);
            },
          ),
          Column(
            children: [
              Text(item.name),
              if (amountString != null) Text(amountString),
            ],
          ),
        ],
      ),
    );
  }
}
