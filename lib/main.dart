import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/auth.dart';
import 'package:shopping_app/providers/cart.dart';
import 'package:shopping_app/providers/orders.dart';
import 'package:shopping_app/providers/products.dart';
import 'package:shopping_app/screens/auth_screen.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/screens/edit_product_screen.dart';
import 'package:shopping_app/screens/orders_screen.dart';
import 'package:shopping_app/screens/product_detail_screen.dart';
import 'package:shopping_app/screens/products_overview_screen.dart';
import 'package:shopping_app/screens/products_wishlist_screen.dart';
import 'package:shopping_app/screens/user_products_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthScreen(),
        routes: {
          AuthScreen.routeName: (context) => AuthScreen(),
          EditProductScreen.routeName: (context) => EditProductScreen(),
          UserProductScreen.routeName: (context) => UserProductScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
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
