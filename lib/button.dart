import 'package:flutter/material.dart';

//Button按钮Demo
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Basics Widget'),
            ),
            body: Center(
              child: ElevatedButton(
                onPressed: () => print("onPressed"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.lightBlueAccent
                  )
                ),
                child: Text(
                  "ElevatedButton",
                  style: TextStyle(
                    fontSize: 10
                  ),
                ),
              )
            )
        )
    );
  }
}
