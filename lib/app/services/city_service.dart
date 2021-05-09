import 'dart:convert';
import 'package:open_weather/app/model/city_model.dart';
import 'package:http/http.dart' as http;
import 'package:open_weather/app/util/api/util_api.dart';


Future<CityModel> fetchCityDetails() async {
  http.Response response = await http.get(API_DETAILS_URL);
  if (response.statusCode != 200) return null;

  final items = jsonDecode(response.body);
  CityModel cityModel = CityModel.fromJson(json.decode(response.body));

  print('City Model:--> ${cityModel.list.elementAt(0).cityCode}');
  return CityModel.fromJson(items);
}
