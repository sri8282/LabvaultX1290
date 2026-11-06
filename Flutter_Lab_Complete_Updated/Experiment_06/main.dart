import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final size = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Animation')),
        body: Center(
          child: ValueListenableBuilder<bool>(
            valueListenable: size,
            builder: (context, value, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: value ? 250 : 100,
                  height: value ? 250 : 100,
                  color: Colors.blue,
                  child: Center(child: Text('Flutter')),
                ),
                ElevatedButton(
                  onPressed: () => size.value = !size.value,
                  child: Text('Animate'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
