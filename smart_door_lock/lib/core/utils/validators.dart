import 'dart:core';

String? validateEmailOrPhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an email or phone number';
  }
  String emailPattern =
      r'^[a-z0-9.]+@[a-z]+\.[a-z]{2,4}$';

  String phonePattern = r'^[0-9]{10}$';

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
      r'^[a-z0-9.]+@[a-z]+\.[a-z]{2,4}$';

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

  String phonePattern = r'^[0-9]{10}$';

  if (RegExp(phonePattern).hasMatch(value)) {
    return null;
  } else {
    return 'Enter a valid Phone number';
  }
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password must start with capital letter\nand at least 6 characters long';
  }

  String passwordPattern = r'^[a-zA-Z\d@#]{5,}$';

  if (RegExp(passwordPattern).hasMatch(value)) {
    return null;
  } else {
    return "Password you have entered is incorrect.";
  }
}

String? validateConfirmPassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter correct password';
  }
  return null;
}
