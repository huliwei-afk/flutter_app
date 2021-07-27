//加载assets目录下json文件
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
void main() => runApp(AssetWidget());

class AssetWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('加载文本示例'),
        ),
        body: JsonWidget(),
      ),
    );
  }

}

class JsonWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _JsonWidgetState();
  }

}

class _JsonWidgetState extends State<JsonWidget>{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: rootBundle.loadString("assets/json/swordsmen.json"),
        //future: DefaultAssetBundle.of(context).loadString("assets/swordsmen.json"),
        //数据信息等存储在snapshot中
        builder: (context, snapshot){
          if(!snapshot.hasData){
            throw FlutterError("Unable to load assets");
            // return Center(
            //   child: CircularProgressIndicator(),
            // );
          }else{
            List<dynamic> data = json.decode(snapshot.data.toString());
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("名字:${data[index]["name"]}"),
                        Text("绝学:${data[index]["gongfu"]}")
                      ],
                    ),
                  );
                }
                );
          }
        },
    );
  }

}


//加载图片资源
// void main() => runApp(AssetsWidget());
//
// class AssetsWidget extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Flutter",
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("加载图片示例"),
//         ),
//         body: ImageWidget(),
//       ),
//     );
//   }
//
// }
//
// class ImageWidget extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: <Widget>[
//           Image.asset(
//             'assets/images/mayi.png',
//             height: 200,
//           )
//         ],
//       ),
//     );
//   }
//
// }
