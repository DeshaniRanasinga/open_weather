
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather/app/model/city_model.dart';
import 'package:open_weather/app/model/weather_model.dart';
import 'package:open_weather/app/services/services.dart';


final cityDetailsStateFuture = FutureProvider<CityModel>((ref) async {
  return fetchCityDetails();
});


final weatherDetailsStateFuture = FutureProvider<WeatherModel>((ref) async {
  String cityCode;
  return fetchWeatherDetails(cityCode);
});




final counterStateProvider = StateProvider<int>((ref){
  return 10;
});




final helloWorldProvider = Provider((_) => 'Hello World');


final counterProvider = StateProvider((ref) => 0);

// final userProvider = FutureProvider.autoDispose.family<User, int>((ref, userId) async{
//   return fetchUser(userId);
// });














