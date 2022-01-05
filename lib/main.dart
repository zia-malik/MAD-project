import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_upload_example/screens/home_screen.dart';
import 'package:firebase_upload_example/screens/login_screen.dart';
import 'package:firebase_upload_example/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Drive Gallery';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.red),
        home: Wrapper(),
      );
}