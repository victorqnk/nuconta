import 'package:flutter/cupertino.dart';

class User with ChangeNotifier {
  final String id;
  final String name;
  int balance;
  final List offers;

  User({
    required this.id,
    required this.name,
    required this.balance,
    required this.offers,
  });

  factory User.fromQuery(doc) {
    return User(
      id: doc['id'],
      name: doc['name'],
      balance: doc['balance'],
      offers: doc['offers'],
    );
  }

  void resetBalance() {
    balance = 1000000;
    notifyListeners();
  }

  void makePurchase(int price) {
    balance -= price;
    notifyListeners();
  }
}
