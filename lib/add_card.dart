import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Add extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();
  Function modifyData;
  String modification;

  Add(List listOfArgs) {
    // the function passed
    // eg addNewCard for adding new card
    // or editList for editting existing cards
    this.modifyData = listOfArgs[0];
    // specifies the type of modification
    // ef to add or to edit
    this.modification = listOfArgs[1];

    if (this.modification == "edit") {
      print("edit option is selected");
      this.oldCard = listOfArgs[2];
      // this.oldBankName = listOfArgs[2]["bank_name"];
      // this.oldCardNumber = listOfArgs[2]["card_number"];
      // this.oldExpDate = listOfArgs[2]["exp_date"];
      // this.oldCvv = listOfArgs[2]["cvv"];
      // print(oldBankName);
    }
  }

  // for new details
  String bankName;
  String cardNumber;
  String expDate;
  String cvv;
  // for old details if editing is done
  Map<String, String> oldCard;
  // String oldBankName;
  // String oldCardNumber;
  // String oldExpDate;
  // String oldCvv;

  // final controller = TextEditingController();

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  void addButtonPressed() {
    if (this.widget._formKey.currentState.validate()) {
      this.widget._formKey.currentState.save();

      if (this.widget.modification == "add") {
        this.widget.modifyData(
              this.widget.bankName,
              this.widget.cardNumber,
              this.widget.expDate,
              this.widget.cvv,
            );
      } else {
        // print({
        //   "bank_name": this.widget.bankName,
        //   "card_number": this.widget.cardNumber,
        //   "exp_date": this.widget.expDate,
        //   "cvv": this.widget.cvv,
        // });

        this.widget.modifyData(this.widget.oldCard, {
          "bank_name": this.widget.bankName,
          "card_number": this.widget.cardNumber,
          "exp_date": this.widget.expDate,
          "cvv": this.widget.cvv,
        });
      }

      Navigator.pop(context);
    }
  }

  Widget addButton() {
    String btnText = "add";
    if (this.widget.modification == "edit") btnText = "edit";
    return Container(
      padding: EdgeInsets.fromLTRB(120.0, 0.0, 120.0, 0.0),
      height: 40.0,
      child: RaisedButton(
        elevation: 10.0,
        color: Colors.grey[800],
        textColor: Colors.white,
        onPressed: addButtonPressed,
        child: Text(btnText),
      ),
    );
  }

  Widget inpBox(String label, Function save, String oldName) {
    final controller = TextEditingController();

    if (this.widget.modification == "edit")
      controller.text = this.widget.oldCard[oldName].trim();

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

  void onSaveForBankCard(String value) {
    List<String> listOfValues = value.split('-');
    value = "";
    for (int i = 0; i < listOfValues.length; i++) {
      if (listOfValues[i] == '-') continue;
      value += listOfValues[i];
    }

    listOfValues = value.split('');
    this.widget.cardNumber = "";
    for (int i = 0; i < listOfValues.length; i++) {
      if (i != 0 && i % 4 == 0) this.widget.cardNumber += '-';
      this.widget.cardNumber += listOfValues[i];
    }
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
                    (String value) => this.widget.bankName = value.trim(),
                    "bank_name",
                  ),
                  inpBox(
                    "Card Number",
                    (String value) => this.onSaveForBankCard(value.trim()),
                    "card_number",
                  ),
                  inpBox(
                    "Exp Date",
                    (String value) => this.widget.expDate = value.trim(),
                    "exp_date",
                  ),
                  inpBox(
                    "Cvv",
                    (String value) => this.widget.cvv = value.trim(),
                    "cvv",
                  ),
                  // inpBox("Card Number"),
                ],
              ),
            ),
            SizedBox(height: 10),
            this.addButton(),
            // FloatingActionButton(
            //   onPressed: () => getStringValuesSF(),
            //   child: Text("data"),
            // ),
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
