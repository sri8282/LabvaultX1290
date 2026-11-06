import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Web App')),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Mobile Web Layout'),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Get Started'),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Desktop Web Layout'),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Get Started'),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
