import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/products.dart';
import 'package:shopping_app/screens/edit_product_screen.dart';
import 'package:shopping_app/widgets/main_drawer.dart';
import 'package:shopping_app/widgets/user_product_item.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = "/user-product-screen";
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your products"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    UserProductItem(
                      imageUrl: productsData.items[index].imageUrl,
                      title: productsData.items[index].title,
                    ),
                    Divider()
                  ],
                )),
      ),
    );
  }
}
