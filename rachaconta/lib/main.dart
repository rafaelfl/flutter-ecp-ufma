import 'package:flutter/material.dart';
import 'package:rachaconta/views/home.dart';
import 'package:rachaconta/views/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // Remove a flag de debug
        title: 'Racha Conta',
        theme: ThemeData(primaryColor: Colors.orange),
        routes: {
          '/': (context) => HomeView(),
          '/result': (context) => ResultView()
        });
  }
}
