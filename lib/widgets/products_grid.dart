import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/widgets/product_item.dart';
import 'package:shopping_app/providers/products.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context).items;

    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: productsData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6),
        itemBuilder: (context, index) {
          return ChangeNotifierProvider(
            create: (context) => productsData[index],
            child: ProductItem(
                // id: productsData[index].id,
                // imageSrc: productsData[index].imageUrl,
                // title: productsData[index].title,
                ),
          );
        });
  }
}
