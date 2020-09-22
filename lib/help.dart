import 'package:shared_preferences/shared_preferences.dart';

addStringToSF(String data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('info', data);
}

getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String stringValue = prefs.getString('info');
  // print(stringValue);
  return stringValue;
}
