// ignore_for_file: use_build_context_synchronously

import 'package:delivery_app/src/ui/global_widgets/custom_form.dart';
import 'package:delivery_app/src/ui/global_widgets/input_text.dart';
import 'package:delivery_app/src/ui/global_widgets/rounded_button.dart';
import 'package:delivery_app/src/ui/pages/register/register_controller.dart';
import 'package:delivery_app/src/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  void _submit(BuildContext context) async {
    final controller = context.read<RegisterController>();
    final isFormOk = controller.formKey.currentState!.validate();
    if (isFormOk) {
      ProgressDialog.show(context);
      final isOk = await controller.submit();
      Navigator.of(context).pop();
      if (!isOk) {
        Dialogs.alert(
          context,
          title: 'ERROR',
          description: 'Register fail',
        );
      } else {
        // go to home
        await Dialogs.alert(
          context,
          dismissible: false,
          title: 'GOOD',
          description: 'Register Ok',
          onText: 'Go to login',
        );
        Navigator.pop(context);
      }
    } else {
      Dialogs.alert(
        context,
        title: 'ERROR',
        description: 'Invalid Inputs',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RegisterController>();
    return CustomForm(
      key: controller.formKey,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 370),
        child: Column(
          children: [
            InputText(
              labelText: 'Name',
              prefixIcon: const Icon(Icons.person_outlined),
              onChanged: controller.onNameChanged,
              validator: (text) {
                return text.trim().length > 1 ? null : 'Invalid name';
              },
            ),
            const SizedBox(
              height: 15,
            ),
            InputText(
              labelText: 'Lastname',
              prefixIcon: const Icon(Icons.person_add_outlined),
              onChanged: controller.onLastnameChanged,
              validator: (text) {
                return text.trim().length > 1 ? null : 'Invalid lastname';
              },
            ),
            const SizedBox(
              height: 15,
            ),
            InputText(
              labelText: 'Email',
              prefixIcon: const Icon(Icons.email_outlined),
              onChanged: controller.onEmailChanged,
              validator: (text) {
                return text.contains('@') ? null : 'Invalid email';
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: RoundedButton(
                onPressed: () {
                  _submit(context);
                },
                label: 'Sign Up',
              ),
            )
          ],
        ),
      ),
    );
  }
}
