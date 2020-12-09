import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rachaconta/utils/draw.dart';

class ResultView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    Draw d1 = new Draw(arguments["totalPrice"], arguments["maxPlayers"],
        arguments["percent"], arguments["luckyguys"]);

    var result = d1.roll();
    print(result);
    final List<int> colorCodes = <int>[
      900,
      800,
      700,
      600,
      500,
      400,
      300,
      200,
      100
    ];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Resultado'),
          ),
          body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text("Direção da Mesa", style: new TextStyle(fontSize: 20.0)),
                  Container(
                    child: arguments["direction"] == 'Esquerda'
                        ? Image.asset('lib/assets/leftarrow.png',
                            width: 200.0, height: 100.0)
                        : Image.asset('lib/assets/rightarrow.png',
                            width: 200.0, height: 100.0),
                    padding: EdgeInsets.all(29),
                  ),
                  SizedBox(
                      height: 100.0,
                      child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: result["choosens"].length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 50,
                              color: Colors.blue[colorCodes[index]],
                              child: Center(
                                  child: Text('${result["choosens"][index]}',
                                      style: new TextStyle(
                                          fontSize: 15, color: Colors.white))),
                            );
                          })),
                  Padding(padding: EdgeInsets.only(top: 25)),
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sorteados: R\$",
                          style: new TextStyle(fontSize: 20.0)),
                      Text(result["whopay"][1].toString(),
                          style: new TextStyle(fontSize: 20.0))
                    ],
                  )),
                  Padding(padding: EdgeInsets.only(top: 25)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Resto: R\$ ", style: new TextStyle(fontSize: 20.0)),
                      Text(result["whopay"][0].toString(),
                          style: new TextStyle(fontSize: 20.0))
                    ],
                  )
                ],
              ))),
      debugShowCheckedModeBanner: false,
    );
  }
}
