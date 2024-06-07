import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:grocerystacked/app/app.locator.dart';
import 'package:grocerystacked/app/app.router.dart';
import 'package:grocerystacked/firebase_options.dart';
import 'package:grocerystacked/services/shared_preference_model.dart';
import 'package:grocerystacked/services/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await LocalStorage.initialize();
  await setupLocator();

  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThemeViewModel>.reactive(
      viewModelBuilder: () => locator<ThemeViewModel>(),
      builder: (context, model, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        title: 'Grocery App',
        theme: FlexThemeData.light(
          scheme: FlexScheme.amber,
          useMaterial3: true,
        ),
        darkTheme: FlexThemeData.dark(
          scheme: FlexScheme.amber,
          useMaterial3: true,
        ),
        themeMode: model.themeMode,
      ),
    );
  }
}
