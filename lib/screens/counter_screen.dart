import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/counter_provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final counterProvider =
        Provider.of<CounterProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 2), (timer) {
      counterProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final counterProvider =
        Provider.of<CounterProvider>(context, listen: false);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child:
              Consumer<CounterProvider>(builder: (context, value, child) {
            print("Only this builds");
            return Text(
              value.count.toString(),
              style: const TextStyle(fontSize: 24),
            );
          })),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            counterProvider.setCount();
          },
          child: const Icon(Icons.add)),
    );
  }
}
