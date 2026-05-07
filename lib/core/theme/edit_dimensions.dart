import 'dart:ui';
import 'package:flutter/material.dart';

/// The dimension values for the Edit screen.
class EditDimensions extends ThemeExtension<EditDimensions> {
  /// The maximum width of the dialog.
  final double dialogMaxWidth;

  /// The padding inside the dialog.
  final double dialogPadding;

  /// The vertical spacing from the content to the buttons.
  final double verticalLayoutSpacing;

  /// The vertical spacing between input fields.
  final double verticalSpacingInputs;

  /// The horizontal spacing between the buttons.
  final double horizontalSpacingButtons;

  // Private constructor
  const EditDimensions._({
    required this.dialogMaxWidth,
    required this.dialogPadding,
    required this.verticalLayoutSpacing,
    required this.verticalSpacingInputs,
    required this.horizontalSpacingButtons,
  });

  // Factory with default values
  factory EditDimensions() => const EditDimensions._(
    dialogMaxWidth: 600.0,
    dialogPadding: 32.0,
    verticalLayoutSpacing: 32.0,
    verticalSpacingInputs: 8.0,
    horizontalSpacingButtons: 8.0,
  );

  @override
  ThemeExtension<EditDimensions> copyWith({
    double? dialogMaxWidth,
    double? dialogPadding,
    double? verticalLayoutSpacing,
    double? verticalSpacingInputs,
    double? horizontalSpacingButtons,
  }) {
    return EditDimensions._(
      dialogMaxWidth: dialogMaxWidth ?? this.dialogMaxWidth,
      dialogPadding: dialogPadding ?? this.dialogPadding,
      verticalLayoutSpacing:
          verticalLayoutSpacing ?? this.verticalLayoutSpacing,
      verticalSpacingInputs:
          verticalSpacingInputs ?? this.verticalSpacingInputs,
      horizontalSpacingButtons:
          horizontalSpacingButtons ?? this.horizontalSpacingButtons,
    );
  }

  @override
  ThemeExtension<EditDimensions> lerp(
    ThemeExtension<EditDimensions>? other,
    double t,
  ) {
    if (other is! EditDimensions) return this;
    return EditDimensions._(
      dialogMaxWidth: lerpDouble(dialogMaxWidth, other.dialogMaxWidth, t)!,
      dialogPadding: lerpDouble(dialogPadding, other.dialogPadding, t)!,
      verticalLayoutSpacing: lerpDouble(
        verticalLayoutSpacing,
        other.verticalLayoutSpacing,
        t,
      )!,
      verticalSpacingInputs: lerpDouble(
        verticalSpacingInputs,
        other.verticalSpacingInputs,
        t,
      )!,
      horizontalSpacingButtons: lerpDouble(
        horizontalSpacingButtons,
        other.horizontalSpacingButtons,
        t,
      )!,
    );
  }
}

extension EditDimensionsGetter on BuildContext {
  EditDimensions get editDimensions =>
      Theme.of(this).extension<EditDimensions>()!;
}
