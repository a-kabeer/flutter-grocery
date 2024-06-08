import 'package:grocerystacked/app/app.form.dart';
import 'package:grocerystacked/app/app.locator.dart';
import 'package:grocerystacked/app/app.router.dart';
import 'package:grocerystacked/services/auth_model.dart';
import 'package:grocerystacked/services/validation_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends FormViewModel with $App {
  final NavigationService navigationService = locator<NavigationService>();

  final _formKey = GlobalKey<FormState>();
  get formKey => _formKey;
  ValidationModel validationModel = ValidationModel();
  AuthModel authModel = AuthModel();
  submitForm() async {
    if (_formKey.currentState!.validate()) {
      bool isSignup = await authModel.createUserWithEmailAndPassword();
      if (isSignup) {
        print('object');
        navigationService.replaceWithLoginView();
      } else {
        print('user already exist');
      }
    } else {
      if (validationModel.nameValidator(nameController.text) != null) {
        nameFocusNode.requestFocus();
      } else if (validationModel.emailValidator(emailController.text) != null) {
        emailFocusNode.requestFocus();
      } else if (validationModel.passwordValidator(passwordController.text) !=
          null) {
        passwordFocusNode.requestFocus();
      } else if (validationModel.phoneValidator(phoneController.text) != null) {
        phoneFocusNode.requestFocus();
      }
    }
  }

  void loginWithGoogle() {
    navigationService.replaceWithHomeView();
  }

  void loginWithFacebook() {
    navigationService.replaceWithHomeView();
  }
}
