import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    //   Product(
    //     id: 'p1',
    //     title: 'Red Shirt',
    //     description: 'A red shirt - it is pretty red!',
    //     price: 29.99,
    //     imageUrl:
    //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    //   ),
    //   Product(
    //     id: 'p2',
    //     title: 'Trousers',
    //     description: 'A nice pair of trousers.',
    //     price: 59.99,
    //     imageUrl:
    //         'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    //   ),
    //   Product(
    //     id: 'p3',
    //     title: 'Yellow Scarf',
    //     description: 'Warm and cozy - exactly what you need for the winter.',
    //     price: 19.99,
    //     imageUrl:
    //         'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    //   ),
    //   Product(
    //     id: 'p4',
    //     title: 'A Pan',
    //     description: 'Prepare any meal you want.',
    //     price: 49.99,
    //     imageUrl:
    //         'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    //   ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favitems {
    return _items.where((element) => element.isfav).toList();
  }

  Product findById(String pid) {
    return _items.firstWhere((element) => element.id == pid);
  }

  Future<void> fetchdata() async {
    try {
      const url = "https://simple-shop-1ae70.firebaseio.com/products.json";
      final response = await http.get(url);
      final data = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadProduct = [];
      data.forEach((key, value) {
        loadProduct.add(
          Product(
              id: key,
              description: value['description'],
              imageUrl: value['imageUrl'],
              price: value['price'],
              title: value['title'],
              isfav: value['isfav']),
        );
      });
      _items = loadProduct;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      const url =
          "https://simple-shop-1ae70.firebaseio.com/products.json"; //only in firebase .json is used
      final response = await http.post(
        url,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'price': product.price,
          'imageUrl': product.imageUrl,
        }),
      );

      final newProduct = Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      );
      _items.insert(0, newProduct);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> updateProduct(String pid, Product product) async {
    try {
      final indexp = _items.indexWhere((element) => element.id == pid);
      if (indexp >= 0) {
        final url =
            "https://simple-shop-1ae70.firebaseio.com/products/$pid.json";
        await http.patch(url,
            body: json.encode({
              'title': product.title,
              'description': product.description,
              'price': product.price,
              'imageUrl': product.imageUrl,
            }));
        _items[indexp] = product;
        notifyListeners();
      } else {
        print("no update");
      }
    } catch (e) {}
  }

  void removeProduct(String pid) {
    _items.removeWhere((item) => item.id == pid);
    notifyListeners();
  }
}
