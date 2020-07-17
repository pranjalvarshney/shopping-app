import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart.dart';
import 'package:shopping_app/providers/orders.dart';
import 'package:shopping_app/screens/orders_screen.dart';
import 'package:shopping_app/screens/products_overview_screen.dart';
import 'package:shopping_app/widgets/free_delivery_card.dart';
import 'package:shopping_app/widgets/cart_item.dart' as CartItemWidget;

class CartScreen extends StatefulWidget {
  static const routeName = "/cart-screen";

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    bool _isLoading = false;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      bottomNavigationBar: Card(
        elevation: 10,
        margin: const EdgeInsets.all(0),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Total",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "\$ ${cart.totalAmount.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: RaisedButton(
                  onPressed: (cart.totalAmount == 0 || _isLoading)
                      ? null
                      : () async {
                          setState(() {
                            _isLoading = true;
                          });
                          try {
                            await Provider.of<Orders>(context, listen: false)
                                .addOrder(cart.items.values.toList(),
                                    cart.totalAmount);
                            cart.clearCart();
                            Future.delayed(Duration(seconds: 2));
                            Navigator.of(context)
                                .pushReplacementNamed(OrdersScreen.routeName);
                          } catch (e) {
                            await showDialog(
                                context: context,
                                builder: (ctx) {
                                  return AlertDialog(
                                    title: Text("An error occured"),
                                    content:
                                        Text("Unable to process your request"),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                        child: Text("Ok"),
                                      )
                                    ],
                                  );
                                });
                          }
                          setState(() {
                            _isLoading = false;
                          });
                        },
                  color: Colors.amber,
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Place Order",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: <Widget>[
                FreeDeliveyCard(cart.totalAmount),
                cart.items.length == 0
                    ? Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Your cart is empty!",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 16),
                            Container(
                              width: 200,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacementNamed(
                                      ProductsOverviewScreen.routeName);
                                },
                                color: Colors.blue,
                                child: Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Continue shopping",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: cart.items.length,
                            itemBuilder: (context, index) {
                              return CartItemWidget.CartItem(
                                productId: cart.items.keys.toList()[index],
                                id: cart.items.values.toList()[index].id,
                                price: cart.items.values.toList()[index].price,
                                quantity:
                                    cart.items.values.toList()[index].quantity,
                                title: cart.items.values.toList()[index].title,
                              );
                            }),
                      )
              ],
            ),
    );
  }
}
