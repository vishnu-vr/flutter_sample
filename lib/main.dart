import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text("Locker"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
        child: ListView(
          children: [
            AtmCard("Axis Bank", "0000-0000-0000-0000"),
            AtmCard("Federal Bank", "0000-0000-0000-0000"),
            AtmCard("State Bank", "0000-0000-0000-0000"),
          ],
        ),
      ),
    );
  }
}

class AtmCard extends StatelessWidget {
  final String bankName;
  final String cardNumber;
  AtmCard(this.bankName, this.cardNumber);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => {print("card clicked")},
      child: Card(
        shadowColor: Colors.black,
        elevation: 10.0,
        color: Colors.red[400],
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(children: [
              Text(
                this.bankName,
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Text(
                this.cardNumber,
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
