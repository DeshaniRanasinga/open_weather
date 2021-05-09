
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather/app/model/city_model.dart';
import 'package:open_weather/app/services/city_service.dart';

final cityDetailsStateFuture = FutureProvider<CityModel>((ref) async {
  return fetchCityDetails();
});




