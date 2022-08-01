
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  MyPageState createState() => MyPageState(); 
  
}

class MyPageState extends State<MyPage> {
  
  List widgets = [];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('我的'),
      ),
      body: getBody(),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

  showLoadingDialog() {
    return widgets.isEmpty;
  }
  getProgressDialog() {
    return const Center(child: CircularProgressIndicator());
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  _handleRefresh(){
    loadData();
  }

  Widget getListView() {
   return RefreshIndicator(
       onRefresh: () async {
        _handleRefresh();
      },
       child: ListView.builder(
              itemCount: widgets.length,
              itemBuilder: (BuildContext context, int position) {
                return getRow(position);
            },
       ),
    );
  }

  Widget getRow(int i) {
    return Padding(padding: const EdgeInsets.all(10.0), child: Text("Row ${widgets[i]["title"]}"));
  }

  loadData() async {
    var url = Uri.http("jsonplaceholder.typicode.com", "/posts");
    http.Response response = await http.get(url);
    setState(() {
      widgets = json.decode(response.body);
    });


  }
  
}