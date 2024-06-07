import 'package:flutter/material.dart';
import 'package:grocerystacked/screen/cart/cart_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
      viewModelBuilder: () => CartViewModel(),
      builder: (context, model, child) => Scaffold(
        body: ListView.builder(
          itemCount: model.cartItems.length,
          itemBuilder: (context, index) {
            final cartItem = model.cartItems[index];
            return ListTile(
              title: Text(cartItem.product.name),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => model.updateProductQuantity(
                      cartItem.product,
                      cartItem.quantity - 1,
                    ),
                  ),
                  Text('${cartItem.quantity}'),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => model.updateProductQuantity(
                      cartItem.product,
                      cartItem.quantity + 1,
                    ),
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
