import 'package:flutter/material.dart';
import 'package:ufmaMobileClone/core/components/panels/balance.dart';
import 'components/my_tab_icon.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          drawer: Drawer(
            child: ListView(children: [
              DrawerHeader(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn.iconscout.com/icon/free/png-512/laptop-user-1-1179329.png'),
                  ),
                  decoration: BoxDecoration(color: Color(0xff732128))),
              ListTile(
                title: Text("Opção 1"),
                onTap: () => true,
              ),
              ListTile(
                title: Text("Opção 2"),
                onTap: () => true,
              ),
              ListTile(
                title: Text("Opção 3"),
                onTap: () => true,
              ),
            ]),
          ),
          appBar: AppBar(
              title: Text("Restaurante"),
              backgroundColor: Color(0xff732128),
              bottom: TabBar(
                tabs: [
                  MyTabIcon(myIcon: Icons.attach_money, myText: "SALDO"),
                  MyTabIcon(myIcon: Icons.wb_sunny, myText: "ALMOÇO"),
                  MyTabIcon(myIcon: Icons.brightness_3, myText: "JANTAR"),
                ],
                indicatorColor: Colors.white,
                indicatorWeight: 5,
                labelPadding: EdgeInsets.only(bottom: 5),
              )),
          body:
              TabBarView(children: [BalancePanel(), Container(), Container()])),
    );
  }
}
