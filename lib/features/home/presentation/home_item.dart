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
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          spacing: 8.0,
          children: [
            Checkbox(
              value: item.purchaseNecessary,
              onChanged: (newValue) {
                onCheckedChanged(newValue ?? false);
              },
            ),
            Expanded(
              child: Column(
                spacing: 2.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  if (amountString != null)
                    Text(
                      amountString,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
