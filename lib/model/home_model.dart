import 'package:flutter_module/model/sales_box_model.dart';

import 'common_model.dart';
import 'config_model.dart';
import 'grid_nav_model.dart';

class HomeModel {
  HomeModel({
    required this.config,
    required this.bannerList,
    required this.localNavList,
    required this.gridNav,
    required this.subNavList,
    required this.salesBox,
  });

  ConfigModel config;
  List<CommonModel> bannerList;
  List<CommonModel> localNavList;
  GridNavModel gridNav;
  List<CommonModel> subNavList;
  SalesBoxModel salesBox;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    config: ConfigModel.fromJson(json["config"]),
    bannerList: List<CommonModel>.from(json["bannerList"].map((x) => CommonModel.fromJson(x))),
    localNavList: List<CommonModel>.from(json["localNavList"].map((x) => CommonModel.fromJson(x))),
    gridNav: GridNavModel.fromJson(json["gridNav"]),
    subNavList: List<CommonModel>.from(json["subNavList"].map((x) => CommonModel.fromJson(x))),
    salesBox: SalesBoxModel.fromJson(json["salesBox"]),
  );

  Map<String, dynamic> toJson() => {
    "config": config.toJson(),
    "bannerList": List<dynamic>.from(bannerList.map((x) => x.toJson())),
    "localNavList": List<dynamic>.from(localNavList.map((x) => x.toJson())),
    "gridNav": gridNav.toJson(),
    "subNavList": List<dynamic>.from(subNavList.map((x) => x.toJson())),
    "salesBox": salesBox.toJson(),
  };
}