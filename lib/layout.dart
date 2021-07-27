import 'package:flutter/material.dart';
//布局Widget 根据子元素的排列方式可以将布局Widget分为几种
//线性布局，流式布局，层式布局，弹性布局
//1. 线性布局 类似LinearLayout，可以垂直排列也可以水平排列
//Row：水平方向线性布局  Column：垂直方向线性布局
// void main() => runApp(RowWidget());
//
// class RowWidget extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Flutter",
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Flutter"),
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(40.0),
//           child: Row(
//             children: <Widget>[
//               Text("Android进阶之光"),
//               Text("Android进阶揭秘")
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// }

//2. 流式布局 把超出屏幕显示范围的控件自动换行，Flutter提供了Wrap来实现流式布局
// void main() => runApp(ChipWidget());
//
// class ChipWidget extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Flutter",
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("流式布局示例"),
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(20.0),
//           child: Wrap(
//             direction: Axis.horizontal,
//             spacing: 8.0,
//             runSpacing: 12.0,
//             children: <Widget>[
//               Chip(
//                   label: Text("Android进阶之光"),
//                   avatar: CircleAvatar(
//                     backgroundColor: Colors.blue,
//                     child: Text('1'),
//                   )
//               ),
//               Chip(
//                   label: Text("Android进阶解密"),
//                   avatar: CircleAvatar(
//                     backgroundColor: Colors.blue,
//                     child: Text('2'),
//                   )
//               ),
//               Chip(
//                   label: Text("Android进阶指北"),
//                   avatar: CircleAvatar(
//                     backgroundColor: Colors.blue,
//                     child: Text('3'),
//                   )
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// }


//3. 层式布局 类似FrameLayout，Flutter通过Stack实现
// 子Widget通过添加顺序确定显示层级，后面添加的覆盖在前面添加的上面
//为了确定子Widget到父容器四个角的位置，Stack将Widget分为以下两类
//Positioned：Positioned嵌套的子Widget，Positioned可以控制子Widget到父容器四个边的距离
//non-Positioned：没有用Positioned嵌套的子View，使用alignment属性来控制自身在父容器中的位置
// void main() => runApp(StackWidget());
//
// class StackWidget extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Flutter",
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("StackWidget示例"),
//         ),
//         body: Stack(
//           fit: StackFit.expand,
//           children: <Widget>[
//             Positioned(
//                 left: 90.0,
//                 top: 120.0,
//                 child: Image.asset(
//                   "assets/images/mayi.png",
//                   width: 200.0,
//                   height: 300.0,
//                   fit: BoxFit.cover,
//                 ),
//             ),
//             Container(
//               child: Text('樱岛麻衣',
//               style: TextStyle(
//                 color: Colors.lightBlue,
//                 fontSize: 20.0)
//               ),
//               height: 50.0,
//               width: 100.0,
//               alignment: Alignment.center,
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
// }


//4. 弹性布局 类似FlexboxLayout，Flutter中是Flex实现
//避免子Widget在Flex，Row，Column中超界，可以使用Flexible和Expanded
//这两个属性为子Widget提供弹性能力，下例搭配使用
main() => runApp(FlexWidget());

class FlexWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flex使用示例"),
        ),
        body: Flex(
          //设置主轴方向，必须设置
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  height: 60.0,
                  width: 60.0,
                  color: Colors.red,
                )
            ),
            Expanded(
                flex: 3,
                child: Container(
                  height: 60.0,
                  width: 30.0,
                  color: Colors.yellow,
                )
            ),
            Expanded(
                flex: 1,
                child: Container(
                  height: 60.0,
                  width: 30.0,
                  color: Colors.blue,
                )
            ),
          ],
        ),
      ),
    );
  }

}