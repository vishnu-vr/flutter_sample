import 'package:flutter/material.dart';
import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:sample/help.dart';
import 'dart:convert';
import 'package:sample/loading.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> atmCardList;

  @override
  void initState() {
    super.initState();
    // print(getStringValuesSF());
    setAtmList();
  }

  void setAtmList() async {
    String storedData = await getStringValuesSF();
    setState(() {
      this.atmCardList = json.decode(storedData);
      // print();
    });
  }

  void deleteCard(Map<String, dynamic> cardInfo) {
    print("card to be deleted : \n");
    print(cardInfo);
    setState(() {
      this.atmCardList.remove(cardInfo);
    });

    addStringToSF(json.encode(this.atmCardList));
  }

  Widget displayContent() {
    final Widget theLoader = Loader();

    if (this.atmCardList == null)
      return theLoader;
    else if (this.atmCardList.isEmpty) {
      return Container(
        child: Center(
          child: Text(
            "Add a new card :)",
            style: TextStyle(
              color: Colors.grey[400],
              letterSpacing: 1,
              fontSize: 20,
            ),
          ),
        ),
      );
    } else
      return ListView(
        children: this
            .atmCardList
            .map((e) => AtmCard(e["bank_name"], e["card_number"], e["exp_date"],
                e["cvv"], () => {this.deleteCard(e)}))
            .toList(),
      );
  }

  void addNewCard(
    String bankName,
    String cardNumber,
    String expDate,
    String cvv,
  ) {
    Map<String, String> data = {
      "bank_name": bankName,
      "card_number": cardNumber,
      "exp_date": expDate,
      "cvv": cvv,
    };

    setState(() {
      atmCardList.add(data);
    });

    addStringToSF(json.encode(this.atmCardList));
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
        child: this.displayContent(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          '/add',
          arguments: addNewCard,
        ),
        child: Icon(Icons.add),
        backgroundColor: Colors.black87,
        elevation: 20.0,
      ),
    );
  }
}

class AtmCard extends StatelessWidget {
  final Function deleteCard;

  final String bankName;
  final String cardNumber;
  final String expDate;
  final String cvv;
  AtmCard(
    this.bankName,
    this.cardNumber,
    this.expDate,
    this.cvv,
    this.deleteCard,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 10.0,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SizedBox(width: 10),
                  Text(
                    this.bankName.toUpperCase(),
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.black87,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: this.deleteCard,
                  ),
                ],
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
