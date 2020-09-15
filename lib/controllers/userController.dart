import 'package:flu_link_short/models/userModel.dart';
import 'package:flu_link_short/services/api.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final api = API();
  UserModel user;
  String tempLogin;
  String tempPass;

  setLogin(String l) {
    tempLogin = l;
  }

  setPass(String p) {
    tempPass = p;
  }

  login() async {
    user = await api.login(tempLogin, tempPass);
    if (user.token?.isNotEmpty ?? true) {
      return true;
    } else
      return false;
  }
}
