import 'package:flutter/material.dart';
import '../../../core/utils/validators.dart';
import '../controllers/controllers.dart';

String selectedCountryCode = '+91';

bool isPhoneNumber(String input) {
  final phoneRegex = RegExp(r"^\d{10}$");
  return phoneRegex.hasMatch(input);
}

Widget buildEmailField(String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email ID",
        border: OutlineInputBorder(),
        fillColor: Color(0xFFF7F7F7),
        filled: true,
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Email is required';
        } else if (!RegExp(r'^[a-z0-9.]+@[a-z]+\.[a-z]{2,4}$').hasMatch(value.trim())) {
          return 'Enter a valid email address';
        }
        return null;
      },

    ),
  );
}

Widget buildTextField(String label, {String? Function(String?)? validator}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        fillColor: Color(0xFFF7F7F7),
        filled: true,
      ),
      validator: validator,
    ),
  );
}

Widget buildPhoneField(Function(String) onCountryCodeChanged) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Container(
          width: 100,
          child: DropdownButtonFormField<String>(
            value: selectedCountryCode,
            items: ['+91', '+1', '+32', '+43', '+44', '+54', '+61']
                .map((code) => DropdownMenuItem(
              value: code,
              child: Text(code),
            ))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                onCountryCodeChanged(value); // Update state in parent widget
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Color(0xFFF7F7F7),
              filled: true,
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            maxLength: isPhoneNumber(phoneController.text) ? 10 : null,
            controller: phoneController,
            keyboardType: TextInputType.phone,
            validator: validatePhone,
            decoration: InputDecoration(
              labelText: "Phone Number",
              border: OutlineInputBorder(),
              fillColor: Color(0xFFF7F7F7),
              filled: true,
            ),
          ),
        ),
      ],
    ),
  );
}
Widget buildPasswordField({
  required String label,
  required TextEditingController controller,
  required bool isPasswordVisible,
  required VoidCallback onToggleVisibility,
  required String? Function(String?) validator,
  void Function(String)? onChanged,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      controller: controller,
      obscureText: !isPasswordVisible,
      validator: validator,
      onChanged: onChanged, // Optional for confirm password
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        fillColor: Color(0xFFF7F7F7),
        filled: true,
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: onToggleVisibility,
        ),
      ),
    ),
  );
}
Widget buildSearchField(String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        fillColor: Color(0xFFF7F7F7),
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
      ),
    ),
  );
}