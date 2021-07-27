import 'package:flutter/material.dart';

//Scaffold 基本布局，自动填充可用空间，占据整个窗口或屏幕
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Scaffold示例'),
            ),
            body: Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                  'Scaffold'),
            ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 50,
            ),
          ),
          drawer: Drawer(
            child: Center(
              child: Text(
                "抽屉"
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print("Clicked");
            },
            child: Icon(
              Icons.add
            ),
          ),
        )
    );
  }
}
