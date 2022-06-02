import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class MyController extends GetxController {
  var sayi = 0.obs;
  var myurl = 'mfdnmjdngj'.obs;

  increment() {
    sayi.value++;
  }

  discrement() {
    sayi.value--;
  }

  List<dynamic> mylist = [].obs;

  addlist(String url) {
    mylist.add(myurl.obs);
  }
}

class Product {
  int id;
  String name;
  double price;
  Product({
    required this.id,
    required this.name,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}

class ProductService {
  ProductService() {
    _getproducts();
  }

  final List<Product> products = [];

  void _getproducts() async {
    products.addAll([
      Product(id: 1, name: 'Elma', price: 16),
      Product(id: 2, name: 'Muz', price: 26),
      Product(id: 3, name: 'Nar', price: 12),
      Product(id: 4, name: 'Karpuz', price: 8),
      Product(id: 5, name: 'Erik', price: 80),
      Product(id: 6, name: 'Dut', price: 120),
      Product(id: 7, name: 'Kiraz', price: 25),
      Product(id: 8, name: 'Çilek', price: 25),
    ]);
  }
}

class ShoppingCart {
  final List<ShoppingCartItem> _items = [];

  List<ShoppingCartItem> get items {
    return _items;
  }

  void add(int id, int quantity) {
    final svc = GetIt.I<ProductService>();
    final product = svc.products.singleWhere((element) => element.id == id);
    final item = _items.firstWhereOrNull((element) => element.product.id == id);
    if (item != null) {
      item.quantity++;
    } else {
      _items.add(ShoppingCartItem(product: product));
    }
  }

  void remove(int id) {
    final item = _items.firstWhere((element) => element.product.id == id);
    item.quantity--;
    if (item.quantity == 0) _items.remove(item);
  }

  void clear() {
    _items.clear();
  }


  double get grandTotal {
    var total = 0.0;
    for (var item in _items) {
      total += item.amount;
    }
    return total;
  }
}

class ShoppingCartItem {
  final Product product;
  int quantity;
  ShoppingCartItem({
    required this.product,
    this.quantity = 1,
  });
  double get amount => quantity * product.price;
}

class ShoppingCartService {
  final ShoppingCart cart = ShoppingCart();
}
