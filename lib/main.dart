import 'package:flutter/material.dart';
import 'package:practicaapi/src/pages/home_pages.dart';
import 'package:practicaapi/src/pages/console_page.dart';
import 'package:practicaapi/src/pages/views_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Free Games by Alerxis',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_)=> HomePage(),
        '/views':(_) => ViewsGames(),
        '/console': (_) => ConsolePages(),
      },
    );
  }
}
