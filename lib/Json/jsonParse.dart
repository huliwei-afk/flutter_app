//json解析的方式主要有三种
//前面的demo中我们都使用了json.decode方法，需要引入dart:convert库
//json.decode方法会将String类型数据解析成Map数据结构 Map<String, dynamic>，取数据格式为object[key]
//对于一些不复杂的数据，可以使用json.decode，如果数据比较复杂，每次取object[key]就容易出错
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_app/Json/Ip.dart';
//dart的第三方网络请求库有http和dio
//dio是一个支持拦截，全局配置，FormData，请求取消，文件下载和超时的库
main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyHomePage()
    );
  }

}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key? key}) : super(key: key);

  @override
  createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage>{
  var _ipAddress = 'Unknown';

  _getIpAddress() async {
    var url = 'http://v.juhe.cn/toutiao/index?type=&page=&page_size=&is_filter=&key=2cb4dfb90827deb9158e0a1f4e4f1e45';
    Dio _dio = Dio();
    String result;
    try{
      var response = await _dio.get(url);
      if(response.statusCode == HttpStatus.ok){
        var data = jsonDecode(response.toString());
        var ip = Ip.fromJson(data);
        result = ip.reason;
      }else{
        result = 'Error getting IP status ${response.statusCode}';
      }
    }catch(exception){
      result = exception.toString();
    }
    if(!mounted)return;
    setState(() {
      _ipAddress = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    var spacer = SizedBox(height: 10.0,);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(100.0),
        child: Column(
          children: <Widget>[
            Text('IP地址为:'),
            spacer,
            Text('$_ipAddress'),
            spacer,
            ElevatedButton(
                onPressed: _getIpAddress,
                child: Text('请求网络'))
          ],
        ),
      ),
    );
  }

}