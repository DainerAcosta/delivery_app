import 'package:delivery_app/src/ui/global_controllers/my_cart_controller.dart';
import 'package:delivery_app/src/ui/pages/my_cart/widgets/check_out_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/my_cart_item.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<MyCartController>().cart.values.toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My Cart"),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: cart.length == 0
            ? const Center(
                child: Text("No elements"),
              )
            : ListView.builder(
                itemBuilder: (_, index) {
                  final dish = cart[index];
                  return MyCartItem(dish: dish);
                },
                itemCount: cart.length,
              ),
      ),
      bottomNavigationBar: const CheckOutPreview(),
    );
  }
}
