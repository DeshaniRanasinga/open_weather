import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather/app/state/state_manager.dart';

class IncreasePage extends StatefulWidget {
  @override
  _IncreasePageState createState() => _IncreasePageState();
}

class _IncreasePageState extends State<IncreasePage>{
  AnimationController _controller;
  final int time = 60;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            // onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: ListView(
            children: [
              Consumer(
                  builder: (_, ScopedReader watch, __){
                    final value = watch(helloWorldProvider);
                    return Text(
                        'value = ${value.toString()}',
                      style: Theme.of(context).textTheme.headline5,
                    );
                  }
              ),
              SizedBox(
                height: 10.0,
              ),

              Consumer(
                  builder: (_, watch, __){
                    final value = watch(counterProvider);
                    return ElevatedButton(
                        onPressed: () => value.state++,
                        child: Text('${value.state}')
                    );
                  }
              ),

              Consumer(
                  builder: (_, watch, __){
                    StateController<int> value = watch(counterProvider);
                    return ElevatedButton(
                        onPressed: () => value.state++,
                        child: Text('${value.state}')
                    );
                  }
              ),



              // Consumer(
              //     builder: (_, ScopedReader watch, __){
              //       int value2 = watch(counterProvider).state;
              //       return ElevatedButton(
              //           // onPressed: () => ++,
              //           child: Text('${value2}')
              //       );
              //     }
              // ),

            ],
        ));
  }
}
