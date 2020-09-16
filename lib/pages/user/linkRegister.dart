import 'package:flu_link_short/controllers/linkRegisterController.dart';
import 'package:flu_link_short/controllers/userController.dart';
import 'package:flu_link_short/ui/gradient_button.dart';
import 'package:flu_link_short/ui/modal_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LinkRegisterPage extends StatefulWidget {
  @override
  _LinkRegisterPageState createState() => _LinkRegisterPageState();
}

class _LinkRegisterPageState extends State<LinkRegisterPage> {
  UserController userController = Get.find();
  LinkRegisterController linkController = Get.find();
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  Widget _entryField(String title,
      {bool isPassword = false, Function onChanged}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              onChanged: onChanged,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return GradientButton('Shrink link!', () {
      linkController
          .registerLink(userController.user.id, userController.user.token)
          .then((value) async {
        if (value == true) {
          await _btnController.success();
          Get.back();
        } else {
          await _btnController.error();
          _btnController.reset();
        }
      });
    }, 0xfffbb448, 0xfff7892b, 250, 250, _btnController);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: ModalAppBar(title: 'Link Registration', leading: true),
      body: SingleChildScrollView(
          child: Container(
        height: height,
        margin: EdgeInsets.only(left: 10),
        child: Column(
          children: [
            SizedBox(height: 50),
            _entryField('Link', onChanged: linkController.setDest),
            SizedBox(height: 20),
            _submitButton()
          ],
        ),
      )),
    );
  }
}
