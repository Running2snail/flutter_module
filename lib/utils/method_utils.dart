import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

enum HudType {
  success,
  error,
  info,
}

class MethodChannelUtils {

  static const MethodChannel methodChannel = MethodChannel("plugins.flutter.io/flutterNative");

  static Future<String> getBaseUrl() async {
    final String result = await methodChannel.invokeMethod("getBaseUrl");
    return result ?? "https://app.ishangjie.com";
  }

  static Future<Map> _getAppInfo(dynamic map) async {
    final Map<dynamic, dynamic> result = await methodChannel.invokeMethod("getAppInfo", {"data": map, "needToken": true});
    var newMap = Map.from(result.map((key, value) {
      return MapEntry(key.toString(), value);
    }));

    if (kDebugMode) {
      print('---api-request--->header---->$result');
    }
    return newMap;
  }

  static showHud(String text, HudType type) async {
    await methodChannel.invokeMethod("showHud", {"text": text, "type": type.index});
  }
  
  static Future<Bool> checkLogInStatus() async {
    return await methodChannel.invokeMethod("checkLogInStatus");
  }

  static openWebView(String url) async {
    await methodChannel.invokeMethod("openWebView", {"url": url});
  }

  static goBack() async {
    await methodChannel.invokeMethod("goBack");
  }

  static handleResponse(Map parameters) async {
    await methodChannel.invokeMethod("handleResponse", parameters);
  }

}


