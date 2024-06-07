import 'package:grocerystacked/services/cart_model.dart';
import 'package:stacked/stacked.dart';

class FavoriteService with ListenableServiceMixin {
  final List<Product> _favoriteItems = [];

  List<Product> get favoriteItems => _favoriteItems;

  void addProductToFavorites(Product product) {
    if (!_favoriteItems.contains(product)) {
      _favoriteItems.add(product);
    }
    notifyListeners();
  }

  void removeProductFromFavorites(Product product) {
    _favoriteItems.remove(product);
    notifyListeners();
  }
}
