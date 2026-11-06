import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Student Profile')),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              child: Text('Student Profile'),
            ),
            Text('Raj'),
            Text('CSE'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.home),
                Icon(Icons.person),
                Icon(Icons.settings),
              ],
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.book),
                title: Text('Flutter'),
                subtitle: Text('Mobile App Development'),
              ),
            ),
            ListTile(title: Text('Cloud Computing')),
            ListTile(title: Text('Programming')),
          ],
        ),
      ),
    );
  }
}
