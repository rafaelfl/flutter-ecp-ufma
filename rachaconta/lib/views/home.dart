import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomeView> {
  int _maxPlayers = 0;
  int _luckyGuys = 0;
  double _totalPrice = 0.0;
  int _percent = 0;
  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              title: const Text('Racha Conta'),
            ),
            body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  Text("R\$ Valor do Consumo",
                      style: new TextStyle(fontSize: 20.0)),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                        borderSide: new BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) async {
                      setState(() {
                        _totalPrice = double.tryParse(value);
                      });
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 25)),
                  Text("Porcentagem sorteada",
                      style: new TextStyle(fontSize: 20.0)),
                  Slider(
                    min: 0.0,
                    max: 100.0,
                    divisions: 100,
                    label: _percent.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _percent = value.round();
                      });
                    },
                    value: _percent.toDouble(),
                  ),
                  Padding(padding: EdgeInsets.only(top: 25)),
                  Text("Número de sorteados: $_luckyGuys",
                      style: new TextStyle(fontSize: 20.0)),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          color: Color(0xff0091EA),
                          splashColor: Colors.grey,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          onPressed: () {
                            setState(() {
                              _luckyGuys--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RaisedButton(
                          color: Color(0xff0091EA),
                          splashColor: Colors.grey,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          onPressed: () {
                            setState(() {
                              _luckyGuys++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 25)),
                  Text("Número de Participantes: $_maxPlayers",
                      style: new TextStyle(fontSize: 20.0)),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          color: Color(0xff0091EA),
                          splashColor: Colors.grey,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          onPressed: () {
                            setState(() {
                              _maxPlayers--;
                            });
                          },
                        ),
                        SizedBox(width: 10),
                        RaisedButton(
                          color: Color(0xff0091EA),
                          splashColor: Colors.grey,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          onPressed: () {
                            setState(() {
                              _maxPlayers++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 25)),
                  RaisedButton(
                      color: Color(0xff0091EA),
                      splashColor: Colors.grey,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      textColor: Colors.white,
                      onPressed: () {
                        // Criando o objeto que será enviado
                        Navigator.pushNamed(context, '/result', arguments: {
                          "percent": _percent,
                          "totalPrice": _totalPrice,
                          "maxPlayers": _maxPlayers,
                          "luckyguys": _luckyGuys
                        });
                      },
                      child: Text('Sortear', style: TextStyle(fontSize: 20))),
                ]))));
  }
}
