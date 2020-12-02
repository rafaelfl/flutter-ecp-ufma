import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ufmaMobileClone/core/components/utils/Tag.dart';
import 'package:ufmaMobileClone/core/components/utils/action_button.dart';
import 'package:http/http.dart' as http;

class BalancePanel extends StatefulWidget {
  @override
  _BalancePanelState createState() => _BalancePanelState();
}

class _BalancePanelState extends State<BalancePanel> {
  double currentBalance = 0.0;

  // Lista com ultimas transações
  List<Tag> list = List();
  // Indica carregamento
  var isLoading = false;

  // Faz o fetch dos elementos
  void fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get("http://10.0.3.2:3000/history");
    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => new Tag.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Erro ao carregar transações');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void addBalance() {
    setState(() {
      this.currentBalance += 10.0;
    });
  }

  void resetBalance() {
    setState(() {
      this.currentBalance = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF0ECF1),
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("R\$ ${this.currentBalance}",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400)),
            SizedBox(height: 35),
            ActionButton(
              text: "Adicionar saldo",
              onPressed: () => this.addBalance(),
            ),
            SizedBox(height: 10),
            ActionButton(
              text: "Torrar saldo 🍞",
              onPressed: () => this.resetBalance(),
            ),
            SizedBox(height: 35),
            Text("Últimas transações",
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 153, 153, 153))),
            SizedBox(height: 25),
            Expanded(
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Text(
                              '${list[index].value}',
                              style: TextStyle(fontSize: 16),
                            ),
                            title: Text('${list[index].date}',
                                style: TextStyle(fontSize: 16)),
                            trailing: Text('${list[index].type}',
                                style: (list[index].type == 'Débito')
                                    ? TextStyle(
                                        fontSize: 16, color: Color(0xff6B1828))
                                    : TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff8A9984))),
                          );
                        },
                      ))
          ],
        ),
      ),
    );
  }
}
