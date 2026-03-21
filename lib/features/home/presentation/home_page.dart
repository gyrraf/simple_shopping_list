import 'package:flutter/material.dart';
import 'package:simple_shopping_list/features/edit/presentation/edit_dialog.dart';
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
    final newId = _items.length + 1;
    setState(() {
      _items = [
        ..._items,
        (
          id: newId,
          name: "Item $newId",
          amountString: "$newId pcs",
          purchaseNecessary: true,
        ),
      ];
    });
  }

  void _onItemCheckedChanged(bool value, int index, Item item) {
    setState(() {
      _items[index] = (
        id: item.id,
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
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: tabValues.map((tab) => Tab(text: tab.label)).toList(),
          ),
        ),
        body: TabBarView(
          children: tabValues
              .map(
                (tab) => _HomePageContent(
                  key: Key("HomePageContent: ${tab.index}"),
                  allItems: _items,
                  selectedTab: tab,
                  onItemClick: (int index, Item item) => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return EditDialog(
                        item: item,
                        onCancelClick: () {
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  ),
                  onItemCheckedChanged: _onItemCheckedChanged,
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

class _HomePageContent extends StatelessWidget {
  const _HomePageContent({
    super.key,
    required this.allItems,
    required this.selectedTab,
    required this.onItemClick,
    required this.onItemCheckedChanged,
  });

  final List<Item> allItems;
  final _Tab selectedTab;
  final ItemClick onItemClick;
  final ItemCheckedChanged onItemCheckedChanged;

  // TODO: is there a way to avoid this?
  int _getFullListIndex(Item item) =>
      allItems.indexWhere((otherItem) => item.id == otherItem.id);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: HomeList(
        list: allItems.where(selectedTab.isItemIncluded).toList(),
        onItemClick: (_, item) => onItemClick(_getFullListIndex(item), item),
        onItemCheckedChanged: (value, _, item) =>
            onItemCheckedChanged(value, _getFullListIndex(item), item),
      ),
    );
  }
}
