import 'package:delivery_app/src/routes/routes.dart';
import 'package:delivery_app/src/ui/pages/onboard/onboard_controller.dart';
import 'package:delivery_app/src/utils/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class OnboardControls extends StatelessWidget {
  const OnboardControls({
    Key? key,
  }) : super(key: key);

  void _onNext(BuildContext context, OnboardController controller) {
    if (controller.currentPage == 2) {
      Navigator.pushReplacementNamed(context, Routes.WELCOME);
    } else {
      controller.pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const _Dots(),
          Consumer<OnboardController>(
            builder: (_, controller, __) {
              final double page = controller.currentPage;
              bool isEnd = page % 1 == 0 && page == 2.0;

              return CupertinoButton(
                onPressed: () {
                  _onNext(context, controller);
                },
                color: primaryColor,
                borderRadius: BorderRadius.circular(30),
                child: Text(isEnd ? 'Get Started' : 'Next'),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OnboardController>(context);
    return DotsIndicator(
      dotsCount: controller.items.length,
      position: controller.currentPage,
      decorator: DotsDecorator(
        activeColor: primaryColor,
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
