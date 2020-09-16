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
  final List<Map> listOfQuotes = [
    {
      "quote": "Deep inside my shoe my sock is slipping off.",
      "author": "Vishnu Ramesh"
    },
    {
      "quote":
          "Accept the thgins you cannot change, Have the courage to change the things you can and have the wisdom to know the difference.",
      "author": "Justice League"
    },
    {
      "quote": "It's not who I am underneath, but what I do that defines me.",
      "author": "Bruce Wayne"
    }
  ];

  void removeQuotes(quote) {
    setState(() {
      this.listOfQuotes.remove(quote);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotes'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: listOfQuotes.map((e) => Quote(e, removeQuotes)).toList(),
        ),
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}

class Quote extends StatelessWidget {
  final Map quote;
  final Function removeQuotes;

  Quote(this.quote, this.removeQuotes);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 10.0,
        shadowColor: Colors.black,
        color: Colors.red[300],
        // margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                this.quote['quote'],
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              Text(
                " - " + this.quote['author'],
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Divider(),
              FlatButton(
                onPressed: () => this.removeQuotes(quote),
                child: Icon(Icons.delete),
              )
            ],
          ),
        ),
      ),
    );
  }
}
