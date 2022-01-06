import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_upload_example/model/user.dart';
import 'package:firebase_upload_example/screens/authenticate.dart';
import 'package:firebase_upload_example/screens/home_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // final user = Provider.of<User>(context);
    // print(user);
    
    // return either the Home or Authenticate widget
   // if (user == null){
    //  return Authenticate();
   // } else {
      return HomePage();
    }
    
  }