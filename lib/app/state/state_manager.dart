
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather/app/model/city_model.dart';
import 'package:open_weather/app/model/weather_model.dart';
import 'package:open_weather/app/services/services.dart';


final cityDetailsStateFuture = FutureProvider<CityModel>((ref) async {
  return fetchCityDetails();
});

final weatherDetailsStateFuture = FutureProvider.family<WeatherModel, String>((ref, cityId) async {
  return fetchWeatherDetails(cityId);
});

final counterStateProvider = StateProvider<int>((ref){
  return 10;
});




final helloWorldProvider = Provider((_) => 'Hello World');


final counterProvider = StateProvider((ref) => 0);



class Counter extends StateNotifier<int> {
  Counter(): super(0);

  void increment() => state++;
}

final counterProvider2 = StateNotifierProvider((ref) => Counter());


/*
counter screen
 */
final valueProvide = Provider<int>((ref){
  return 28;
});

/*
StateProvider

So far we managed to read a provider's value inside a widget.
But Provider itself doesn't give us any capability to change its value.
For that we need to create a StateProvider:
 */

final counterStateProvider1 = StateProvider<int>((ref) {
  return 0;
});



// final userProvider = FutureProvider.autoDispose.family<User, int>((ref, userId) async{
//   return fetchUser(userId);
// });

//fetchWeatherDetails
















