
import 'package:flutter/material.dart';
import 'package:test/HomePage.dart';
import 'HomePage.dart';  // Import HomePage



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false, // Ẩn banner debug
      home: HomePage(), // Sử dụng HomePage ở đây
    );
  }
}
