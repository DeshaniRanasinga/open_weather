import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:open_weather/app/model/city_model.dart';
import 'package:http/http.dart' as http;
import 'package:open_weather/app/model/weather_model.dart';
import 'package:open_weather/app/util/api/util_api.dart';


Future<CityModel> fetchCityDetails() async {
  http.Response response = await http.get(API_DETAILS_URL);
  if (response.statusCode != 200) return null;

  final items = jsonDecode(response.body);
  print('ITEMS:--> ${items.toString()}');
  return CityModel.fromJson(items);
}


Future<WeatherModel> fetchWeatherDetails(String cityCode) async {
  final response = await http.get
    ('https://api.openweathermap.org/data/2.5/weather?id='+ cityCode.toString() +'&appid=b523d1feed605d845b1e5f9967af91ad');

  if (response.statusCode != 200) return null;

  final items = jsonDecode(response.body);
  WeatherModel weatherModel = WeatherModel.fromJson(json.decode(response.body));
  print('WEATHER:--> ${response.body}');

  return WeatherModel.fromJson(items);
}

