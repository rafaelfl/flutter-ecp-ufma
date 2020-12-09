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
          body: Center(
              child: Column(
            children: [
              Container(
                child: arguments["direction"] == 'Esquerda'
                    ? Image.asset('lib/assets/leftarrow.png',
                        width: 150.0, height: 50.0)
                    : Image.asset('lib/assets/rightarrow.png',
                        width: 150.0, height: 50.0),
                color: Color(0xff4531B0),
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
                          color: Colors.amber[colorCodes[index]],
                          child: Center(
                              child: Text('${result["choosens"][index]}')),
                        );
                      })),
              Row(
                children: [
                  Text("Sorteados: "),
                  Text(result["whopay"][1].toString())
                ],
              ),
              Row(
                children: [
                  Text("Resto: "),
                  Text(result["whopay"][0].toString())
                ],
              )
            ],
          ))),
      debugShowCheckedModeBanner: false,
    );
  }
}
