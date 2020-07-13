import 'package:flutter/material.dart';
import 'package:shopping_app/screens/products_wishlist_screen.dart';
import 'package:shopping_app/widgets/cart_icon.dart';
import 'package:shopping_app/widgets/main_drawer.dart';
import 'package:shopping_app/widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  static const routeName = "/products-overview-screen";

  final bool _showFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(ProductsWishlistScreen.routeName);
              },
              icon: Icon(Icons.favorite)),
          CartIcon(),
        ],
      ),
      drawer: MainDrawer(),
      body: ProductsGrid(_showFav),
    );
  }
}
