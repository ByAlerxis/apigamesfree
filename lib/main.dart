import 'package:flutter/material.dart';
import 'package:practicaapi/src/pages/home_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Free Games by Alerxis',
      home: HomePage(),
    );
  }
}
