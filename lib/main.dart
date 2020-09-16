import 'package:flutter/material.dart';
import 'package:clipboard_manager/clipboard_manager.dart';

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
  final List<Map> atmCardList = [
    {
      "bank_name": "Axis Bank",
      "card_number": "0000-0000-0000-0000",
      "exp_date": "08/22",
      "cvv": "220"
    },
    {
      "bank_name": "State Bank",
      "card_number": "0000-0000-0000-0000",
      "exp_date": "08/22",
      "cvv": "220"
    },
    {
      "bank_name": "Federal Bank",
      "card_number": "0000-0000-0000-0000",
      "exp_date": "08/22",
      "cvv": "220"
    },
  ];

  void addNewCard(
    String bankName,
    String cardNumber,
    String expDate,
    String cvv,
  ) {
    setState(() {
      atmCardList.add({
        "bank_name": bankName,
        "card_number": cardNumber,
        "exp_date": expDate,
        "cvv": cvv,
      });
    });
  }

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
          children: this
              .atmCardList
              .map((e) => AtmCard(
                  e["bank_name"], e["card_number"], e["exp_date"], e["cvv"]))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            {this.addNewCard("bankName", "cardNumber", "expDate", "cvv")},
        child: Icon(Icons.add),
        backgroundColor: Colors.black87,
        elevation: 20.0,
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
    return Card(
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
                onPressed: () => {
                  ClipboardManager.copyToClipBoard(this.holderInfo)
                      .then((result) {
                    final snackBar = SnackBar(
                      content: Text('Copied to Clipboard'),
                      // action: SnackBarAction(
                      //   label: 'Undo',
                      //   onPressed: () {},
                      // ),
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                  })
                },
                child: Icon(Icons.content_copy, size: 22.0),
              )
            ],
          ),
        ],
      ),
    );
  }
}
