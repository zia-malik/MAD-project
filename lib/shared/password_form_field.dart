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
      validator: (val) {
        RegExp regex = new RegExp(r'^.{6,}$');
          if (val!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(val)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
      },
      obscureText: visibility,
    );
  }
}
