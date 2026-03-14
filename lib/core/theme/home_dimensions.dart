import 'dart:ui';
import 'package:flutter/material.dart';

/// The dimension values for the Home screen.
class HomeDimensions extends ThemeExtension<HomeDimensions> {
  /// The vertical padding of a single list item.
  final double itemPaddingVertical;

  /// The horizontal padding of a single list item.
  final double itemPaddingHorizontal;

  /// The horizontal spacing for the elements inside a single list item.
  final double itemInnerSpacingHorizontal;

  /// The vertical spacing for the text elements inside a single list item.
  final double itemInnerSpacingTextVertical;

  // Private constructor
  const HomeDimensions._({
    required this.itemPaddingVertical,
    required this.itemPaddingHorizontal,
    required this.itemInnerSpacingHorizontal,
    required this.itemInnerSpacingTextVertical,
  });

  // Factory with default values
  factory HomeDimensions() => const HomeDimensions._(
    itemPaddingVertical: 8.0,
    itemPaddingHorizontal: 16.0,
    itemInnerSpacingHorizontal: 8.0,
    itemInnerSpacingTextVertical: 2.0,
  );

  @override
  ThemeExtension<HomeDimensions> copyWith({
    double? itemPaddingVertical,
    double? itemPaddingHorizontal,
    double? itemInnerSpacingHorizontal,
    double? itemInnerSpacingTextVertical,
  }) {
    return HomeDimensions._(
      itemPaddingVertical: itemPaddingVertical ?? this.itemPaddingVertical,
      itemPaddingHorizontal:
          itemPaddingHorizontal ?? this.itemPaddingHorizontal,
      itemInnerSpacingHorizontal:
          itemInnerSpacingHorizontal ?? this.itemInnerSpacingHorizontal,
      itemInnerSpacingTextVertical:
          itemInnerSpacingTextVertical ?? this.itemInnerSpacingTextVertical,
    );
  }

  @override
  ThemeExtension<HomeDimensions> lerp(
    ThemeExtension<HomeDimensions>? other,
    double t,
  ) {
    if (other is! HomeDimensions) return this;
    return HomeDimensions._(
      itemPaddingVertical: lerpDouble(
        itemPaddingVertical,
        other.itemPaddingVertical,
        t,
      )!,
      itemPaddingHorizontal: lerpDouble(
        itemPaddingHorizontal,
        other.itemPaddingHorizontal,
        t,
      )!,
      itemInnerSpacingHorizontal: lerpDouble(
        itemInnerSpacingHorizontal,
        other.itemInnerSpacingHorizontal,
        t,
      )!,
      itemInnerSpacingTextVertical: lerpDouble(
        itemInnerSpacingTextVertical,
        other.itemInnerSpacingTextVertical,
        t,
      )!,
    );
  }
}

extension HomeDimensionsGetter on BuildContext {
  HomeDimensions get homeDimensions =>
      Theme.of(this).extension<HomeDimensions>()!;
}
