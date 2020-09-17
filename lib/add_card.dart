import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
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
        child: ListView(
          children: [
            InpBox("Bank Name"),
            // InpBox("Card Number"),
            // InpBox("Exp Date"),
            // InpBox("CVV"),
          ],
        ),
      ),
    );
  }
}

class InpBox extends StatefulWidget {
  final String label;
  InpBox(this.label);

  @override
  _InpBoxState createState() => _InpBoxState();
}

class _InpBoxState extends State<InpBox> {
  final controller_1 = TextEditingController();
  // final controller_2 = TextEditingController();
  String tt;
  var _formKey = GlobalKey<FormState>();

  // void setText(text) {
  //   setState(() {
  //     this.tt = this.controller_1.text;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: this.controller_1,
            // obscureText: true,
            decoration: InputDecoration(
              fillColor: Colors.black,
              border: OutlineInputBorder(),
              labelText: this.widget.label,
            ),
            validator: (String value) {
              return value.contains('#') ? 'Do not use the @ char.' : null;
            },
            onChanged: (text) => _formKey.currentState.validate(),
          ),
          SizedBox(height: 20.0),
          // TextFormField(
          //   controller: this.controller_2,
          //   // obscureText: true,
          //   decoration: InputDecoration(
          //     fillColor: Colors.black,
          //     border: OutlineInputBorder(),
          //     labelText: this.widget.label,
          //   ),
          //   validator: (String value) {
          //     return value.contains('@') ? 'Do not use the @ char.' : null;
          //   },
          //   onChanged: (text) => _formKey.currentState.validate(),
          // ),
        ],
      ),
    );
  }
}
