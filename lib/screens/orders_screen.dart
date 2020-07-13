import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/orders.dart';
import 'package:shopping_app/widgets/main_drawer.dart';
import 'package:shopping_app/widgets/order_item.dart' as widget;

class OrdersScreen extends StatelessWidget {
  static const routeName = "/order-screen";
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("My orders"),
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (context, index) {
            return widget.OrderItem(orderData.orders[index]);
          }),
    );
  }
}
