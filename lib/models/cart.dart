import 'package:flutter/material.dart';
import 'package:ecommerce/models/product.dart'; // Ensure this import is correct

class Cart with ChangeNotifier {
  final Map<Product, int> _items = {};

  Map<Product, int> get items => _items;

  void addItem(Product product) {
    if (_items.containsKey(product)) {
      _items[product] = _items[product]! + 1;
    } else {
      _items[product] = 1;
    }
    notifyListeners();
  }

  void removeItem(Product product) {
    if (_items.containsKey(product)) {
      if (_items[product] == 1) {
        _items.remove(product);
      } else {
        _items[product] = _items[product]! - 1;
      }
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  double get totalPrice {
    return _items.entries.fold(0.0, (total, entry) {
      return total + (entry.key.price * entry.value);
    });
  }
}