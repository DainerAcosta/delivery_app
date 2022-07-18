// import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_app/src/data/models/dish.dart';
import 'package:delivery_app/src/ui/global_controllers/my_cart_controller.dart';
import 'package:delivery_app/src/ui/global_widgets/dish_counter.dart';
import 'package:delivery_app/src/utils/colors.dart';
import 'package:delivery_app/src/utils/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyCartItem extends StatelessWidget {
  final Dish dish;
  const MyCartItem({Key? key, required this.dish}) : super(key: key);

  void _deleteItem(BuildContext context) {
    final myCartController = context.read<MyCartController>();
    myCartController.deleteFromCart(dish);
  }

  void _onCounterChanged(BuildContext context, int counter) {
    final updatedDish = dish.updateCounter(counter);
    final myCartController = context.read<MyCartController>();
    myCartController.addToCart(updatedDish);
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      secondaryActions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10).copyWith(bottom: 5),
          child: IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => _deleteItem(context),
          ),
        ),
      ],
      child: Container(
        margin: const EdgeInsets.all(10).copyWith(bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.network(
                  dish.photo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dish.name,
                    style: FontStyles.regular,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${dish.price}",
                        style: FontStyles.title.copyWith(
                          color: primaryColor,
                        ),
                      ),
                      DishCounter(
                        size: DishCounterSize.mini,
                        initialValue: dish.counter,
                        onChanged: (counter) =>
                            _onCounterChanged(context, counter),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
