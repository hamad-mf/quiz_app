import 'package:flutter/ma';
import 'package:quiz_app/View/Home%20Screen/home_screen.dart';

import 'package:quiz_app/View/Questions%20Screen/questions_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
    );
  }
}
