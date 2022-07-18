import 'dart:convert';

import 'package:delivery_app/src/data/models/dish.dart';
import 'package:flutter/services.dart';

class FoodMenuProvider {
  Future<List<Dish>> getPopularMenu() async {
    final jsonAsString = await rootBundle
        .loadString('assets/pages/home/home_tab/json/popular_menu.json');
    final List list = jsonDecode(jsonAsString);
    List<Dish> dishes = [];
    for (final Map<String, dynamic> item in list) {
      final dish = Dish(
        id: item['id'],
        name: item['name'],
        photo: item['preview'],
        price: double.parse(
          item['price'].toString(),
        ),
        rate: item['rate'] != null
            ? double.parse(
                item['rate'].toString(),
              )
            : null,
        description: item['description'],
      );

      dishes.add(dish);
    }

    return dishes;
  }
}
