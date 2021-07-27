import 'package:flutter/material.dart';


//Row水平方向显示数组中的子元素Widget，Column是垂直方向
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
              child: Row(
                children: <Widget>[
                  Icon(Icons.access_alarm),
                  Icon(Icons.add_a_photo),
                  Icon(Icons.add_call),
                  //也可以配合Expanded填充剩余空间
                  Expanded(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: const FlutterLogo(),
                      ),
                    flex: 2,
                  ),
                  Expanded(
                      child: Text(
                        '占剩余的三分之一'
                      ),
                    flex: 1,
                  ),
                ],
              )
            )
        )
    );
  }
}
