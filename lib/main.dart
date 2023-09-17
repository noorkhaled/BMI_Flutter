import 'package:flutter/material.dart';
import 'home.dart';
import 'result.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white,size: 90),
        textTheme: TextTheme(
          headline1: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
          ),headline2: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
          ),bodyText1: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
          ),
        ),
      ),
      home:  MyHomePage()
    );
  }
}


