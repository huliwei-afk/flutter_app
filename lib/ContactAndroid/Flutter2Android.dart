//Flutter端通过PlatformChannel与Android进行通信
//flutter定义了三种不同类型的PlatformChannel
//1. MethodChannel：传递方法调用，比较常用
//2. EventChannel：传递事件
//3. BasicMessageChannel：传递数据

//以MethodChannel举例，了解BinaryMessenger，Codec，Handler的概念

/*
  BinaryMessenger：是PlatformChannel和Flutter端的通信工具，通信使用消息格式为二进制数据，
  BinaryMessenger在Android中是一个接口，他的实现类为FlutterNativeView
 */

/*
  Codec：是消息解码器，主要用于将二进制格式的数据转化为Handler能够识别的数据，Flutter定义了两
  种Codec。一种是MessageCodec，一种是MethodCodec，前者用于二进制格式数据与基础数据之间的解码，
  BasicMessageChannel所使用的解码器就是MessageCodec。MethodChannel和EventChannel所使用
  的解码器为MethodCodec
 */

/*
  Handler：Flutter定义了三种类型的Handler，他们与PlatformChannel类型一一对应，分别为
  MessageHandler、MethodHandler和StreamHandler。使用PlatformChannel时，会为他注册一个
  Handler，PlatformChannel会将该二进制数据通过Codec解码器转化为Handler能够识别的数据，并交
  给Handler处理。Handler处理完消息后，会通过回调返回result，将result通过编解码器编码为二进制
  格式数据，通过BinaryMessenger发送回Flutter端

  MethodChannel可以实现Flutter调用Android，也可以实现Android调用Flutter
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  //创建MethodChannel，传入对应Android端的Name
  static const platformChannel = const MethodChannel('com.example.platform_channel/dialog');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter demo",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter调用Android"),
        ),
        body: Padding(
          padding: EdgeInsets.all(40.0),
          child: ElevatedButton(
            child: Text("调用Dialog"),
            onPressed: () {
              showDialog("Flutter调用Android");
            },
          ),
        ),
      ),
    );
  }

  void showDialog(String content) async{
    var arguments = Map();
    arguments['content'] = content;
    try{
      //第一个参数是方法名称，第二个参数arguments是Map或Json类型的，是传递给Android端的数据
      String result = await platformChannel.invokeMethod('dialog',arguments);
      print('showDialog ' + result);
    }on PlatformException catch(e){
      print('showDialog ' + e.code + e.details + e.message.toString());
    }on MissingPluginException catch(e){
      print('showDialog ' + e.message.toString());
    }
  }

}
