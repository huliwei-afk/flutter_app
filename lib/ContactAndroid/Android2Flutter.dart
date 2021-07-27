import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }

}

class MyAppState extends State<MyApp>{
  static const platformChannel = const MethodChannel('com.example.platform_channel/text');
  String textContent = "Flutter端初始文字";

  @override
  void initState(){
    super.initState();
    platformChannel.setMethodCallHandler((methodCall) async{
      switch(methodCall.method){
        case 'showText':
          String content = await methodCall.arguments['content'];
          if(content != null && content.isNotEmpty){
            setState(() {
              textContent = content;
            });
            return 'success';
          }else{
            throw PlatformException(
                code: 'error',
                message: '失败',
                details: 'content is null');
          }
          break;

        default:
          throw MissingPluginException();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter demo",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Android调用Flutter"),
        ),
        body: Padding(
          padding: EdgeInsets.all(40.0),
          child: Text(textContent),
        ),
      ),
    );
  }

}