import 'package:delivery_app/src/ui/pages/forgot_password/forgot_password_controller.dart';
import 'package:delivery_app/src/ui/pages/forgot_password/widgets/forgot_password_form.dart';
import 'package:delivery_app/src/utils/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ForgotPasswordController>(
      create: (_) => ForgotPasswordController(),
      builder: (_, __) {
        final MediaQueryData mediaQuery = MediaQuery.of(_);
        final Size size = mediaQuery.size;
        final padding = mediaQuery.padding;
        final AppBar appBar = AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
        );
        return Scaffold(
          appBar: appBar,
          body: SafeArea(
            child: SingleChildScrollView(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: size.height -
                      padding.top -
                      padding.bottom -
                      appBar.preferredSize.height,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Forgot password',
                        style: FontStyles.title.copyWith(
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Enter your email to send you instructions to reset your password',
                          style: FontStyles.normal.copyWith(
                              fontWeight: FontWeight.w600, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const ForgotPasswordForm(),
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
