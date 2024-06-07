import 'package:flutter/material.dart';
import 'package:grocerystacked/services/theme_model.dart';
import 'package:stacked/stacked.dart';
import 'package:grocerystacked/app/app.locator.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThemeViewModel>.nonReactive(
      viewModelBuilder: () => locator<ThemeViewModel>(),
      builder: (context, themeModel, child) => IconButton(
        icon: Icon(themeModel.themeMode == ThemeMode.light
            ? Icons.dark_mode
            : Icons.light_mode),
        onPressed: themeModel.toggleTheme,
      ),
    );
  }
}
