import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/widgets/product_item.dart';
import 'package:shopping_app/providers/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool _ishowFav;

  ProductsGrid(this._ishowFav);
  @override
  Widget build(BuildContext context) {
    final productsData = _ishowFav
        ? Provider.of<Products>(context).favitems
        : Provider.of<Products>(context).items;

    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: productsData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6),
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: productsData[index],
            child: ProductItem(),
          );
        });
  }
}
