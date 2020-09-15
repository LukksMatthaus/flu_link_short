import 'package:flu_link_short/services/api.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final api = API();

  String name = '';

  String email = '';

  String login = '';

  String password = '';

  setName(String n) {
    name = n;
    print(name);
  }

  setEmail(String e) {
    email = e;
    print(email);
  }

  setLogin(String l) {
    login = l;
    print(login);
  }

  setPassword(String p) {
    password = p;
    print(password);
  }

  Future<bool> register() async {
    var temp = await api.signup(name, email, login, password);
    if (temp != null)
      return Future<bool>.value(true);
    else
      return Future<bool>.value(false);
  }
}
