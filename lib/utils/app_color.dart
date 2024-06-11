import 'package:flutter/material.dart';

class AppColor {
  static late ColorScheme _colorScheme;

  static Color get primary => _colorScheme.primary;
  static Color get onPrimary => _colorScheme.onPrimary;
  static Color get primaryContainer => _colorScheme.primaryContainer;
  static Color get onPrimaryContainer => _colorScheme.onPrimaryContainer;
  static Color get secondary => _colorScheme.secondary;
  static Color get onSecondary => _colorScheme.onSecondary;
  static Color get secondaryContainer => _colorScheme.secondaryContainer;
  static Color get onSecondaryContainer => _colorScheme.onSecondaryContainer;
  static Color get surface => _colorScheme.surface;
  static Color get onSurface => _colorScheme.onSurface;
  static Color get error => _colorScheme.error;
  static Color get onError => _colorScheme.onError;
  static Color get errorContainer => _colorScheme.errorContainer;
  static Color get onErrorContainer => _colorScheme.onErrorContainer;
  static Color get tertiary => _colorScheme.tertiary;
  static Color get onTertiary => _colorScheme.onTertiary;
  static Color get tertiaryContainer => _colorScheme.tertiaryContainer;
  static Color get onTertiaryContainer => _colorScheme.onTertiaryContainer;
  static Color get surfaceContainerHighest =>
      _colorScheme.surfaceContainerHighest;
  static Color get onSurfaceVariant => _colorScheme.onSurfaceVariant;
  static Color get outline => _colorScheme.outline;
  static Color get shadow => _colorScheme.shadow;
  static Color get inverseSurface => _colorScheme.inverseSurface;
  static Color get onInverseSurface => _colorScheme.onInverseSurface;
  static Color get inversePrimary => _colorScheme.inversePrimary;

  static void initialize(BuildContext context) {
    _colorScheme = Theme.of(context).colorScheme;
  }
}
