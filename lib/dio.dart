import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
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
        result = data['reason'];
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