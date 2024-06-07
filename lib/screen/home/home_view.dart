import 'package:flutter/material.dart';
import 'package:grocerystacked/screen/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({super.key});
  List products = [];
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ListTile(
              title: Text(product.name),
              trailing: IconButton(
                icon: Icon(Icons.add),
                onPressed: () => viewModel.addProduct(product),
              ),
            );
          },
        ),
      ),
    );
  }
}
