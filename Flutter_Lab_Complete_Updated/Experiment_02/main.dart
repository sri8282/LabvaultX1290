import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Responsive UI')),
        body: LayoutBuilder(
          builder: (context, size) {
            if (size.maxWidth < 600) {
              return Column(
                children: [
                  Card(child: ListTile(title: Text('Student'))),
                  Card(child: ListTile(title: Text('Courses'))),
                ],
              );
            }
            return Row(
              children: [
                Expanded(child: Card(child: ListTile(title: Text('Students')))),
                Expanded(child: Card(child: ListTile(title: Text('Courses')))),
              ],
            );
          },
        ),
      ),
    );
  }
}
