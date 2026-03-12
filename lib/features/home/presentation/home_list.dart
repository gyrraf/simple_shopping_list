import 'package:flutter/material.dart';
import 'package:simple_shopping_list/features/home/data/item.dart';
import 'package:simple_shopping_list/features/home/presentation/home_item.dart';

typedef ItemClick = void Function(int index, Item item);
typedef ItemCheckedChanged = void Function(bool newValue, int index, Item item);

class HomeList extends StatelessWidget {
  const HomeList({
    super.key,
    required this.list,
    required this.onItemClick,
    required this.onItemCheckedChanged,
  });

  final List<Item> list;
  final ItemClick onItemClick;
  final ItemCheckedChanged onItemCheckedChanged;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: list.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        final item = list[index];
        return HomeItem(
          item: item,
          onClick: () {
            onItemClick(index, item);
          },
          onCheckedChanged: (newValue) {
            onItemCheckedChanged(newValue, index, item);
          },
        );
      },
    );
  }
}
