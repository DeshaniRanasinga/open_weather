import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather/app/common/common.dart';
import 'package:open_weather/app/model/city_model.dart';
import 'package:open_weather/app/services/services.dart';
import 'package:open_weather/app/state/state_manager.dart';
import 'package:open_weather/app/ui/widget/home_tile_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePagePageState createState() => _HomePagePageState();
}

class _HomePagePageState extends State<HomePage>  with SingleTickerProviderStateMixin{
  final int time = 5;

  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if(!mounted) return;
      context.refresh(cityDetailsStateFuture);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: textLabel('Open Weather', 24.0, Colors.white, FontWeight.w700),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer(builder: ((context, T Function<T>(ProviderBase<Object, T> provider) watch, child) {
            CityModel _city = watch(cityDetailsStateFuture)?.data?.value;
            return Expanded(
                child: _city == null
              ? Center(
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    child: CircularProgressIndicator(),
                  ),
                )
              : ListView.builder(
                    itemCount: watch(cityDetailsStateFuture).data?.value?.list?.length??0,
                    itemBuilder: (context, index){
                      return Column(
                        children: [
                          InkWell(
                           splashColor: Colors.grey,
                            child: HomeTileView(
                              weight: w,
                              cityName: _city.list.elementAt(index).cityName.toString(),
                              cityTemp: _city.list.elementAt(index).temp.toString(),
                              cityStatus: _city.list.elementAt(index).status.toString(),
                            ),
                            onTap: (){
                              fetchWeatherDetails(
                                  watch(cityDetailsStateFuture).data.value.list.elementAt(index).cityCode.toString(), context
                              );
                            },
                          )
                        ],
                      );
                    }
                )
            );
          }),)


        ],
      )
    );
  }
}

