import 'package:flutter/material.dart';
import 'package:grocerystacked/app/app.locator.dart';
import 'package:grocerystacked/app/app.router.dart';
import 'package:grocerystacked/screen/home/home_viewmodel.dart';
import 'package:grocerystacked/screen/widgets/custom_theme_toggle_button.dart';
import 'package:grocerystacked/services/cart_model.dart';
import 'package:grocerystacked/services/theme_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({super.key});
  final List<Product> products = [
    Product(
      id: 'prod_001',
      name: 'Organic Apples',
      category: 'Fruits',
      price: 3.99,
      description:
          'Fresh organic apples, perfect for a healthy snack or baking delicious pies.',
      imageUrl: 'https://example.com/images/organic_apples.jpg',
    ),
    Product(
      id: 'prod_002',
      name: 'Whole Wheat Bread',
      category: 'Bakery',
      price: 2.49,
      description:
          'Delicious and healthy whole wheat bread, freshly baked every day.',
      imageUrl: 'https://example.com/images/whole_wheat_bread.jpg',
    ),
    Product(
      id: 'prod_003',
      name: 'Free-range Eggs',
      category: 'Dairy',
      price: 4.99,
      description:
          'Farm-fresh free-range eggs with rich yolks and superior taste.',
      imageUrl: 'https://example.com/images/free_range_eggs.jpg',
    ),
    Product(
      id: 'prod_004',
      name: 'Almond Milk',
      category: 'Beverages',
      price: 3.49,
      description:
          'Smooth and creamy almond milk, perfect for your morning cereal or coffee.',
      imageUrl: 'https://example.com/images/almond_milk.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          actions: const [
            ThemeToggleButton(),
          ],
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ListTile(
              title: Text(product.name),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      viewModel.addProductToFavorites(product);
                      viewModel.navigationService.navigateToFavoriteView();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      viewModel.addProduct(product);
                      viewModel.navigationService.navigateToCartView();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
