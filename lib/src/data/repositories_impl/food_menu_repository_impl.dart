import 'package:delivery_app/src/data/models/dish.dart';
import 'package:delivery_app/src/data/providers/remote/food_menu_provider.dart';
import 'package:delivery_app/src/data/repositories/food_menu_repository.dart';

class FoodMenuRepositoryImpl implements FoodMenuRepository {
  final FoodMenuProvider _provider;

  FoodMenuRepositoryImpl(this._provider);
  @override
  Future<List<Dish>> getPopularMenu() {
    return _provider.getPopularMenu();
  }
}
