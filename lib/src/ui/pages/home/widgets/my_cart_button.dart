import 'package:delivery_app/src/data/models/dish.dart';
import 'package:delivery_app/src/routes/routes.dart';
import 'package:delivery_app/src/ui/global_controllers/my_cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class FloatingMyCartButton extends StatelessWidget {
  const FloatingMyCartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool hasItems =
        context.select<MyCartController, bool>((_) => _.hasItems);

    if (!hasItems) return Container();

    final cart =
        context.select<MyCartController, Map<int, Dish>>((_) => _.cart);
    return Stack(
      children: [
        FloatingActionButton(
          child: SvgPicture.asset(
            'assets/pages/home/cart.svg',
            width: 30,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, Routes.MY_CART);
          },
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: Colors.deepOrange,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              "${cart.length}",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
