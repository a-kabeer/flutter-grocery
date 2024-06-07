import 'package:stacked/stacked.dart';

class CartService with ListenableServiceMixin {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addProduct(Product product) {
    var existingItemIndex = _cartItems.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingItemIndex != -1) {
      _cartItems[existingItemIndex].quantity++;
    } else {
      _cartItems.add(CartItem(product, 1));
    }
    notifyListeners();
  }

  void updateProductQuantity(Product product, int quantity) {
    var existingItemIndex = _cartItems.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingItemIndex != -1) {
      if (quantity > 0) {
        _cartItems[existingItemIndex].quantity = quantity;
      } else {
        _cartItems.removeAt(existingItemIndex);
      }
    } else {
      // If product does not exist in the cart and we need to update quantity,
      // We can decide to add it or just ignore it based on your requirement.
      // For now, we do nothing if the product is not in the cart.
    }

    notifyListeners();
  }
}

class CartItem {
  final Product product;
  int quantity;

  CartItem(this.product, this.quantity);
}

class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final String description;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
}
