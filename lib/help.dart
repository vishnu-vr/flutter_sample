import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

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

String aes({String data, bool en: true}) {
  final plainText = data;
  final key = encrypt.Key.fromUtf8('my 32 length key................');
  final iv = encrypt.IV.fromLength(16);

  final encrypter = encrypt.Encrypter(encrypt.AES(key));
  // final asd = encrypter.decrypt64(
  //     "R4PxiU3h8YoIRqVowBXm36ZcCeNeZ4s1OvVBTfFlZRdmohQqOpPQqD1YecJeZMAop/hZ4OxqgC1WtwvX/hP9mw==");

  if (en) {
    final encrypted = encrypter.encrypt(plainText, iv: iv).base64;
    return encrypted;
  } else {
    final decrypted = encrypter.decrypt64(data, iv: iv);
    return decrypted;
  }

  // print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
  // print(
  //     encrypted); // R4PxiU3h8YoIRqVowBXm36ZcCeNeZ4s1OvVBTfFlZRdmohQqOpPQqD1YecJeZMAop/hZ4OxqgC1WtwvX/hP9mw==
}
