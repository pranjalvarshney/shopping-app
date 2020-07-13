import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart.dart';
import 'package:shopping_app/providers/products.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/screens/product_detail_screen.dart';
import 'package:shopping_app/screens/products_overview_screen.dart';
import 'package:shopping_app/screens/products_wishlist_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        )
      ],
      child: MaterialApp(
        home: ProductsOverviewScreen(),
        debugShowCheckedModeBanner: false,
        initialRoute: ProductsOverviewScreen.routeName,
        routes: {
          ProductsOverviewScreen.routeName: (context) =>
              ProductsOverviewScreen(),
          ProductsWishlistScreen.routeName: (context) =>
              ProductsWishlistScreen(),
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
        },
      ),
    );
  }
}
