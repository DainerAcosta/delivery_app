import 'package:delivery_app/src/data/models/user.dart';
import 'package:delivery_app/src/data/repositories/authentication_repository.dart';
import 'package:delivery_app/src/helpers/get.dart';
import 'package:delivery_app/src/ui/global_widgets/custom_form.dart';
import 'package:flutter/widgets.dart';

class RegisterController extends ChangeNotifier {
  String _email = '';
  String _name = '';
  String _lastname = '';
  final AuthenticationRepository _repository =
      Get.i.find<AuthenticationRepository>();
  GlobalKey<CustomFormState> formKey = GlobalKey();

  void onEmailChanged(String text) {
    _email = text;
  }

  void onNameChanged(String text) {
    _name = text;
  }

  void onLastnameChanged(String text) {
    _lastname = text;
  }

  Future<bool> submit() async {
    return _repository.register(User(
      id: '1',
      email: _email,
      name: _name,
      lastname: _lastname,
      birthday: DateTime.now(),
    ));
  }
}
