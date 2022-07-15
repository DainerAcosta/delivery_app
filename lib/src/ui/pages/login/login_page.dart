import 'package:delivery_app/src/ui/pages/login/login_controller.dart';
import 'package:delivery_app/src/ui/pages/login/widgets/login_form.dart';
import 'package:delivery_app/src/ui/pages/login/widgets/social_login.dart';
import 'package:delivery_app/src/utils/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginController(),
      builder: (_, __) {
        final MediaQueryData mediaQuery = MediaQuery.of(_);
        final Size size = mediaQuery.size;
        final padding = mediaQuery.padding;
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SizedBox(
                  width: double.infinity,
                  height: size.height - padding.top - padding.bottom,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Welcome back!',
                        style: FontStyles.title.copyWith(
                          fontSize: 22,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: SvgPicture.asset(
                            'assets/pages/welcome/welcome.svg',
                            width: 200,
                          ),
                        ),
                      ),
                      const LoginForm(),
                      const SocialLogin(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
