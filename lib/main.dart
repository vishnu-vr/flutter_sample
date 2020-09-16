import 'package:flutter/material.dart';
import 'package:sample/home.dart';
import 'package:sample/add_card.dart';

void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: SafeArea(child: Home()),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/add_card': (context) => Add(),
      },
      // home: SafeArea(child: Add()),
    );
  }
}
