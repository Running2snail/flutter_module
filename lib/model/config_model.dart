
class ConfigModel {
  ConfigModel({
    required this.searchUrl,
  });

  String searchUrl;

  factory ConfigModel.fromJson(Map<String, dynamic> json) => ConfigModel(
    searchUrl: json["searchUrl"],
  );

  Map<String, dynamic> toJson() => {
    "searchUrl": searchUrl,
  };
}