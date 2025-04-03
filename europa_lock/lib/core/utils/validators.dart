import 'dart:core';

String? validateEmailOrPhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an email or phone number';
  }
  String emailPattern =
      // r'^[a-zA-Z0-9.]+@[gmail,tudip]+\.[com]{2,4}$';
      r'^[a-z0-9.]+@(gmail\.com|tudip\.com)$';

  String phonePattern = r'^[987][0-9]{9}$';

  if (RegExp(emailPattern).hasMatch(value)) {
    return null;
  } else if (RegExp(phonePattern).hasMatch(value)) {
    return null;
  } else {
    return 'Enter a valid email or phone number';
  }
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an Email Id';
  }
  String emailPattern =
  // r'^[a-zA-Z0-9.]+@[gmail,tudip]+\.[com]{2,4}$';
      r'^[a-z0-9.]+@(gmail\.com|tudip\.com)$';

  if (RegExp(emailPattern).hasMatch(value)) {
    return null;
  } else {
    return 'Enter a valid Email Id';
  }
}

String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter Phone number';
  }

  String phonePattern = r'^[987][0-9]{9}$';

  if (RegExp(phonePattern).hasMatch(value)) {
    return null;
  } else {
    return 'Enter a valid Phone number';
  }
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }

  String passwordPattern = r'^[A-Z][a-zA-Z\d@#]{5,}$';

  if (RegExp(passwordPattern).hasMatch(value)) {
    return null;
  } else {
    return "Password you have entered is incorrect.";
  }
}

