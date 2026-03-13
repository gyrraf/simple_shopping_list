import 'package:flutter/material.dart';

/// A thin horizontal line, with padding on either side.
///
/// In the Material Design language, this represents a divider. Dividers can be
/// used in lists, [Drawer]s, and elsewhere to separate content.
///
/// To create a divider between [ListTile] items, consider using
/// [ListTile.divideTiles], which is optimized for this case.
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=_liUC641Nmk}
///
/// See also:
///
///  * [PopupMenuDivider], which is the equivalent but for popup menus.
///  * [ListTile.divideTiles], another approach to dividing widgets in a list.
///  * [VerticalDivider], which is the vertical analog of this widget.
///  * <https://material.io/design/components/dividers.html>
class GaplessDivider extends StatelessWidget {
  /// Creates a Material Design divider without additional height.
  ///
  /// The [thickness], [indent], and [endIndent] must be null or
  /// non-negative.
  const GaplessDivider({
    super.key,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
    this.radius,
  });

  /// The thickness of the line drawn within the divider.
  ///
  /// {@template flutter.material.Divider.thickness}
  /// A divider with a [thickness] of 0.0 is always drawn as a line with a
  /// height of exactly one device pixel.
  ///
  /// If this is null, then the [DividerThemeData.thickness] is used. If
  /// that is also null, then this defaults to 0.0.
  /// {@endtemplate}
  final double? thickness;

  /// The amount of empty space to the leading edge of the divider.
  ///
  /// {@template flutter.material.Divider.indent}
  /// If this is null, then the [DividerThemeData.indent] is used. If that is
  /// also null, then this defaults to 0.0.
  /// {@endtemplate}
  final double? indent;

  /// The amount of empty space to the trailing edge of the divider.
  ///
  /// {@template flutter.material.Divider.endIndent}
  /// If this is null, then the [DividerThemeData.endIndent] is used. If that is
  /// also null, then this defaults to 0.0.
  /// {@endtemplate}
  final double? endIndent;

  /// {@template flutter.material.Divider.color}
  /// The color to use when painting the line.
  ///
  /// If this is null, then the [DividerThemeData.color] is used. If that is
  /// also null, then [ThemeData.dividerColor] is used.
  /// {@endtemplate}
  ///
  /// {@tool snippet}
  ///
  /// ```dart
  /// const Divider(
  ///   color: Colors.deepOrange,
  /// )
  /// ```
  /// {@end-tool}
  final Color? color;

  /// {@template flutter.material.Divider.radius}
  /// The amount of radius for the border of the divider.
  ///
  /// If this is null, then [DividerThemeData.radius] is used. If that is
  /// also null, then the default radius of [BoxDecoration] is used.
  /// {@endtemplate}
  final BorderRadiusGeometry? radius;

  @override
  Widget build(BuildContext context) {
    var height = thickness ?? Theme.of(context).dividerTheme.thickness ?? 1.0;
    if (height == 0.0) {
      height = 1.0;
    }
    return Divider(
      key: key,
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: color,
      radius: radius,
    );
  }
}
