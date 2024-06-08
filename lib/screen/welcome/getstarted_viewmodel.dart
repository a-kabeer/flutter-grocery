import 'package:flutter/material.dart';
import 'package:grocerystacked/app/app.locator.dart';
import 'package:grocerystacked/app/app.router.dart';
import 'package:grocerystacked/services/shared_preference_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GetStartedViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  void init(BuildContext context) {
    checkLoginStatus();
  }

  void checkLoginStatus() {
    String? storedEmail = LocalStorage.getString(LocalStorage.email);
    String? storedPassword = LocalStorage.getString(LocalStorage.password);
    if (storedEmail != null && storedPassword != null) {
      navigationService.replaceWithHomeView();
    }
  }
}
