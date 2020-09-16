import 'package:flu_link_short/controllers/userController.dart';
import 'package:flu_link_short/ui/modal_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserController userController = Get.find();
  Future fetchLinks;
  @override
  void initState() {
    super.initState();
    fetchLinks = userController.getLinks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ModalAppBar(title: "Short Link", leading: false),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _goToAddPage(context);
          },
          backgroundColor: Color(0xfffbb448),
          elevation: 2,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: buildList(context));
  }

  _goToAddPage(BuildContext context) async {
    final result = await Get.toNamed('/registerLink');

    if (result != null) {
      setState(() {});
    }
  }

  Widget buildList(BuildContext context) {
    final List<PopupMenuItem<int>> popupMenuItems = [];
    popupMenuItems.add(PopupMenuItem<int>(value: 0, child: Text('Delete')));
    return FutureBuilder(
      future: userController.getLinks(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Color(0xfffbb448),
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Color(0xfff7892b)),
                ),
              ),
            );
          default:
            if (!snapshot.hasData) {
              return Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Color(0xfffbb448),
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Color(0xfff7892b)),
                  ),
                ),
              );
            } else {
              return SingleChildScrollView(
                  child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 800,
                    child: ListView.builder(
                      itemCount: userController.linkList.links.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding:
                              EdgeInsets.only(left: 16, bottom: 10, top: 10),
                          isThreeLine: true,
                          title: Text(
                              "${userController.linkList.links[index].shortLink}"),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                  "Destino: ${userController.linkList.links[index].original}"),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                  "Data de criação: ${userController.linkList.links[index].data}")
                            ],
                          ),
                          trailing: popupMenuItems.isNotEmpty
                              ? PopupMenuButton<int>(
                                  onSelected: (value) {
                                    switch (value) {
                                      case 0:
                                        deleteLink(userController
                                            .linkList.links[index].id);
                                        break;
                                      default:
                                    }
                                  },
                                  itemBuilder: (context) => popupMenuItems,
                                )
                              : Container(
                                  height: 1,
                                  width: 1,
                                ),
                        );
                      },
                    ),
                  )
                ],
              ));
            }
        }
      },
    );
  }

  deleteLink(int id) async {
    Get.defaultDialog(
        onConfirm: () {
          userController.deleteLinks(id).then((value) {
            setState(() {});
          });
          Get.back();
        },
        onCancel: () => print('cancelado'),
        title: "Confirmação de remoção",
        textConfirm: "Sim",
        confirmTextColor: Colors.white,
        radius: 6,
        textCancel: "Não",
        middleText: "Deseja realmente excluir esse link?");
  }
}
