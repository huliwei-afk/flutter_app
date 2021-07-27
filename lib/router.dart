import 'package:flutter/material.dart';
void main() => runApp(MyApp());
//路由---------------------------------------------------------------------------
//1.新建路由
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material Components',
        home: FirstPage()
    );
  }
}

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '第一页'
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: ElevatedButton(
          child: Text('跳转到第二页'),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    //如果想在路由没用时释放其资源，可以指定maintainState: false
                    builder: (context) => SecondPage(),
                    maintainState: true),
            );
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "第二页"
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: ElevatedButton(
          child: Text(
            "回到上一页"
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

//2.注册路由
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Material Components',
//         home: FirstPage(),
//         routes: <String, WidgetBuilder>{
//           '/first': (BuildContext context) => FirstPage(),
//           '/second':(BuildContext context) => SecondPage(),
//         },
//       initialRoute: '/first',
//     );
//   }
// }
//
// class FirstPage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//             '注册第一页'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(30.0),
//         child: ElevatedButton(
//           child: Text(
//             "跳转到第二页",
//           ),
//           onPressed: () {
//             Navigator.pushNamed(context, '/second');
//           },
//         ),
//       ),
//     );
//   }
//
// }
//
// class SecondPage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "注册第二页"
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(30.0),
//         child: ElevatedButton(
//           child: Text(
//             "回到上一页"
//           ),
//           onPressed: (){
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//     );
//   }
//
// }