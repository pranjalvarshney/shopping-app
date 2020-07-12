import 'package:flutter/material.dart';

class FreeDeliveyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.local_shipping,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Free delivery ",
                style: TextStyle(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              Text(
                "on orders above \$ 9.99",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ));
  }
}
