import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/product.dart';
import 'package:shopping_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageSrc;

  // ProductItem({this.id, this.imageSrc, this.title});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    return Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            ProductDetailScreen.routeName,
                            arguments: product.id);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Image.network(
                          product.imageUrl,
                          height: 200,
                          fit: BoxFit.contain,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Positioned(
                        right: 5,
                        top: 5,
                        child: InkWell(
                          onTap: () {
                            product.isfavourite();
                          },
                          child: product.isfav
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.redAccent,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: Colors.grey,
                                ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(product.title),
                          Text('\$ ${product.price}'),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Card(
                            elevation: 1,
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                color: Colors.redAccent,
                                child: Text(
                                  "ADD",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ))),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}