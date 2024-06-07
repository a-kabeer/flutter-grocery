import 'package:grocerystacked/app/app.form.dart';

extension ExtendedStringValidation on String {
  bool get isValidName {
    final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
    return nameRegex.hasMatch(this);
  }
}

extension ExtendedEmailValidation on String {
  bool get isValidEmail {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(this);
  }
}

extension ExtendedPhoneValidation on String {
  bool get isValidPhone {
    final phoneRegex = RegExp(r'^\+?[0-9]\d{10}$');
    return phoneRegex.hasMatch(this);
  }
}

extension ExtendedPasswordValidation on String {
  bool get isValidPassword {
    final passwordRegex =
        RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$');
    return passwordRegex.hasMatch(this);
  }
}

class ValidationModel with $App {
  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    } else if (!value.isValidName) {
      return 'Please enter a valid name';
    }
    return null;
  }

  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else if (!value.isValidPhone) {
      return 'Please enter a valid number eg. 03001234567';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!value.isValidEmail) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (!value.isValidPassword) {
      return 'Password must be at least 8 characters long, include an uppercase letter, a number, and a special character';
    }
    return null;
  }
}
