import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather/app/model/city_model.dart';
import 'package:open_weather/app/state/state_manager.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, T Function<T>(ProviderBase<Object, T> provider) watch) {
    AsyncValue<CityModel> cityDetails = watch(cityDetailsStateFuture);
    return Scaffold(
      appBar: AppBar(
      ),
      body: cityDetails.when(
          data: (cityDetails){
            return ListView.builder(
                itemCount: cityDetails.list.length??0,
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      Text('k -- ${cityDetails.list.elementAt(index).cityName}')
                    ],
                  );
                }
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (err, stack) => Center(
            child: Text('${err.toString()}'),
          )
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

// class _HomePageState extends State<HomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//           ],
//         ),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
