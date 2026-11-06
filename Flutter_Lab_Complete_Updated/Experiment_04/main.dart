import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Image Gallery')),
        body: Column(
          children: [
            Image.asset('assets/images/flutter.png', height: 150),
            Text('Flutter Image Gallery'),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  Image.asset('assets/images/flutter.png'),
                  Image.asset('assets/images/flutter.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
