import 'package:flutter/material.dart';
import 'package:simple_shopping_list/features/home/data/item.dart';
import 'package:simple_shopping_list/features/home/presentation/home_item.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key, required this.list});

  final List<Item> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return HomeItem(item: list[index]);
      },
    );
  }
}
