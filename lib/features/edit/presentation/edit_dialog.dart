import 'package:flutter/material.dart';
import 'package:simple_shopping_list/features/home/data/item.dart';

class EditDialog extends StatefulWidget {
  // TODO: maybe I should use a different type of variable for this?
  final Item? item;
  final VoidCallback onCancelClick;

  const EditDialog({super.key, this.item, required this.onCancelClick});

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  bool _isSaveEnabled = false;
  late TextEditingController _nameInputController;
  late TextEditingController _amountInputController;

  void _onNameChanged() {
    setState(() {
      _isSaveEnabled = _nameInputController.text.isNotEmpty;
    });
  }

  void _saveClicked() {}

  @override
  void initState() {
    super.initState();
    _isSaveEnabled = widget.item?.name.isNotEmpty ?? false;

    _nameInputController = TextEditingController(text: widget.item?.name);
    _nameInputController.addListener(_onNameChanged);

    _amountInputController = TextEditingController(
      text: widget.item?.amountString,
    );
  }

  @override
  void dispose() {
    _nameInputController.dispose();
    _amountInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      constraints: BoxConstraints(minWidth: 0.0, maxWidth: 600.0),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 32.0, horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 32.0,
          children: [
            Column(
              spacing: 8.0,
              children: [
                TextField(
                  controller: _nameInputController,
                  decoration: InputDecoration(
                    labelText: '‼️Name‼️', // TODO: translate text
                    enabled: true,
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
                  maxLines: 1,
                  enabled: true,
                ),
                TextField(
                  controller: _amountInputController,
                  decoration: InputDecoration(
                    labelText: '‼️Amount‼️', // TODO: translate text
                    enabled: true,
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  autocorrect: false,
                  maxLines: 1,
                  enabled: true,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 8.0,
              children: [
                TextButton(
                  onPressed: widget.onCancelClick,
                  child: Text('‼️Cancel‼️'), // TODO: translate text
                ),
                TextButton(
                  onPressed: _isSaveEnabled ? _saveClicked : null,
                  child: Text('‼️Save‼️'), // TODO: translate text
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
