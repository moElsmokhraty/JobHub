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
