import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiry;
  String _uid;

  Future<void> signup(String email, String password) async {
    final url =
        "https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=AIzaSyCnOb0PB-ipqZSByiS2a2XFbf0pOEbvqSE";
    final response = await http.post(url,
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));
    print(json.decode(response.body));

    notifyListeners();
  }
}
