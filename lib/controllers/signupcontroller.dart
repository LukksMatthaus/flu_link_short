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

  Future<void> register() async {
    var temp = await api.signup(name, email, login, password);
    print(temp);
  }
}
