import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart.dart';
import 'package:shopping_app/providers/product.dart';
import 'package:shopping_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: Container(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Image.network(
                          product.imageUrl,
                          height: 200,
                          fit: BoxFit.contain,
                          width: double.infinity,
                        ),
                      ),
                      Positioned(
                          right: 0,
                          top: 0,
                          child: Consumer<Product>(
                            builder: (context, product, child) => IconButton(
                              onPressed: () {
                                product.isfavourite();
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                    product.isfav
                                        ? "Added successfully"
                                        : "Removed successfully",
                                    textAlign: TextAlign.center,
                                  ),
                                  backgroundColor: Colors.grey[500],
                                  duration: Duration(seconds: 2),
                                ));
                              },
                              icon: product.isfav
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.redAccent,
                                    )
                                  : Icon(
                                      Icons.favorite_border,
                                      color: Colors.grey,
                                    ),
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(product.title),
                            Text('\$ ${product.price}'),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            cart.addItem(
                                product.id, product.price, product.title);
                          },
                          child: Card(
                              elevation: 1,
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  color: Colors.redAccent,
                                  child: Text(
                                    "ADD",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ))),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
