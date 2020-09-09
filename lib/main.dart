import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.alternate_email),
        title: Text('vishnu'),
        centerTitle: false,
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Test(20.0, Colors.red),
          Test(20.0, Colors.cyan),
          Test(20.0, Colors.brown),
        ],
      ),
      floatingActionButton: SadFloatingBtn(),
    );
  }
}

// ignore: must_be_immutable
class Test extends StatelessWidget {
  var padding;
  var color;
  Test(padding, color) {
    this.padding = padding;
    this.color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(this.padding),
      color: this.color,
      child: Center(
          child: Text(
        'data',
        style: TextStyle(color: Colors.yellow),
      )),
    );
  }
}

class SadFloatingBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        onPressed: () {
          final bar = SnackBar(content: Text('Don\'t press me i\'m sad'));
          Scaffold.of(context).showSnackBar(bar);
        },
        child: Text(':('),
        backgroundColor: Colors.black,
      ),
    );
  }
}
