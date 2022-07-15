import 'package:delivery_app/src/ui/pages/onboard/widgets/onboard_controls.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'onboard_controller.dart';
import 'widgets/slider.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OnboardController>(
      create: (_) {
        final controller = OnboardController();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.afterFirstLayout();
        });
        return controller;
      },
      builder: (context, _) => Scaffold(
        body: SafeArea(
            child: SizedBox(
          width: double.infinity,
          child: Column(
            children: const [
              OnboardSlider(),
              SizedBox(
                height: 50,
              ),
              OnboardControls(),
            ],
          ),
        )),
      ),
    );
  }
}
