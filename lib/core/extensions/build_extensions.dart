import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  /// COLORS
  ColorScheme get colors => Theme.of(this).colorScheme;

  /// TEXT THEMES
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// SCREEN SIZE
  Size get _screenSize => MediaQuery.of(this).size;
  double get screenWidth => _screenSize.width;
  double get screenHeight => _screenSize.height;

  /// SCREEN PADDING
  EdgeInsets get padding => MediaQuery.paddingOf(this);
}
