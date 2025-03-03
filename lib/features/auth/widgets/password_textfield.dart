import 'package:flutter/material.dart';

class ObscureTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? error;

  const ObscureTextField(
      {Key? key, required this.controller, required this.error})
      : super(key: key);

  @override
  _ObscureTextFieldState createState() => _ObscureTextFieldState();
}

class _ObscureTextFieldState extends State<ObscureTextField> {
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _isObscured,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: 'Password',
        errorText: widget.error,
        suffixIcon: IconButton(
          icon: Icon(
            _isObscured ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured; // Toggle the obscure state
            });
          },
        ),
      ),
    );
  }
}
