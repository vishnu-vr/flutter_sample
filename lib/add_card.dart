import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text("Add Card"),
        centerTitle: true,
      ),
      // backgroundColor: Colors.grey[900],
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
        child: Column(
          children: [
            InpBox("Bank Name"),
            InpBox("Card Number"),
            InpBox("Exp Date"),
            InpBox("CVV"),
          ],
        ),
      ),
    );
  }
}

class InpBox extends StatelessWidget {
  final String label;
  InpBox(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextFormField(
            // obscureText: true,
            decoration: InputDecoration(
              fillColor: Colors.black,
              border: OutlineInputBorder(),
              labelText: this.label,
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
