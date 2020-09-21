import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Add extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();

  String bankName;
  String cardNumber;
  String expDate;
  String cvv;
  // final controller = TextEditingController();

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  Widget addButton() {
    return Container(
      padding: EdgeInsets.fromLTRB(120.0, 0.0, 120.0, 0.0),
      height: 40.0,
      child: RaisedButton(
        elevation: 10.0,
        color: Colors.grey[800],
        textColor: Colors.white,
        onPressed: () => {
          if (this.widget._formKey.currentState.validate())
            {this.widget._formKey.currentState.save()}
        },
        child: Text("Add"),
      ),
    );
  }

  Widget inpBox(String label, Function save) {
    final controller = TextEditingController();
    return Column(
      children: [
        TextFormField(
          controller: controller,
          // obscureText: true,
          decoration: InputDecoration(
            fillColor: Colors.black,
            border: OutlineInputBorder(),
            labelText: label,
          ),
          validator: (String value) {
            return value.isEmpty ? 'It\'s empty' : null;
          },
          // onChanged: (text) => this.widget._formKey.currentState.validate(),
          onSaved: (String value) => save(value),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }

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
            Form(
              key: this.widget._formKey,
              child: Column(
                children: [
                  inpBox(
                    "Bank Name",
                    (String value) => this.widget.bankName = value,
                  ),
                  inpBox(
                    "Card Number",
                    (String value) => this.widget.cardNumber = value,
                  ),
                  inpBox(
                    "Exp Date",
                    (String value) => this.widget.expDate = value,
                  ),
                  inpBox(
                    "Cvv",
                    (String value) => this.widget.cvv = value,
                  ),
                  // inpBox("Card Number"),
                ],
              ),
            ),
            SizedBox(height: 10),
            this.addButton(),
          ],
        ),
      ),
    );
  }
}

// class InpBox extends StatefulWidget {
//   final String label;
//   InpBox(this.label);

//   @override
//   _InpBoxState createState() => _InpBoxState();
// }

// class _InpBoxState extends State<InpBox> {
//   final controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {

//   }
// }
