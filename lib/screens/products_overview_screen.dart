import 'package:flutter/material.dart';
import 'package:shopping_app/screens/products_wishlist_screen.dart';
import 'package:shopping_app/widgets/cart_icon.dart';
import 'package:shopping_app/widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final bool _showFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
        actions: <Widget>[
          SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(ProductsWishlistScreen.routeName);
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 10,
          ),
          CartIcon(),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      drawer: Drawer(),
      body: ProductsGrid(_showFav),
    );
  }
}
