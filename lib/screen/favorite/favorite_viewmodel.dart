import 'package:grocerystacked/app/app.locator.dart';
import 'package:grocerystacked/services/cart_model.dart';
import 'package:grocerystacked/services/favorite_model.dart';
import 'package:stacked/stacked.dart';

class FavoriteViewModel extends BaseViewModel {
  final FavoriteService _favoriteService = locator<FavoriteService>();

  List<Product> get favoriteItems => _favoriteService.favoriteItems;

  void addProductToFavorites(Product product) {
    _favoriteService.addProductToFavorites(product);
    notifyListeners();
  }

  void removeProductFromFavorites(Product product) {
    _favoriteService.removeProductFromFavorites(product);
    notifyListeners();
  }

  List<ListenableServiceMixin> get reactiveServices => [_favoriteService];
}
