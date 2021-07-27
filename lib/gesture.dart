import 'package:flutter/material.dart';
//手势相关-----------------------------------------------------------------------
//Flutter中手势系统有两个独立层，一个是原始指针事件，描述了屏幕上的指针，比如触摸鼠标位置移动等
//一个是手势，由一个或多个指针移动组成等动作会被识别为不同的手势
//1. 指针事件 表示用户与设备交互的原始数据，有以下四种类型
//PointerDownEvent:指针接触到屏幕的特定位置
//PointerMoveEvent:指针已从一个位置移动到另一个位置
//PointerUpEvent:指针已停止接触屏幕
//PointerCancelEvent:指针的输入不再指向此应用
//事件的分配路径为：从最里面的Widget到树的根路径上的所有Widget

//2. 手势 由一个或多个指针移动组成的动作，手势主要有以下几个
//单击，双击，长按，垂直拖动，水平拖动。检测这些手势可以用GestureDetector
//使用GestureDetector
void main() => runApp(GestureDetectorWidget());

class GestureDetectorWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('GestureDetector示例'),
        ),
        body: Center(
          child: GestureDetector(
            child: Text('手势识别'),
            onTap: (){print("单击");},
            onDoubleTap: (){print("双击");},
            onLongPress: (){print("长按");},
            onHorizontalDragStart: (DragStartDetails details){print("水平拖动");},
          ),
        ),
      ),
    );
  }

}


//使用Dismissible 滑动删除
// void main() => runApp(DismissibleWidget(
//   items: new List<String>.generate(300, (index) => "第$index行")
// ));
//
// class DismissibleWidget extends StatelessWidget{
//   final List<String> items;
//
//   DismissibleWidget({required this.items});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Dismissible示例'),
//         ),
//         body: ListView.builder(
//             itemCount: items.length,
//             itemBuilder: (context, index){
//               final item = items[index];
//               return Dismissible(
//                   key: Key(item),
//                   onDismissed: (direction){items.removeAt(index);
//                   print(index);
//                   },
//               child: ListTile(
//                 leading: Icon(Icons.access_time),
//                 title: Text("${items[index]}"),
//               ),);
//             }),
//       ),
//     );
//   }
//
// }
