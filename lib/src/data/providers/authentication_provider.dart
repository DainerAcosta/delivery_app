import 'package:delivery_app/src/data/models/user.dart';

class AuthenticationProvider {
  Future<User?> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 3));
    if (email == "test@test.com" && password == "test") {
      return User(
        id: '1',
        email: 'test@test.com',
        name: 'test',
        lastname: 'lastest',
        birthday: DateTime.now(),
      );
    }

    return null;
  }

  Future<bool> register(User user) async {
    await Future.delayed(const Duration(seconds: 3));
    return true;
  }

  Future<bool> sendResetToken(String email) async {
    await Future.delayed(const Duration(seconds: 3));
    return true;
  }
}
