import 'package:delivery_app/src/data/models/dish.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class HomeController extends ChangeNotifier implements TickerProvider {
  HomeController() {
    _init();
  }

  late TabController tabController;

  void _init() async {
    tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  int _currentPage = 0;
  int get currentPage => _currentPage;

  Map<int, Dish> _favorites = {};

  Map<int, Dish> get favorites => _favorites;

  bool isFavorite(Dish dish) => _favorites.containsKey(dish.id);

  void Function()? onDispose;

  void afterFirstLayout() {
    tabController.addListener(() {
      _currentPage = tabController.index;
      notifyListeners();
    });
  }

  void toggleFavorite(Dish dish) {
    Map<int, Dish> copy = Map<int, Dish>.from(_favorites);
    if (isFavorite(dish)) {
      copy.remove(dish.id);
    } else {
      copy[dish.id] = dish;
    }
    _favorites = copy;
    notifyListeners();
  }

  void deleteFavorite(Dish dish) {
    Map<int, Dish> copy = Map<int, Dish>.from(_favorites);
    if (isFavorite(dish)) {
      copy.remove(dish.id);
      _favorites = copy;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    if (onDispose != null) {
      onDispose!();
    }
    super.dispose();
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}
