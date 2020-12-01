import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BalancePanel extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<BalancePanel> {
  String url = 'http://randomuser.me/api/';

  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new RaisedButton(
      child: new Text('Make Request'),
      onPressed: makeRequest,
    ));
  }
}
