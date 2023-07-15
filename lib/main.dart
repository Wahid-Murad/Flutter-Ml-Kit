import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_recognition/binder/all_controller_binder.dart';
import 'package:text_recognition/screen/home_screen.dart';

void main() {
  AllControllerBinder().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
