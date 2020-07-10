import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/product_item.dart';
import 'package:shopping_app/providers/products.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;

    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6),
        itemBuilder: (context, index) {
          return ProductItem(
            id: products[index].id,
            imageSrc: products[index].imageUrl,
            title: products[index].title,
          );
        });
  }
}
