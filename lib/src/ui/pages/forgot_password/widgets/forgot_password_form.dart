// ignore_for_file: use_build_context_synchronously

import 'package:delivery_app/src/ui/global_widgets/input_text.dart';
import 'package:delivery_app/src/ui/global_widgets/rounded_button.dart';
import 'package:delivery_app/src/ui/pages/forgot_password/forgot_password_controller.dart';
import 'package:delivery_app/src/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  void _submit(BuildContext context) async {
    final controller = context.read<ForgotPasswordController>();
    ProgressDialog.show(context);
    controller.submit();
    final sent = await controller.submit();
    Navigator.pop(context);
    if (sent!) {
      await Dialogs.alert(
        context,
        dismissible: false,
        title: "GOOD",
        description: "We have sent an email ${controller.email}",
      );
      Navigator.pop(context);
    } else {
      Dialogs.alert(
        context,
        title: "Error",
        description: "Email ${controller.email} not found",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ForgotPasswordController>();
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 320,
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/pages/forgot_password/forgot_password.svg',
            width: 250,
          ),
          const SizedBox(
            height: 20,
          ),
          InputText(
              onChanged: controller.onEmailChanged,
              labelText: 'Email',
              prefixIcon: const Icon(
                Icons.email_rounded,
              )),
          const SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: RoundedButton(
              onPressed: () {
                _submit(context);
              },
              label: 'Send',
            ),
          )
        ],
      ),
    );
  }
}
