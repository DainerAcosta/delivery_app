import 'package:delivery_app/src/data/models/dish.dart';
import 'package:flutter/widgets.dart';

class DishPageArguments {
  final String tag;
  final Dish dish;

  DishPageArguments({
    required this.tag,
    required this.dish,
  });
}

class DishController extends ChangeNotifier {
  final String tag;
  Dish dish;
  VoidCallback? onDispose;

  DishController(DishPageArguments arguments, this._isFavorite)
      : dish = arguments.dish,
        tag = arguments.tag;

  bool _isFavorite;
  bool get isFavorite => _isFavorite;

  void onCounterChanged(int counter) {
    dish = dish.updateCounter(counter);
  }

  void toggleFavorite() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }

  @override
  void dispose() {
    if (onDispose != null) {
      onDispose!();
    }
    super.dispose();
  }
}
