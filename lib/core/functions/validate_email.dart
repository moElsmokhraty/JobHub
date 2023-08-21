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
