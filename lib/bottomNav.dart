import 'package:flutter/material.dart';

//BottomNavigationBar 底部导航栏，在3-5个少量视图中进行选择，导航栏的选项卡由文本标签 图标或二者结合
//通常与javaScaffold结合，作为Scaffold.bottomNavigationBar的参数
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: MyStatefulWidget()
    );
  }
}

class MyStatefulWidget extends StatefulWidget{
  MyStatefulWidget({Key? key}) : super(key: key);

  @override
  createState() {
    return _MyStatefulWidgetState();
  }

}

class _MyStatefulWidgetState extends State<MyStatefulWidget>{
  int _selectedIndex = 0;
  static const List<Widget> _widget = <Widget>[
    Text("Index 0 : 首页"),
    Text("Index 1 : 通讯录"),
    Text("Index 2 : 设置"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar 示例'),
      ),
      body: Center(
        child: _widget.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "首页"),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              label: "通讯录"),
          BottomNavigationBarItem(
              icon: Icon(Icons.build),
              label: "设置")
        ],
        currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber,
          onTap: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}
