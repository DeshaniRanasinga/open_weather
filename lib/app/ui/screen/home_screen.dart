import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather/app/common/common.dart';
import 'package:open_weather/app/model/city_model.dart';
import 'package:open_weather/app/state/state_manager.dart';
import 'package:open_weather/app/ui/screen/increse_screen.dart';
import 'package:open_weather/app/ui/screen/view_details_screen.dart';
import 'package:open_weather/app/ui/widget/home_tile_view.dart';

import 'counter_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePagePageState createState() => _HomePagePageState();
}

class _HomePagePageState extends State<HomePage>  with SingleTickerProviderStateMixin{
  final int time = 5;

  Timer _timer;
  CityModel city;

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
        actions: [
          IconButton(
              icon: Icon(Icons.adb),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => IncreasePage()
                  ),
                );
              }),
          IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CounterPage()
                  ),
                );
              }),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer(
            builder: ((context, T Function<T>(ProviderBase<Object, T> provider) watch, child) {
            CityModel _city = watch(cityDetailsStateFuture)?.data?.value;
            print(_city);
            // debugger();
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewDetailsPage(
                                        cityCode: _city.list.elementAt(index).cityCode.toString()
                                    )
                                ),
                              );
                            },
                          ),

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

