import 'package:grocerystacked/app/app.locator.dart';
import 'package:grocerystacked/services/auth_model.dart';
import 'package:grocerystacked/services/cart_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  AuthModel authModel = AuthModel();
  NavigationService navigationService = NavigationService();
  final CartService _cartService = locator<CartService>();

  List<CartItem> get cartItems => _cartService.cartItems;

  void addProduct(Product product) {
    _cartService.addProduct(product);
    notifyListeners();
  }

  List<ListenableServiceMixin> get reactiveServices => [_cartService];
}
