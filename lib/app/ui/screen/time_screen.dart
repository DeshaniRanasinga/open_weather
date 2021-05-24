import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather/app/state/state_manager.dart';
import 'package:intl/intl.dart';

class TimePage extends ConsumerWidget{
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final currentTime = watch(clockProvider);
    // format the time as `hh:mm:ss`
    final timeFormatted = DateFormat.Hms().format(currentTime);
    // final timeFormatted = DateFormat.s().format(currentTime);
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text(
          timeFormatted,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }

}