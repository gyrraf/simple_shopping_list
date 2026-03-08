import 'package:flutter/material.dart';
import 'package:simple_shopping_list/features/home/data/item.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Row(children: [Text(item.name)]);
  }
}
