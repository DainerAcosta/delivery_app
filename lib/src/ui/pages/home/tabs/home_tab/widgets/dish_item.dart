// import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_app/src/data/models/dish.dart';
import 'package:delivery_app/src/routes/routes.dart';
import 'package:delivery_app/src/ui/global_controllers/my_cart_controller.dart';
import 'package:delivery_app/src/ui/pages/dish/dish_controller.dart';
import 'package:delivery_app/src/utils/colors.dart';
import 'package:delivery_app/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class DishHomeItem extends StatelessWidget {
  const DishHomeItem({
    Key? key,
    required this.item,
    required this.isFirst,
  }) : super(key: key);

  final bool isFirst;

  final Dish item;

  String get tag => "${key.toString()}-${item.id}";

  void _goToDetail(BuildContext context) {
    final int counter = context.read<MyCartController>().getDishCounter(item);
    final Dish dish = item.updateCounter(counter);

    Navigator.pushNamed(
      context,
      Routes.DISH,
      arguments: DishPageArguments(tag: tag, dish: dish),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10)
            .copyWith(left: isFirst ? 15 : 10),
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Stack(
            children: [
              Hero(
                tag: tag,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    item.photo,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: -1,
                child: Container(
                  padding: const EdgeInsets.all(10).copyWith(top: 50),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0),
                        Colors.white.withOpacity(0.3),
                        Colors.white.withOpacity(0.6),
                        Colors.white.withOpacity(0.9),
                        Colors.white,
                      ],
                      stops: const [
                        0.1,
                        0.2,
                        0.3,
                        0.5,
                        1,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: FontStyles.regular.copyWith(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "\$",
                              style: FontStyles.regular.copyWith(
                                color: primaryColor,
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                              ),
                              children: [
                                TextSpan(
                                  text: " ${item.price}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (item.rate != null)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 7)
                                  .copyWith(left: 4),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  Text(
                                    "${item.rate}",
                                    style: FontStyles.normal.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          onPressed: () => _goToDetail(context),
        ),
      ),
    );
  }
}
