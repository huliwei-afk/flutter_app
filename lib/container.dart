import 'package:flutter/material.dart';

//Container类似ViewGroup
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
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightGreen
                ),
                child: Text("Container"),
                padding: EdgeInsets.all(36.0),
                margin: EdgeInsets.all(10.0),
              ),
            )
        )
    );
  }
}
