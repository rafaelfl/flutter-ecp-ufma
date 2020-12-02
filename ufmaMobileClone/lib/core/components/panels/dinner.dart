import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../utils/Meal.dart';

Future<Meal> fetchDinner() async {
  final response = await http.get('http://10.0.3.2:3000/dinner');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Meal.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Erro ao recuperar almoço');
  }
}

class DinnerPanel extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<DinnerPanel> {
  Future<Meal> futureDinner;

  @override
  void initState() {
    super.initState();
    futureDinner = fetchDinner();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF0ECF1),
      child: FutureBuilder<Meal>(
        future: futureDinner,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              padding: const EdgeInsets.all(8),
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  height: 50,
                  child: ListTile(
                      title: Text("Principal"),
                      subtitle: Text(snapshot.data.principal)),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 20),
                    height: 50,
                    child: ListTile(
                        title: Text("Vegetariana"),
                        subtitle: Text(snapshot.data.vegan))),
                Container(
                    margin: EdgeInsets.only(bottom: 20),
                    height: 50,
                    child: ListTile(
                        title: Text("Cereal"),
                        subtitle: Text(snapshot.data.cereal))),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  height: 50,
                  child: ListTile(
                      title: Text("Vegetais"),
                      subtitle: Text(snapshot.data.vegetables)),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 20),
                    height: 50,
                    child: ListTile(
                        title: Text("Sobremesa"),
                        subtitle: Text(snapshot.data.dessert))),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  height: 50,
                  child: ListTile(
                      title: Text("Horário"),
                      subtitle: Text(snapshot.data.schedule)),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
