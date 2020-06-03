
import 'package:flutter/material.dart';

import 'package:provider/provider.dart' ;
import 'package:shop_app/widgets/app_drawer.dart';
import '../providers/Orders.dart' show Orders;
import '../widgets/OrderItem.dart';

class OrdersScreen extends StatelessWidget {

  static String  routeName = "/Order";

  @override
  Widget build(BuildContext context) {

    final ordersData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(title:Text("Your Orders")),
      body: ListView.builder(itemCount: ordersData.orders.length,
      itemBuilder: (ctx, i){return OrderItem(ordersData.orders[i]);} ),
      drawer: AppDrawer(),
    );
  }
}