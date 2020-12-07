import 'package:flutter/material.dart';
import './views/telainicial.dart';
import './views/prato.dart';
import './views/ingrediente.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context){
        return MaterialApp(
                title: 'Alimentacao',
                theme: ThemeData(primarySwatch:  Colors.blue),
                routes: {
                    '/': (context)=>TelaInicial(title: 'Home'),
                    '/prato': (context)=>Prato(title: 'Detalhes'),
                    '/ingrediente': (context)=>Ingrediente(title: 'Detalhes'),
                },
        );
    }
}
