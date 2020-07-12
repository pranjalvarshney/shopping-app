import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final int quantity;
  CartItem({this.id, this.imageUrl, this.price, this.title, this.quantity});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(title),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      'Qty - ${quantity.toString()} X  \$ ${price.toString()}'),
                  Text("\$ ${price * quantity}"),
                ],
              ),
              trailing: Image.network(
                imageUrl,
                fit: BoxFit.contain,
                height: 80,
                width: 80,
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
