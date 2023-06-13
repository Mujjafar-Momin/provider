import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/slider_multiprovider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MultiProvider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderMultiProvider>(builder: (context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  value.setValue(val);
                });
          }),

          Consumer<SliderMultiProvider>(
            builder: (context,value,child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height:100,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value),
                      ),
                      child:const Text("Container 1"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.value),
                      ),
                      child:const Text("Container 2"),
                    ),
                  )
                ],
              );
            }
          ),
        ],
      ),
    );
  }
}
