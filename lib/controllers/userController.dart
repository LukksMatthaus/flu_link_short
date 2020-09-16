import 'package:flu_link_short/models/linkModel.dart';
import 'package:flu_link_short/models/userModel.dart';
import 'package:flu_link_short/services/api.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final api = API();
  UserModel user;
  String tempLogin;
  String tempPass;
  LinkList linkList;

  setLogin(String l) {
    tempLogin = l;
  }

  setPass(String p) {
    tempPass = p;
  }

  Future<bool> login() async {
    user = await api.login(tempLogin, tempPass);
    if (user != null) {
      print(user);
      return Future<bool>.value(true);
    } else
      return Future<bool>.value(false);
  }

  Future<bool> getLinks() async {
    List<dynamic> lil = await api.getLinks(user.id, user.token);
    linkList = LinkList.fromJson(lil);
    print(linkList);
    return Future<bool>.value(true);
  }
}
