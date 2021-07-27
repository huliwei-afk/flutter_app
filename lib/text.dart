import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';

//Flutter框架入口 runApp方法，没有这个方法只会出现Dart的控制台应用
void main() => runApp(MyApp());

//Text文字demo
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
        body:
          Padding(
            padding: EdgeInsets.all(40.0),
            child: Text(
                '文本样式',
                style: TextStyle(
                fontSize: 16.0,
                color: Colors.indigo,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      );
    }
}




























