import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  CityModel({
    this.list,
  });

  List<ListElement> list;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    list: List<ListElement>.from(json["List"].map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "List": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class ListElement {
  ListElement({
    this.cityCode,
    this.cityName,
    this.temp,
    this.status,
  });

  String cityCode;
  String cityName;
  String temp;
  String status;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    cityCode: json["CityCode"] == null ? '' : json["CityCode"],
    cityName: json["CityName"] == null ? '' : json["CityName"],
    temp: json["Temp"] == null ? '' : json["Temp"],
    status: json["Status"] == null ? '' : json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "CityCode": cityCode == null ? '' : cityCode,
    "CityName": cityName == null ? '' : cityName,
    "Temp": temp == null ? '' : temp,
    "Status": status == null ? '' : status,
  };
}
