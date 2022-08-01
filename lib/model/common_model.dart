
// "icon": "http://www.devio.org/io/flutter_app/img/ln_food.png",
// "title": "缇庨鏋�",
// "url": "https://m.ctrip.com/webapp/gourmet/food/homeList/address.html?new=1&isHideNavBar=YES&ishideheader=true&seo=0&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=508670&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
// "statusBarColor": "19A0F0",
// "hideAppBar": true

import 'dart:ffi';

class CommonModel {

  late String icon;
  late String title;
  String? url;
  String? statusBarColor;
  bool? hideAppBar;

  CommonModel({required this.icon, required this.title, this.url, this.statusBarColor, this.hideAppBar});

  CommonModel.fromJson(Map<String, dynamic> json) {
    icon = json["icon"];
    title = json["title"];
    url = json["url"];
    statusBarColor = json["statusBarColor"];
    hideAppBar = json["hideAppBar"];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['icon'] = icon;
    map['title'] = title;
    map['url'] = url;
    map['statusBarColor'] = statusBarColor;
    map['hideAppBar'] = hideAppBar;
    return map;
  }

}
