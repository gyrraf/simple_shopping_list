import 'package:flutter/material.dart';
import 'package:simple_shopping_list/features/home/data/item.dart';
import 'package:simple_shopping_list/features/home/presentation/home_item.dart';

typedef ItemChanged = void Function(bool value, int index, Item item);

class HomeList extends StatelessWidget {
  const HomeList({super.key, required this.list, required this.onItemChanged});

  final List<Item> list;
  final ItemChanged onItemChanged;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        final item = list[index];
        return HomeItem(
          item: item,
          onChanged: (value) {
            onItemChanged(value, index, item);
          },
        );
      },
    );
  }
}
