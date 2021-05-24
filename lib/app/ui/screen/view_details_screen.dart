import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather/app/common/common.dart';
import 'package:open_weather/app/state/state_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather/app/common/common.dart';
import 'package:open_weather/app/state/state_manager.dart';

class ViewDetailsPage extends ConsumerWidget {
  final String cityCode;

  ViewDetailsPage({
    this.cityCode
  });

  final int time = 5;

  Timer _timer;

  // @override
  // void initState() {
  //   super.initState();
  //   _timer = Timer.periodic(Duration(seconds: 5), (timer) {
  //     if(!mounted) return;
  //     context.refresh(cityDetailsStateFuture);
  //   });
  // }

  // @override
  // void dispose() {
  //   _timer?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final value = watch(weatherDetailsStateFuture(cityCode));
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
          // onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            height: 200.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                capitalLatterTextLabel('${value?.data?.value?.name??''}', 42.0, Colors.black, FontWeight.w700),
                textLabel('${value?.data?.data?.value?.id??''}', 10.0, Colors.black, null)
              ],
            ),
          ),
          Container(
            // alignment: Alignment.center,
            height: 200.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: containerView(
                      '${value?.data?.value?.weather?.elementAt(0)?.description??''}',
                      28.0,
                      FontWeight.w500
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: containerView(
                      '${value?.data?.value?.main?.temp??''}' + ' \u2109',
                      //  widget.cityCode.main.temp.toString() + ' \u2109',
                      14.0,
                      FontWeight.w700
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

