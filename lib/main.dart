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
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text(
          'Developer',
          // style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
        child: Profile(),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/pp.jpg'),
          ),
        ),
        SizedBox(height: 20.0),
        Divider(
          height: 60,
          color: Colors.grey[800],
        ),
        Text(
          'Name',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2.0,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Vishnu Ramesh',
          style: TextStyle(
            color: Colors.amberAccent,
            letterSpacing: 2.0,
            fontSize: 30,
          ),
        ),
        SizedBox(height: 30.0),
        Row(
          children: [
            Text(
              'Email ',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 20,
              ),
            ),
            Icon(
              Icons.email,
              color: Colors.amberAccent,
              size: 30.0,
            ),
          ],
        ),
        SizedBox(height: 10.0),
        Text(
          'vishnuramesh19@gmail.com',
          style: TextStyle(
            color: Colors.amberAccent,
            letterSpacing: 2.0,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 30.0),
        Row(
          children: [
            Text(
              'Github ',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 20,
              ),
            ),
            Icon(
              Icons.code,
              color: Colors.amberAccent,
              size: 30.0,
            ),
          ],
        ),
        Text(
          'https://github.com/vishnu-vr',
          style: TextStyle(
            color: Colors.amberAccent,
            letterSpacing: 2.0,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 30.0),
      ],
    );
  }
}
