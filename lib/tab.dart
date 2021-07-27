import 'package:flutter/material.dart';
//TabBar------------------------------------------------------------------------
//TabBar 类似TabLayout，配合TabBarView和TabController使用。
//TabBarView显示视图，Controller为控制器，是TabBar和TabBarView的桥梁
//实现TabController有默认和自定义两种方式
//1. 默认DefaultTabController
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: MyTabController()
      );
    }
}

class MyTabController extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('DefaultTabController示例'),
            bottom: TabBar(
              tabs: [
                Tab(text: "热点",),
                Tab(text: "体育"),
                Tab(text: "科技")
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(child: Text("热点")),
              Center(child: Text("体育")),
              Center(child: Text("科技"))
            ],
          ),
        )
    );
  }

}

//2. 自定义TabController
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyStatefulWidget(),
//     );
//   }
//
// }
//
// class MyStatefulWidget extends StatefulWidget{
//   MyStatefulWidget({Key? key}) : super(key: key);
//
//   @override
//   createState() {
//     return _MyStatefulWidgetState();
//   }
//
// }
//
// class _MyStatefulWidgetState extends State<MyStatefulWidget> with SingleTickerProviderStateMixin{
//   TabController? _tabController;
//
//   void initState(){
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('自定义TabController'),
//         bottom: TabBar(
//           tabs: <Widget>[
//             Tab(text: "热点",),
//             Tab(text: "体育",),
//             Tab(text: "科技",)
//           ],
//           controller: _tabController,
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: <Widget>[
//           Center(child: Text("热点"),),
//           Center(child: Text("体育"),),
//           Center(child: Text("科技"),)
//         ],
//       ),
//     );
//   }
//   @override
//   void dispose(){
//     _tabController?.dispose();
//     super.dispose();
//   }
//
// }
