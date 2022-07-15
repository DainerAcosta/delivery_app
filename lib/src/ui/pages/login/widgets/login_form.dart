// ignore_for_file: use_build_context_synchronously

import 'package:delivery_app/src/data/models/user.dart';
import 'package:delivery_app/src/routes/routes.dart';
import 'package:delivery_app/src/ui/global_widgets/input_text.dart';
import 'package:delivery_app/src/ui/global_widgets/rounded_button.dart';
import 'package:delivery_app/src/ui/pages/login/login_controller.dart';
import 'package:delivery_app/src/utils/dialogs.dart';
import 'package:delivery_app/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  void _submit(BuildContext context) async {
    final controller = context.read<LoginController>();
    ProgressDialog.show(context);
    final User? user = await controller.submit();
    Navigator.pop(context);
    if (user == null) {
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                title: Text('ERROR'),
                content: Text('Invalid email or password'),
              ));
    } else {
      Navigator.restorablePushNamedAndRemoveUntil(
          context, Routes.HOME, (_) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context, listen: false);
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 320,
      ),
      child: Column(
        children: [
          InputText(
            labelText: 'Email',
            prefixIcon: const Icon(Icons.email_outlined),
            validator: (text) {
              if (text.contains('@')) {
                return null;
              } else {
                return 'Invalid email';
              }
            },
            onChanged: controller.onEmailChanged,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 20,
          ),
          InputText(
            labelText: 'Password',
            prefixIcon: const Icon(Icons.lock_outline),
            obscureText: true,
            onChanged: controller.onPasswordChanged,
            onSubmitted: (_) => _submit(context),
            textInputAction: TextInputAction.send,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: CupertinoButton(
              child: Text('Forgot Password', style: FontStyles.regular),
              onPressed: () {
                Navigator.pushNamed(context, Routes.FORGOT_PASSWORD);
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          RoundedButton(
            onPressed: () => _submit(context),
            label: 'Login',
            fullWith: false,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          ),
        ],
      ),
    );
  }
}
