import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'favorite_viewmodel.dart';

class FavoriteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FavoriteViewModel>.reactive(
      viewModelBuilder: () => FavoriteViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        body: ListView.builder(
          itemCount: viewModel.favoriteItems.length,
          itemBuilder: (context, index) {
            final product = viewModel.favoriteItems[index];
            return ListTile(
              title: Text(product.name),
              trailing: IconButton(
                icon: Icon(Icons.remove),
                onPressed: () => viewModel.removeProductFromFavorites(product),
              ),
            );
          },
        ),
      ),
    );
  }
}
