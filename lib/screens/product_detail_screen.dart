import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = "/product-detail-screen";

  @override
  Widget build(BuildContext context) {
    final pid = ModalRoute.of(context).settings.arguments as String;

    final productDetail =
        Provider.of<Products>(context, listen: false).findById(pid);

    return Scaffold(
      appBar: AppBar(
        title: Text(productDetail.title),
        actions: <Widget>[Icon(Icons.settings)],
      ),
    );
  }
}
