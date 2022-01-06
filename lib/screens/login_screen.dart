import 'package:firebase_upload_example/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_upload_example/shared/email_form_field.dart';
import 'package:firebase_upload_example/shared/password_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';


//import 'package:coffee/screens/authenticate/register.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  _SignIState createState() => _SignIState();
}

class _SignIState extends State<SignIn> {
  //final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;
  // string for displaying the error Message
  String? errorMessage;

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blueGrey.shade700,
                Colors.blueGrey.shade900,
                Colors.blueGrey.shade700,
                Colors.blueGrey.shade900,
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            )),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 // Opacity(opacity: 0.2,child: SizedBox(height: 200,child: Image.asset("assets/vector.png"),),),
                 SizedBox(height: 10,),
                  Text(
                    'Sign In',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        EmailFormField(
                          controller: _emailController,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        PasswordFormField(
                          controller: _passwordController,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    width: double.infinity,
                    child: RaisedButton(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: EdgeInsets.all(15.0),
                      color: Colors.white,
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            color: Colors.blueGrey.shade600,
                            letterSpacing: 1.0,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans'),
                      ),
                      onPressed: () async {
                        signIn(_emailController.text, _passwordController.text);
                       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        // if (_formKey.currentState.validate()) {
                        //   dynamic result =
                        //       await _auth.signInWithEmailAndPassword(
                        //           _emailController.text,
                        //           _passwordController.text);
                        //   if (result == null) {
                        //     setState(
                        //         () => error = 'Invalid email or password.');
                        //   }
                        // }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    error,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Dont have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      FlatButton(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        onPressed: () {
                          widget.toggleView();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}
