import 'package:delivery_app/src/data/models/dish.dart';
import 'package:delivery_app/src/ui/pages/home/tabs/home_tab/home_tab_controller.dart';
import 'package:delivery_app/src/ui/pages/home/tabs/home_tab/widgets/categories_menu.dart';
import 'package:delivery_app/src/ui/pages/home/tabs/home_tab/widgets/horizontal_dishes.dart';
import 'package:delivery_app/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/search_button.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  HomeTabState createState() => HomeTabState();
}

class HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ChangeNotifierProvider<HomeTabController>(
      create: (_) {
        final controller = HomeTabController();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.afterFirstLayout();
        });
        return controller;
      },
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Hello, Dainer"),
                    Text(
                      "Lorem ipsum dolor sit amet",
                      style: FontStyles.title.copyWith(
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SearchButton(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const CategoriesMenu(),
              const SizedBox(height: 20),
              Builder(
                builder: (context) {
                  final List<Dish> popularMenu =
                      context.select<HomeTabController, List<Dish>>(
                    (_) => _.popularMenu,
                  );
                  return HorizontalDishes(
                    dishes: popularMenu,
                    title: "Popular Menu",
                    onViewAll: () {},
                  );
                },
              ),
              const SizedBox(height: 20),
              Builder(
                builder: (context) {
                  final List<Dish> popularMenu =
                      context.select<HomeTabController, List<Dish>>(
                    (_) => _.popularMenu,
                  );
                  return HorizontalDishes(
                    dishes: popularMenu,
                    title: "Popular Menu",
                    onViewAll: () {},
                  );
                },
              ),
              const SizedBox(height: 20),
              Builder(
                builder: (context) {
                  final List<Dish> popularMenu =
                      context.select<HomeTabController, List<Dish>>(
                    (_) => _.popularMenu,
                  );
                  return HorizontalDishes(
                    dishes: popularMenu,
                    title: "Popular Menu",
                    onViewAll: () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
