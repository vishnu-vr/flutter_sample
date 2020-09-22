import 'package:flutter/material.dart';
import 'package:sample/home.dart';

// import 'package:sample/add_card.dart';
import 'package:sample/route_generator.dart';

void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: Home()),
      onGenerateRoute: RouteGenerator.generateRoute,
      // home: SafeArea(child: Add()),
    );
  }
}
