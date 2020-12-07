import 'package:flutter/material.dart';
import './views/details.dart';
import './views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context){
        return MaterialApp(
                title: 'Pokedex',
                theme: ThemeData(primarySwatch:  Colors.blue),
                routes: {
                    '/': (context)=>MyHomePage(title: 'Home'),
                    '/details': (context)=>Details(title: 'Detalhes'),
                },
        );
    }
}


