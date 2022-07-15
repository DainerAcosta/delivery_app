import 'package:delivery_app/src/ui/pages/onboard/onboard_controller.dart';
import 'package:delivery_app/src/utils/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class OnboardSlider extends StatelessWidget {
  const OnboardSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OnboardController>(context, listen: false);

    return Expanded(
        child: PageView(
      controller: controller.pageController,
      children: List.generate(controller.items.length, (index) {
        final item = controller.items[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Expanded(
                child: SvgPicture.asset(item.image),
              ),
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: FontStyles.title,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                item.description,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      }),
    ));
  }
}
