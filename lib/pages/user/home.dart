import 'package:flu_link_short/controllers/userController.dart';
import 'package:flu_link_short/ui/bezierContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text("Short Link"),
        centerTitle: true,
        backgroundColor: Color(0xfffbb448),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/registerLink');
        },
        backgroundColor: Color(0xfffbb448),
        elevation: 2,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
              height: height,
              child: Column(
                children: [],
              ))),
    );
  }
}
