import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather/app/state/state_manager.dart';


class CounterPage extends ConsumerWidget{
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    //watch the new counterStateProvider1
    final value = watch(counterStateProvider1);
    return ProviderListener(
        onChange: (context, countState){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Value is ${value.state}'))
          );
        },
        provider: counterStateProvider1,
        child: Scaffold(
            appBar: AppBar(
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      //read the count.state
                      child: Text('value: ${value.state < 0 ? 0 : value.state}',
                          style: Theme.of(context).textTheme.headline4),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            // context.read(counterStateProvider1).state++;
                            value.state++;
                          },
                          child: Icon(Icons.add),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            if(value.state <= 0){
                              value.state = 0;
                            }else{
                              // context.read(counterStateProvider1).state--;
                              value.state--;
                            }
                          },
                          child: Icon(Icons.remove),
                        )
                      ],
                    )
                  ],
                ),
              ],
            )
        ));
  }
  
}