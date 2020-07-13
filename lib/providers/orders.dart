import 'package:flutter/cupertino.dart';
import 'package:shopping_app/providers/cart.dart';

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

  void addOrder(List<CartItem> oProducts, double amount) {
    _orders.insert(
        0,
        OrderItem(
            amount: amount,
            dateTime: DateTime.now(),
            id: DateTime.now().toString(),
            orderedProducts: oProducts));
    ChangeNotifier();
  }
}
