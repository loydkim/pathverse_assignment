import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String labelText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool obscureText;
  const AuthTextField(
      {super.key,
      required this.labelText,
      this.validator,
      this.suffixIcon,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    final regularBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(
        color: Colors.white.withOpacity(0.4),
      ),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(
        color: Colors.red.withOpacity(0.4),
        width: 2.4,
      ),
    );
    return TextFormField(
        decoration: InputDecoration(
            focusedBorder: regularBorder.copyWith(
                borderSide: BorderSide(
                    color: Colors.white.withOpacity(0.4), width: 2.0)),
            enabledBorder: regularBorder,
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
            labelText: labelText,
            fillColor: Colors.white.withOpacity(0.2),
            filled: true,
            contentPadding: const EdgeInsets.fromLTRB(16, 0, 12, 0),
            labelStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
            errorStyle: TextStyle(
              fontSize: 16,
              color: Colors.red.withOpacity(0.6),
            ),
            suffix: suffixIcon),
        obscureText: obscureText,
        style: TextStyle(color: Colors.white.withOpacity(0.8)),
        validator: validator);
  }
}
