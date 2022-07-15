import 'package:delivery_app/src/routes/routes.dart';
import 'package:delivery_app/src/ui/global_widgets/circle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Or via social media',
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleButton(
              onPressed: () {},
              iconPath: 'assets/pages/welcome/facebook.svg',
              backgroundColor: Colors.blueAccent,
            ),
            const SizedBox(
              width: 10,
            ),
            CircleButton(
              onPressed: () {},
              iconPath: 'assets/pages/welcome/google.svg',
              backgroundColor: Colors.redAccent,
            ),
            const SizedBox(
              width: 10,
            ),
            CircleButton(
              onPressed: () {},
              iconPath: 'assets/pages/welcome/apple.svg',
              backgroundColor: Colors.grey,
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text("Don't an account?"),
            const SizedBox(
              width: 10,
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Text('Sign Up'),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.REGISTER);
              },
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
