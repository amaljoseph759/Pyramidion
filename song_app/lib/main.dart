import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pyramidion/bottomnavigationbar.dart';

void main() async {
  // Initialize GetStorage
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //primaryColor: Colors.green,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: BottomNavBarScreen(),
    );
  }
}
