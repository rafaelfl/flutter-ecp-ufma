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

  void _incrementMaxPlayers() {
    setState(() {
      _maxPlayers++;
    });
  }

  void _decrementMaxPlayers() {
    setState(() {
      _maxPlayers--;
    });
  }

  void _incrementLuckyGuys() {
    setState(() {
      _luckyGuys++;
    });
  }

  void _decrementLuckyGuys() {
    setState(() {
      _luckyGuys--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      TextField(
        keyboardType: TextInputType.number,
        onChanged: (value) async {
          setState(() {
            _totalPrice = double.tryParse(value);
          });
        },
      ),
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
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("+"),
              onPressed: () {
                setState(() {
                  _luckyGuys++;
                });
              },
            ),
            SizedBox(width: 5),
            RaisedButton(
              child: Text("-"),
              onPressed: () {
                setState(() {
                  _luckyGuys--;
                });
              },
            ),
          ],
        ),
      ),
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("+"),
              onPressed: () {
                setState(() {
                  _maxPlayers++;
                });
              },
            ),
            SizedBox(width: 5),
            RaisedButton(
              child: Text("-"),
              onPressed: () {
                setState(() {
                  _maxPlayers--;
                });
              },
            ),
          ],
        ),
      ),
      Text('Percent: $_percent'),
      Text('Total Price: $_totalPrice'),
      Text('Max Players: $_maxPlayers'),
      Text('Lucky Guys: $_luckyGuys'),
      RaisedButton(
          onPressed: (){
                // Criando o objeto que será enviado
              Navigator.pushNamed(context, '/result', arguments: {
                  "percent": _percent,
                  "totalPrice": _totalPrice,
                  "maxPlayers": _maxPlayers,
                  "luckyguys": _luckyGuys
              });},
          child: Text(
            'Sortear',
            style: TextStyle(fontSize: 20)
          )),
    ])));
  }
}
