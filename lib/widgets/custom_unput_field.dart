import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String formProperty;
  final Map<String, String> referencedMap;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    required this.formProperty,
    required this.referencedMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: (String value) {
        referencedMap[formProperty] = value;
      },
      validator: (String? value) {
        if (value == null) return 'Required field';
        return value.length < 3 ? '3 characters minimum' : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        suffixIcon: (suffixIcon != null) ? Icon(suffixIcon) : null,
        //prefixIcon: Icon(Icons.verified_user_outlined),
        icon: (icon != null) ? Icon(icon) : null,
      ),
    );
  }
}
