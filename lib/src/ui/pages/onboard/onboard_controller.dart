import 'package:delivery_app/src/data/models/onboard_item.dart';
import 'package:flutter/widgets.dart';

class OnboardController extends ChangeNotifier {
  final List<OnboardItem> items = [
    OnboardItem(
      image: 'assets/pages/onboard/slider-1.svg',
      title: 'slider 1',
      description: 'description... 1',
    ),
    OnboardItem(
      image: 'assets/pages/onboard/slider-2.svg',
      title: 'slider 2',
      description: 'description... 2',
    ),
    OnboardItem(
      image: 'assets/pages/onboard/slider-3.svg',
      title: 'slider 3',
      description: 'description... 3',
    )
  ];

  final PageController pageController = PageController();

  double _currentPage = 0;

  double get currentPage => _currentPage;

  void afterFirstLayout() {
    pageController.addListener(() {
      final double? page = pageController.page;
      if (page != null) {
        _currentPage = page;
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
