import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/counter_provider.dart';
import 'package:provider_example/provider/slider_multiprovider.dart';
import 'package:provider_example/screens/counter_screen.dart';
import 'package:provider_example/screens/slider_multiprovider_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>CounterProvider()),
        ChangeNotifierProvider(create: (_)=>SliderMultiProvider())
      ],
       child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const SliderScreen(),
    ));
  }
}
