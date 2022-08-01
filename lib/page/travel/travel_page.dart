
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TravelPage extends StatefulWidget {
  const TravelPage({Key? key}) : super(key: key);

  @override
  TravelPageState createState() => TravelPageState(); 
  
}

class TravelPageState extends State<TravelPage> {
  ScrollController _scrollController = ScrollController();
  
  List<String> cityNames = ["东城区", "东城区","东城区","东城区","东城区","东城区","东城区","东城区","东城区"];
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
          _loadData();
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('旅游'),
      ),
      body: RefreshIndicator(
        onRefresh: _handleData,
        displacement: 40,
        color: Colors.red,
        // backgroundColor: Colors.blue,
        child: GridView.count(
          crossAxisCount: 2,
          controller: _scrollController,
          children: _itemList(),
        ),
      )
    );
    // TODO: implement build
    throw UnimplementedError();
  }

  Future<void> _handleData() async {
    await Future.delayed(const Duration(seconds: 2));

  }

  _loadData() async {
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {
      List<String> list = List<String>.from(cityNames);
      list.addAll(cityNames);
      cityNames = list;
    });
  }

  List<Widget> _itemList(){
    return cityNames.map((e) => _item(e)).toList();
  }

  Widget _item(String city){
    return Container(
      height: 80,
      margin: const EdgeInsets.fromLTRB(5, 5, 0, 0),
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}