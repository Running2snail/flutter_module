
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState(); 

}

class SearchPageState extends State<SearchPage> {

  static const CITY_NAMES = {
    "北京": ["东城区", "东城区","东城区","东城区","东城区","东城区"],
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('搜索'),
      ),
      body: ListView(
        children: _buildList(),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

  List<Widget> _buildList(){
    List<Widget> widgets = [];
    for (var key in CITY_NAMES.keys) {
      List<String>? subCities = CITY_NAMES[key];
      widgets.add(_item(key, subCities!));
    }
    return widgets;
  }
  
  Widget _item(String city, List<String> subCities) {
    return ExpansionTile(
        title: Text(
          city, 
          style: const TextStyle(color: Colors.black54, fontSize: 20),
         ),
      children: subCities.map((subCities) => _buildSub(subCities)).toList(),
    );
  }
  
  
  Widget _buildSub(String subCity) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 50,
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(bottom: 5),
        padding: const EdgeInsets.only(left: 20),
        decoration: const BoxDecoration(color: Colors.lightBlueAccent),
        child: Text(subCity),
      ),
    );
  }

}