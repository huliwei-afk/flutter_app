import 'package:flutter/material.dart';
void main() => runApp(MyApp());
//Scrolling Widget--------------------------------------------------------------
// 滑动Widget 有ListView，GridView和PageView
// ListView有四个构造器。默认构造函数，ListView.builder,ListView.separated,ListView.custom
//1. ListView 默认构造函数
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView示例'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text("第一行"),
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text("第二行"),
            )
          ],
        ),
      ),
    );
  }

}


//2. 如果要展示大量表项 使用ListView.builder
// void main() => runApp(MyApp(
//   items: new List<String>.generate(300, (index) => "第$index行")
// ));
// class MyApp extends StatelessWidget{
//   final List<String> items;
//   MyApp({required this.items});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('ListView示例'),
//         ),
//         body: ListView.builder(
//           itemCount: items.length,
//           itemBuilder: (context, index){
//             return ListTile(
//               leading: Icon(Icons.access_time),
//               title: Text('${items[index]}'),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
// }


//3. ListView.separated
// void main() => runApp(MyApp(
//     items: new List<String>.generate(300, (index) => "第$index行")
// ));
// class MyApp extends StatelessWidget{
//   final List<String> items;
//   MyApp({required this.items});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('ListView示例'),
//         ),
//         body: ListView.separated(
//           itemCount: items.length,
//           itemBuilder: (context, index){
//             return ListTile(
//               leading: Icon(Icons.access_time),
//               title: Text('${items[index]}'),
//             );
//           },
//           separatorBuilder: (context, index){
//             return Container(
//               constraints: BoxConstraints.tightFor(height: 1),
//               color: Colors.black45,
//             );
//           },
//         ),
//       ),
//     );
//   }
//
// }


//GridView----------------------------------------------------------------------
//用法与ListView类似，有5种构造函数。
//默认构造函数，GridView.count, GridView.extent, GridView.buildr, GridView.custom
//以第2种构造函数为例
//GridView.count
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter',
//       home: Scaffold(
//         appBar: AppBar(
//           title: new Text('GridView示例'),
//         ),
//         body: GridView.count(
//             //设置横轴item数量
//             crossAxisCount: 3,
//             children: <Widget>[
//               ListTile(title: Text('item1'),),
//               ListTile(title: Text('item2'),),
//               ListTile(title: Text('item3'),),
//               ListTile(title: Text('item4'),),
//               ListTile(title: Text('item5'),),
//               ListTile(title: Text('item6'),),
//               ListTile(title: Text('item7'),),
//               ListTile(title: Text('item8'),),
//               ListTile(title: Text('item9'),)
//             ],
//         ),
//       ),
//     );
//   }
//
// }


//PageView----------------------------------------------------------------------
//是一个可逐页滚动的列表，与ViewPager类似，PageView有三种构造函数
//默认构造函数, PageView.builder, PageView.custom
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('PageView示例'),
//         ),
//         body: PageView(
//           onPageChanged: (index){
//             print('当前为$index页');
//           },
//           children: <Widget>[
//             ListTile(title: Text('第0页'),),
//             ListTile(title: Text('第1页'),),
//             ListTile(title: Text('第2页'),)
//           ],
//         ),
//       ),
//     );
//   }
//
// }
