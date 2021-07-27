//路由间数据传递有两种方式
//1. 通过Navigator.push方法或者Navigator.pushNamed方法传递数据
//2. 通过Widget的构造函数传递数据

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material Components',
        home: FirstPage(),
        routes: <String, WidgetBuilder>{
          '/first': (BuildContext context) => FirstPage(),
          '/second':(BuildContext context) => SecondPage(),
        },
      initialRoute: '/first',
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一页"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("跳转到第二页"),
          onPressed: () {
            Navigator.pushNamed(context, '/second',arguments: CustomArguments('Android进阶之光'));
          },
        ),
      ),
    );
  }
}

class CustomArguments {
  String content;
  //点击按钮来回都会在控制台上打印出数据
  CustomArguments(this.content){
    print(content);
  }
}

_navigateToSecondPage(BuildContext context) async{
  dynamic customArguments = await Navigator.pushNamed(context, '/second', arguments: CustomArguments('Android进阶'));
  print(customArguments.content);
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CustomArguments? customArguments = ModalRoute.of(context)!.settings.arguments as CustomArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("第二页"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('第一页的数据为：'),
            Text(customArguments!.content),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, CustomArguments('Android进阶揭秘'));//1
              },
              child: Text('返回第一页'),
            ),
          ],
        ),
      ),
    );
  }
}