import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/cart_icon.dart';
import 'package:shopping_app/widgets/products_grid.dart';

class ProductsWishlistScreen extends StatelessWidget {
  static const routeName = "/products-wishist-screen";

  final bool _showFav = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Wishlist"),
        actions: <Widget>[
          SizedBox(
            width: 10,
          ),
          CartIcon(),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ProductsGrid(_showFav),
    );
  }
}
