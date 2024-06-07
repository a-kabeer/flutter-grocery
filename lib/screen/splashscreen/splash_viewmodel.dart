import 'package:grocerystacked/app/app.locator.dart';
import 'package:grocerystacked/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:stacked_services/stacked_services.dart';

class SplashViewmodel extends BaseViewModel {
  void init(BuildContext context) {
    final NavigationService navigationService = locator<NavigationService>();

    Timer(const Duration(seconds: 3), () {
      navigationService.replaceWith(Routes.getStartedView);
    });
  }
}
