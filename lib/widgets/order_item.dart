import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:shopping_app/providers/orders.dart' as pv;

class OrderItem extends StatelessWidget {
  final pv.OrderItem order;

  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(order.id),
            subtitle: Text(DateFormat.yMMMMd().add_jm().format(order.dateTime)),
            trailing: Chip(
              label: Text("\$ ${order.amount}"),
            ),
          )
        ],
      ),
    );
  }
}
