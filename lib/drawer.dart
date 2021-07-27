import 'package:flutter/material.dart';

//Drawer 类似DrawerLayout，通常与Scaffold.drawer一起使用
//子项通常为ListView，其第一个子项是头部，头部可以由DrawerHeader或UserAccountsDrawerHeader实现
void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulWidget(),
    );
  }

}

class MyStatefulWidget extends StatefulWidget{
  MyStatefulWidget({Key? key}) : super(key: key);

  @override
  createState() {
    return _DrawerState();
  }

}

class _DrawerState extends State<MyStatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer示例"),
      ),
      drawer: _drawer,
    );
  }

  get _drawer => Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
            accountName: Text("麻衣学姐"),
            accountEmail: Text("Mayi@qq.com"),
            currentAccountPicture: CircleAvatar(
              child: Text('X'),
            ),
        ),
        ListTile(
          leading: Icon(Icons.local_post_office),
          title: Text("邮件"),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("设置"),
        )
      ],
    ),
  );
}