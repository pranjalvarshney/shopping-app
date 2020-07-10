import 'package:flutter/material.dart';
import 'package:shopping_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageSrc;

  ProductItem({this.id, this.imageSrc, this.title});

  @override
  Widget build(BuildContext context) {
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
                        Navigator.of(context)
                            .pushNamed(ProductDetailScreen.routeName);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Image.network(
                          imageSrc,
                          height: 200,
                          fit: BoxFit.contain,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Positioned(
                        right: 5,
                        top: 5,
                        child: Card(
                          child: Icon(Icons.favorite_border),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
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
                          Text(title),
                          Text("\$ 99"),
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
