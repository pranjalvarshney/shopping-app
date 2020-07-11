import 'package:flutter/material.dart';
import 'package:shopping_app/screens/products_wishlist_screen.dart';
import 'package:shopping_app/widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  bool _showFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
        actions: <Widget>[
          SizedBox(
            width: 20,
          ),
          InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(ProductsWishlistScreen.routeName);
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.shopping_cart),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      drawer: Drawer(),
      body: ProductsGrid(_showFav),
    );
  }
}
