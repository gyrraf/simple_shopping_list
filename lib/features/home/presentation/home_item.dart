import 'package:flutter/material.dart';
import 'package:simple_shopping_list/features/home/data/item.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({super.key, required this.item, required this.onChanged});

  final Item item;
  final ValueChanged<bool> onChanged;

  void _onClick() {
    onChanged(!item.purchaseNecessary);
  }

  @override
  Widget build(BuildContext context) {
    final amountString = item.amountString;
    return GestureDetector(
      onTap: _onClick,
      child: Row(
        children: [
          IgnorePointer(
            child: Checkbox(
              value: item.purchaseNecessary,
              onChanged: (newValue) {},
            ),
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
