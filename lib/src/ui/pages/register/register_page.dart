import 'package:delivery_app/src/ui/pages/register/register_controller.dart';
import 'package:delivery_app/src/ui/pages/register/widgets/register_form.dart';
import 'package:delivery_app/src/utils/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterController>(
      create: (_) => RegisterController(),
      builder: (_, __) {
        final MediaQueryData mediaQuery = MediaQuery.of(_);
        final Size size = mediaQuery.size;
        final padding = mediaQuery.padding;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minHeight: size.height - padding.top - padding.bottom,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Sing Up',
                        style: FontStyles.title.copyWith(fontSize: 22),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Fill the details & create your account',
                        style: FontStyles.normal.copyWith(
                            fontWeight: FontWeight.w600, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 65,
                      ),
                      const RegisterForm(),
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
