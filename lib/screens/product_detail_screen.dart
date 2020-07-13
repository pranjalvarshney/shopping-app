import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/products.dart';
import 'package:shopping_app/screens/products_wishlist_screen.dart';
import 'package:shopping_app/widgets/cart_icon.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = "/product-detail-screen";

  @override
  Widget build(BuildContext context) {
    final pid = ModalRoute.of(context).settings.arguments as String;

    final productDetail =
        Provider.of<Products>(context, listen: false).findById(pid);

    return Scaffold(
      appBar: AppBar(
        title: null,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(ProductsWishlistScreen.routeName);
              },
              icon: Icon(Icons.favorite)),
          CartIcon()
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(0),
                  margin: const EdgeInsets.all(0),
                  height: 400,
                  width: double.infinity,
                  child: Image.network(
                    productDetail.imageUrl,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 10,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      size: 36,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 10,
                  child: IconButton(
                    color: Colors.grey,
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      size: 36,
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    productDetail.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    productDetail.description,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "MRP - ",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "\$ ${productDetail.price}",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Card(
        elevation: 10,
        margin: const EdgeInsets.all(0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                onPressed: () {},
                color: Colors.white,
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  child: Text(
                    "Add to cart",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            ),
            Expanded(
              child: RaisedButton(
                onPressed: () {},
                color: Colors.amber,
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  child: Text(
                    "Buy now",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
