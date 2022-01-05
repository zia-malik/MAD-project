import 'package:flutter/material.dart';
import 'constants.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordFormField({
    required this.controller,
  }) : assert(controller != null);

  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool visibility = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      cursorColor: Colors.white,
      cursorWidth: 2.0,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.white),
      controller: widget.controller,
      decoration: new InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(color: Colors.white),
        floatingLabelStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.white,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() => visibility = !visibility);
          },
          child: Icon(
            visibility ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
        ),
      ),
      validator: (val) =>
          val!.length < 6 ? 'Enter a password with atleast 6 characters' : null,
      obscureText: visibility,
    );
  }
}
