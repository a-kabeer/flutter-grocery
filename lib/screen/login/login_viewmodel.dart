import 'package:flutter/material.dart';
import 'package:grocerystacked/app/app.form.dart';
import 'package:grocerystacked/app/app.locator.dart';
import 'package:grocerystacked/app/app.router.dart';
import 'package:grocerystacked/services/auth_model.dart';
import 'package:grocerystacked/services/shared_preference_model.dart';
import 'package:grocerystacked/services/validation_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel with $App {
  void init(BuildContext context) {
    // checkLoginStatus();
  }

  final NavigationService navigationService = locator<NavigationService>();

  final _formKey = GlobalKey<FormState>();
  get formKey => _formKey;
  ValidationModel validationModel = ValidationModel();
  AuthModel authModel = AuthModel();
  submitForm() async {
    if (_formKey.currentState!.validate()) {
      bool isSignedIn = await authModel.signInWithEmailAndPassword();
      if (isSignedIn) {
        LocalStorage.setString(LocalStorage.email, emailController.text);
        LocalStorage.setString(LocalStorage.password, passwordController.text);
        print('login successful');
        navigationService.replaceWithHomeView();
      } else {
        print('Not Available');
      }
    } else {
      if (validationModel.emailValidator(emailController.text) != null) {
        emailFocusNode.requestFocus();
      } else if (validationModel.passwordValidator(passwordController.text) !=
          null) {
        passwordFocusNode.requestFocus();
      }
    }
  }

  // void checkLoginStatus() {
  //   String? storedEmail = LocalStorage.getString(LocalStorage.email);
  //   String? storedPassword = LocalStorage.getString(LocalStorage.password);
  //   if (storedEmail != null && storedPassword != null) {
  //     navigationService.replaceWithHomeView();
  //   }
  // }

  void loginWithGoogle() {
    navigationService.replaceWithHomeView();
  }

  void loginWithFacebook() {
    navigationService.replaceWithHomeView();
  }
}
