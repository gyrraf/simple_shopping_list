import 'package:flutter/material.dart';
import 'package:simple_shopping_list/core/theme/home_dimensions.dart';
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
    final dimensions = context.homeDimensions;

    final amountString = item.amountString;

    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: dimensions.itemPaddingVertical,
          horizontal: dimensions.itemPaddingHorizontal,
        ),
        child: Row(
          spacing: dimensions.itemInnerSpacingHorizontal,
          children: [
            Checkbox(
              value: !item.purchaseNecessary,
              onChanged: (newValue) {
                onCheckedChanged(newValue ?? false);
              },
            ),
            Expanded(
              child: Column(
                spacing: dimensions.itemInnerSpacingTextVertical,
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
