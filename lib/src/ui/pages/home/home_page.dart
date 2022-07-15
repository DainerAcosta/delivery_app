import 'package:delivery_app/src/ui/pages/home/home_controller.dart';
import 'package:delivery_app/src/ui/pages/home/widgets/home_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(
      create: (_) => HomeController(),
      builder: (_, __) {
        return Scaffold(
          bottomNavigationBar: HomeBottomBar(),
        );
      },
    );
  }
}
