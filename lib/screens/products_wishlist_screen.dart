import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/products_grid.dart';

class ProductsWishlistScreen extends StatelessWidget {
  static const routeName = "/products-wishist-screen";

  bool _showFav = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Wishlist"),
        actions: <Widget>[
          SizedBox(
            width: 20,
          ),
          Icon(Icons.shopping_cart),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: ProductsGrid(_showFav),
    );
  }
}
