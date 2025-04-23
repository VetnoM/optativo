
import 'package:pt1_optativo/product.dart';

class Cart {
  static final Cart _instance = Cart._internal();
  factory Cart() => _instance;
  Cart._internal();

  final List<Product> productos = [];

  void addProduct(Product p) {
    productos.add(p);
  }

  void removeProduct(Product p) {
    productos.remove(p);
  }

  void clearCart() {
    productos.clear();
  }

  List<Product> getCartItems() => productos;
}
