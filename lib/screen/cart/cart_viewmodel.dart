import 'package:grocerystacked/app/app.locator.dart';
import 'package:grocerystacked/services/cart_model.dart';
import 'package:stacked/stacked.dart';

class CartViewModel extends BaseViewModel {
  final CartService _cartService = locator<CartService>();

  List<CartItem> get cartItems => _cartService.cartItems;

  void updateProductQuantity(Product product, int quantity) {
    _cartService.updateProductQuantity(product, quantity);
    notifyListeners();
  }

  List<ListenableServiceMixin> get reactiveServices => [_cartService];
}
