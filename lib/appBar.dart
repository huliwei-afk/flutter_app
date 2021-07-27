import 'package:flutter/material.dart';

//AppBar 由toolbar和flexibleSpaceBar等一些widget组成
//顶部显示leading title actions等内容，底部bottom显示TabBar
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: MyScaffold()
    );
  }
}

class MyScaffold extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AppBar示例"
        ),
        leading: FlutterLogo(
          textColor: Colors.lightGreen,
        ),
        actions: <Widget>[
          IconButton(
              onPressed: (){
                print('添加按钮');
              },
              icon: Icon(
                Icons.share
              ))
        ],
      ),
    );
  }

}
