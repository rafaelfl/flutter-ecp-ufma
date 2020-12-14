import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Minimalist Notes',
        theme: ThemeData(primarySwatch: Colors.yellow),
        routes: {
          '/': (context) => HomeView(),
          '/detail': (context) => DetailView(),
        },
        initialRoute: '/');
  }
}
