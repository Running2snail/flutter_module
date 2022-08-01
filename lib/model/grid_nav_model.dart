import 'common_model.dart';

class GridNavModel {
  GridNavModel({
    required this.hotel,
    required this.flight,
    required this.travel,
  });

  Hotel hotel;
  Flight flight;
  Travel travel;

  factory GridNavModel.fromJson(Map<String, dynamic> json) => GridNavModel(
    hotel: Hotel.fromJson(json["hotel"]),
    flight: Flight.fromJson(json["flight"]),
    travel: Travel.fromJson(json["travel"]),
  );

  Map<String, dynamic> toJson() => {
    "hotel": hotel.toJson(),
    "flight": flight.toJson(),
    "travel": travel.toJson(),
  };
}

class Hotel {
  Hotel({
    required this.startColor,
    required this.endColor,
    required this.mainItem,
    required this.item1,
    required this.item2,
    required this.item3,
    required this.item4,
  });

  String startColor;
  String endColor;
  CommonModel mainItem;
  CommonModel item1;
  CommonModel item2;
  CommonModel item3;
  CommonModel item4;

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
    startColor: json["startColor"],
    endColor: json["endColor"],
    mainItem: CommonModel.fromJson(json["mainItem"]),
    item1: CommonModel.fromJson(json["item1"]),
    item2: CommonModel.fromJson(json["item2"]),
    item3: CommonModel.fromJson(json["item3"]),
    item4: CommonModel.fromJson(json["item4"]),
  );

  Map<String, dynamic> toJson() => {
    "startColor": startColor,
    "endColor": endColor,
    "mainItem": mainItem.toJson(),
    "item1": item1.toJson(),
    "item2": item2.toJson(),
    "item3": item3.toJson(),
    "item4": item4.toJson(),
  };
}

class Travel {
  Travel({
    required this.startColor,
    required this.endColor,
    required this.mainItem,
    required this.item1,
    required this.item2,
    required this.item3,
    required this.item4,
  });

  String startColor;
  String endColor;
  CommonModel mainItem;
  CommonModel item1;
  CommonModel item2;
  CommonModel item3;
  CommonModel item4;

  factory Travel.fromJson(Map<String, dynamic> json) => Travel(
    startColor: json["startColor"],
    endColor: json["endColor"],
    mainItem: CommonModel.fromJson(json["mainItem"]),
    item1: CommonModel.fromJson(json["item1"]),
    item2: CommonModel.fromJson(json["item2"]),
    item3: CommonModel.fromJson(json["item3"]),
    item4: CommonModel.fromJson(json["item4"]),
  );

  Map<String, dynamic> toJson() => {
    "startColor": startColor,
    "endColor": endColor,
    "mainItem": mainItem.toJson(),
    "item1": item1.toJson(),
    "item2": item2.toJson(),
    "item3": item3.toJson(),
    "item4": item4.toJson(),
  };
}


class Flight {
  Flight({
    required this.startColor,
    required this.endColor,
    required this.mainItem,
    required this.item1,
    required this.item2,
    required this.item3,
    required this.item4,
  });

  String startColor;
  String endColor;
  CommonModel mainItem;
  CommonModel item1;
  CommonModel item2;
  CommonModel item3;
  CommonModel item4;

  factory Flight.fromJson(Map<String, dynamic> json) => Flight(
    startColor: json["startColor"],
    endColor: json["endColor"],
    mainItem: CommonModel.fromJson(json["mainItem"]),
    item1: CommonModel.fromJson(json["item1"]),
    item2: CommonModel.fromJson(json["item2"]),
    item3: CommonModel.fromJson(json["item3"]),
    item4: CommonModel.fromJson(json["item4"]),
  );

  Map<String, dynamic> toJson() => {
    "startColor": startColor,
    "endColor": endColor,
    "mainItem": mainItem.toJson(),
    "item1": item1.toJson(),
    "item2": item2.toJson(),
    "item3": item3.toJson(),
    "item4": item4.toJson(),
  };
}

