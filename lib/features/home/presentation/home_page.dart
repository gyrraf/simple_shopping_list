import 'package:flutter/material.dart';
import 'package:simple_shopping_list/features/home/data/item.dart';
import 'package:simple_shopping_list/features/home/presentation/home_list.dart';

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
          amountString: null,
          purchaseNecessary: false,
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(child: HomeList(list: _items)),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        tooltip: 'Add', // TODO: translate text
        child: const Icon(Icons.add),
      ),
    );
  }
}
