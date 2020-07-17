import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_app/providers/cart.dart';
import 'package:http/http.dart' as http;

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> orderedProducts;
  final DateTime dateTime;

  OrderItem(
      {@required this.amount,
      @required this.dateTime,
      @required this.id,
      @required this.orderedProducts});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<bool> fetchAndSetOrders() async {
    try {
      const url = "https://simple-shop-1ae70.firebaseio.com/orders.json";
      final response = await http.get(url);
      final List<OrderItem> orderData = [];
      final data = json.decode(response.body) as Map<String, dynamic>;
      if (data == null) {
        return false;
      } else {
        data.forEach((oid, odata) {
          orderData.add(OrderItem(
              amount: odata["amount"],
              dateTime: DateTime.parse(odata['dateTime']),
              id: oid,
              orderedProducts: (odata['products'] as List<dynamic>)
                  .map((item) => CartItem(
                        id: item['id'],
                        price: item['price'],
                        quantity: item['quantity'],
                        title: item['title'],
                      ))
                  .toList()));
        });
        notifyListeners();
        return true;
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> addOrder(List<CartItem> oProducts, double amount) async {
    try {
      final url = "https://simple-shop-1ae70.firebaseio.com/orders.json";
      final timeStamp = DateTime.now();
      final response = await http.post(url,
          body: jsonEncode({
            "amount": amount,
            "dateTime": timeStamp.toIso8601String(),
            "products": oProducts
                .map((product) => {
                      "id": product.id,
                      "title": product.title,
                      "price": product.price,
                      "quantity": product.quantity
                    })
                .toList()
          }));
      _orders.insert(
          0,
          OrderItem(
              amount: amount,
              dateTime: timeStamp,
              id: jsonDecode(response.body)["name"],
              orderedProducts: oProducts));
      ChangeNotifier();
    } catch (e) {
      throw e;
    }
  }
}
