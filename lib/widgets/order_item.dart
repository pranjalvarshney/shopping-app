import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/providers/cart.dart';

import 'package:shopping_app/providers/orders.dart' as pv;

class OrderItem extends StatefulWidget {
  final pv.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _orderExpanaded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          InkWell(
            child: ListTile(
              title: Text(widget.order.id),
              subtitle: Text(
                  DateFormat.yMMMMd().add_jm().format(widget.order.dateTime)),
              trailing: Chip(
                label: Text("\$ ${widget.order.amount.toStringAsFixed(2)}"),
              ),
            ),
            onTap: () {
              setState(() {
                _orderExpanaded = !_orderExpanaded;
              });
            },
          ),
          _orderExpanaded
              ? Container(
                  height: min(
                      widget.order.orderedProducts.length * 55.0 + 100.0,
                      220.0),
                  child: ListView.builder(
                      itemCount: widget.order.orderedProducts.length,
                      itemBuilder: (ctc, index) {
                        return Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Text(
                                      widget.order.orderedProducts[index].title,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Qty - ${widget.order.orderedProducts[index].quantity.toString()} X  \$ ${widget.order.orderedProducts[index].price.toStringAsFixed(2)}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "Total - \$ ${widget.order.orderedProducts[index].price * widget.order.orderedProducts[index].quantity}",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  trailing: Image.network(
                                    "https://thefinanser.com/wp-content/uploads/2019/10/Product.png",
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 80,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }))
              : Container()
        ],
      ),
    );
  }
}
