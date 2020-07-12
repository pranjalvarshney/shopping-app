import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cart-screen";
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      body: Column(
        children: <Widget>[
          Card(
              margin: const EdgeInsets.all(8),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.local_shipping,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Free delivery ",
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Text(
                      "on orders above \$ 9.99",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Text("Total"),
                  Text(cart.totalAmount.toString())
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
