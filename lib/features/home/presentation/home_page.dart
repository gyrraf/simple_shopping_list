import 'package:flutter/material.dart';
import 'package:simple_shopping_list/features/home/data/item.dart';
import 'package:simple_shopping_list/features/home/presentation/home_list.dart';

enum _Tab {
  todo(label: "Einkaufen"),
  all(label: "Alle");

  const _Tab({required this.label});

  final String label; // TODO: this label should be language dependent.

  bool isItemIncluded(Item item) {
    switch (this) {
      case todo:
        return item.purchaseNecessary;
      case all:
        return true;
    }
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> _items = [];

  void _addItem() {
    // TODO: implement properly
    setState(() {
      _items = [
        ..._items,
        (
          name: "Item ${_items.length + 1}",
          amountString: "${_items.length + 1} pcs",
          purchaseNecessary: false,
        ),
      ];
    });
  }

  void _onItemClick(int index, Item item) {
    // TODO: implement
  }

  void _onItemCheckedChanged(bool value, int index, Item item) {
    setState(() {
      _items[index] = (
        name: item.name,
        amountString: item.amountString,
        purchaseNecessary: value,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabValues = _Tab.values;

    return DefaultTabController(
      length: tabValues.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          bottom: TabBar(
            tabs: tabValues.map((tab) => Tab(text: tab.label)).toList(),
          ),
        ),
        body: TabBarView(
          children: tabValues
              .map(
                (tab) => Center(
                  child: HomeList(
                    list: _items.where(tab.isItemIncluded).toList(),
                    onItemClick: _onItemClick,
                    onItemCheckedChanged: _onItemCheckedChanged,
                  ),
                ),
              )
              .toList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addItem,
          tooltip: 'Add', // TODO: translate text
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
