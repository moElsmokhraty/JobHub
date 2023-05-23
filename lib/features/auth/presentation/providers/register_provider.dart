import 'package:flutter/material.dart';

class RegisterNotifier extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool isObsecure = true;

  void changeObsecure() {
    isObsecure = !isObsecure;
    notifyListeners();
  }

// triggered when the login button is clicked to show the loading widget
  bool _processing = false;

  bool get processing => _processing;

  set processing(bool newValue) {
    _processing = newValue;
    notifyListeners();
  }

// triggered when the fist time when user login to be prompted to the update profile page
  bool _firstTime = false;

  bool get firstTime => _firstTime;

  set firstTime(bool newValue) {
    _firstTime = newValue;
    notifyListeners();
  }

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  String? validateName(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return 'Please enter username';
    } else {
      return null;
    }
  }

  String? validateEmail(String value) {
    RegExp regex = RegExp(
        r"^[a-zA-Z\d.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$");
    if (value.isEmpty || value.trim().isEmpty) {
      return 'Please enter email';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Please enter valid email';
      } else {
        return null;
      }
    }
  }

  String? validatePassword(String password) {
    bool hasUppercase = false;
    bool hasLowercase = false;
    bool hasNumber = false;
    bool hasSpecialChar = false;

    if (password.isEmpty || password.trim().isEmpty) {
      return 'Please enter password';
    }

    if (password.length < 8) {
      return ('Password must be at least 8 characters long.');
    }

    for (int i = 0; i < password.length; i++) {
      var char = password[i];
      if (RegExp(r'[A-Z]').hasMatch(char)) {
        hasUppercase = true;
      } else if (RegExp(r'[a-z]').hasMatch(char)) {
        hasLowercase = true;
      } else if (RegExp(r'[0-9]').hasMatch(char)) {
        hasNumber = true;
      } else if (RegExp(r'[!@#\$&\*~]').hasMatch(char)) {
        hasSpecialChar = true;
      }
    }

    if (hasUppercase && hasLowercase && hasNumber && hasSpecialChar) {
      return null;
    } else {
      List<String> missingChars = [];
      if (!hasUppercase) {
        missingChars.add('uppercase letters');
      }
      if (!hasLowercase) {
        missingChars.add('lowercase letters');
      }
      if (!hasNumber) {
        missingChars.add('numbers');
      }
      if (!hasSpecialChar) {
        missingChars.add('special characters');
      }
      return ('${missingChars.join(', ')} required');
    }
  }

  bool validateAndSave() {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      return true;
    } else {
      return false;
    }
  }
}
