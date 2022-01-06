import 'package:flutter/material.dart';
import 'constants.dart';

class EmailFormField extends StatefulWidget {
  final TextEditingController controller;

  const EmailFormField({
    required this.controller,
  }) : assert(controller != null);

  @override
  _EmailFormFieldState createState() => _EmailFormFieldState();
}

class _EmailFormFieldState extends State<EmailFormField> {
  String error = '';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autocorrect: false,
        cursorColor: Colors.white,
        cursorWidth: 2.0,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.white),
        controller: widget.controller,
        decoration: new InputDecoration(
          labelText: 'Email',
          labelStyle: TextStyle(color: Colors.white),
          floatingLabelStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(
            Icons.email,
            color: Colors.white,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(15)),
        ),
        validator: (val) {
           if (val!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(val)) {
            return ("Please Enter a valid email");
          }
          return null;
        });
  }
}
