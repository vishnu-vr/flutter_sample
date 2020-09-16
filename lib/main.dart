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
            AtmCard("Axis Bank", "0000-0000-0000-0000", "08/22", "220"),
            AtmCard("Federal Bank", "0000-0000-0000-0000", "08/22", "220"),
            AtmCard("State Bank", "0000-0000-0000-0000", "08/22", "220"),
          ],
        ),
      ),
    );
  }
}

class AtmCard extends StatelessWidget {
  final String bankName;
  final String cardNumber;
  final String expDate;
  final String cvv;
  AtmCard(this.bankName, this.cardNumber, this.expDate, this.cvv);

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
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.bankName.toUpperCase(),
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.black87,
                  ),
                ),
                Divider(color: Colors.black),
                AtmCardInsideInfo("Card Number", this.cardNumber),
                AtmCardInsideInfo("Exp Date", this.expDate),
                AtmCardInsideInfo("CVV", this.cvv),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class AtmCardInsideInfo extends StatelessWidget {
  final String holderName;
  final String holderInfo;
  AtmCardInsideInfo(this.holderName, this.holderInfo);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.holderName + " :",
            style: TextStyle(
              letterSpacing: 1.0,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
          // SizedBox(height: 1.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                this.holderInfo,
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              ),
              FlatButton(
                onPressed: () => {print("copy to clipboard")},
                child: Icon(Icons.content_copy, size: 22.0),
              )
            ],
          ),
        ],
      ),
    );
  }
}
