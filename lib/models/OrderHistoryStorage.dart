import 'package:ecommerce/models/product.dart';

class OrderHistoryStorage {
  static final List<Product> _orderHistory = [];

  static List<Product> get orderHistory => List.unmodifiable(_orderHistory);

  static void addOrder(List<Product> products) {
    _orderHistory.addAll(products);
  }
}