import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart.dart';
import 'package:shopping_app/widgets/free_delivery_card.dart';
import 'package:shopping_app/widgets/cart_item.dart' as CartItemWidget;

class CartScreen extends StatelessWidget {
  static const routeName = "/cart-screen";
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      bottomNavigationBar: Card(
        elevation: 10,
        margin: const EdgeInsets.all(0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Chip(
                    backgroundColor: Colors.blueAccent,
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    label: Text(
                      "\$ ${cart.totalAmount}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
              RaisedButton(
                onPressed: () {},
                color: Colors.amber,
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    "Place Order",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          FreeDeliveyCard(),
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  return CartItemWidget.CartItem(
                    id: cart.items.values.toList()[index].id,
                    price: cart.items.values.toList()[index].price,
                    quantity: cart.items.values.toList()[index].quantity,
                    title: cart.items.values.toList()[index].title,
                    imageUrl: cart.items.values.toList()[index].id,
                  );
                }),
          )
        ],
      ),
    );
  }
}
