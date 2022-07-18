import 'package:delivery_app/src/helpers/get.dart';
import 'package:delivery_app/src/ui/global_widgets/dish_counter.dart';
import 'package:delivery_app/src/ui/pages/home/home_controller.dart';
import 'package:delivery_app/src/utils/colors.dart';
import 'package:delivery_app/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../dish_controller.dart';

class DishDetail extends StatelessWidget {
  const DishDetail({
    Key? key,
  }) : super(key: key);

  void _toggleFavorite(BuildContext context) {
    final homeController = Get.i.find<HomeController>();
    final controller = context.read<DishController>();
    if (!controller.isFavorite) {
      const SnackBar snackBar = SnackBar(
        content: Text(
          "Added to favorites",
          textAlign: TextAlign.center,
        ),
        backgroundColor: primaryColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    controller.toggleFavorite();
    homeController.toggleFavorite(controller.dish);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DishController>(context);
    final dish = controller.dish;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dish.name,
                      style: FontStyles.title,
                    ),
                    Text(
                      "\$ ${dish.price}",
                      style: FontStyles.regular.copyWith(
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              CupertinoButton(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  'assets/pages/home/favorite.svg',
                  width: 35,
                  height: 35,
                  color: controller.isFavorite ? primaryColor : Colors.grey,
                ),
                onPressed: () => _toggleFavorite(context),
              ),
            ],
          ),
          const SizedBox(height: 10),
          DishCounter(
            initialValue: controller.dish.counter,
            onChanged: controller.onCounterChanged,
          ),
          const SizedBox(height: 20),
          Text(
            dish.description,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
