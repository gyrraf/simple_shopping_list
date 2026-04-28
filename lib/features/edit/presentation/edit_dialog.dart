import 'package:flutter/material.dart';
import 'package:simple_shopping_list/core/theme/edit_dimensions.dart';
import 'package:simple_shopping_list/core/utils/string_extensions.dart';
import 'package:simple_shopping_list/features/home/data/item.dart';

typedef SaveCallback = void Function(Item newItem);

class EditDialog extends StatefulWidget {
  // TODO: maybe I should use a different type of variable for this?
  final Item? item;
  final int itemId;
  final VoidCallback? onRemoveClick;
  final VoidCallback onCancelClick;
  final SaveCallback onSaveClick;

  const EditDialog({
    super.key,
    this.item,
    this.onRemoveClick,
    required this.itemId,
    required this.onCancelClick,
    required this.onSaveClick,
  });

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

  void _saveClicked() {
    final newItem = (
      id: widget.itemId,
      name: _nameInputController.text,
      purchaseNecessary: widget.item?.purchaseNecessary ?? false,
      amountString: _amountInputController.text.maybeIfEmpty(() => null),
    );
    widget.onSaveClick(newItem);
  }

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
    final dimensions = context.editDimensions;

    return Dialog(
      constraints: BoxConstraints(maxWidth: dimensions.dialogMaxWidth),
      child: Padding(
        padding: EdgeInsetsGeometry.all(dimensions.dialogPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: dimensions.verticalLayoutSpacing,
          children: [
            Column(
              spacing: dimensions.verticalSpacingInputs,
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
              spacing: dimensions.horizontalSpacingButtons,
              children: [
                if (widget.onRemoveClick != null)
                  TextButton(
                    onPressed: widget.onRemoveClick,
                    child: Text('‼️Remove‼️'), // TODO: translate text
                  ),
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
