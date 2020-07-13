import 'package:flutter/material.dart';
import 'package:shopping_app/screens/orders_screen.dart';
import 'package:shopping_app/screens/products_overview_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ProductsOverviewScreen.routeName);
            },
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
            child: ListTile(
              leading: Icon(Icons.business_center),
              title: Text("My orders"),
            ),
          )
        ],
      ),
    );
  }
}
