import 'package:flutter/material.dart';
import 'package:shop_app/screens/Orders_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        AppBar(
          title: Text("Hello"),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text("Shop"),
          onTap: (){
            Navigator.of(context).pushReplacementNamed("/");
          },
        ),
        Divider(),
        ListTile(leading: Icon(Icons.account_box),title: Text("Orders"),onTap: (){
          Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
        },),
      ]),
    );
  }
}
