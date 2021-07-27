import 'package:flutter/material.dart';

//Image图片Demo
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
              child: Image.network(
                "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Farticle%2F83269f0849a26d6c6a1e793e0afa445e097e3ace.jpg&refer=http%3A%2F%2Fi0.hdslb.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1629793372&t=86a09e475bc9bdbb84d4cbd25ce203c4",
                width: 300,
                height: 300,
                fit: BoxFit.fill,
              ),
            )
        )
    );
  }
}