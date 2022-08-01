
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/dao/home_dao.dart';
import 'package:flutter_module/model/home_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const int APPBAR_SCROLL_OFFSET = 100;
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState(); 
  
}

class HomePageState extends State<HomePage> {
  List widgets = [];
  final List _imageUrls = [
    "http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg",
    "http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg",
    "http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg"
  ];
  double appBarAlpha = 0;
  String resultString = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  
  _onScroll(offset){
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }
  
  @override
  Widget build(BuildContext context) {

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('首页'),
    //   ),
    //   body: getBody(),
    // );

    return Scaffold(
      body: Stack(
        children: [
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: NotificationListener(
              onNotification: (scrollNotification){
                if (scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0) {
                  _onScroll(scrollNotification.metrics.pixels);
                }
                return false;
              },
              child: ListView(
                children: [
                  SizedBox(
                    height: 210,
                    child: Swiper(
                      itemCount: _imageUrls.length,
                      autoplay: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          _imageUrls[index],
                          fit: BoxFit.fill,
                        );
                      },
                      pagination: const SwiperPagination(),
                    ),
                  ),
                  SizedBox(
                    height: 800,
                    child: ListTile(
                      title: Text(resultString),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 80,
              decoration: const BoxDecoration(color: Colors.white),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('首页'),
                ),
              ),

            ),
          ),
        ],
      ),
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

  ListView getListView() => ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      }
  );

  Widget getRow(int i) {
    return Padding(padding: const EdgeInsets.all(10.0), child: Text("Row ${widgets[i]["title"]}"));
  }

  loadData() async {
    // try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        resultString = json.encode(model);
      });
    // } catch(e) {
    //   setState(() {
    //     resultString = e.toString();
    //   });
    // }


    // var url = Uri.http("jsonplaceholder.typicode.com", "/posts");
    // http.Response response = await http.get(url);
    // setState(() {
    //   widgets = json.decode(response.body);
    // });
    
    // var dio = Dio();
    // final Response response = await dio.get('jsonplaceholder.typicode.com/posts');
    // print(response.data.toString());
    // setState(() {
    //   widgets = json.decode(response.data.toString());
    // });
  }

  Widget _item(String city) {
    return Container(
      width: 90,
      height: 100,
      margin: const EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }





}