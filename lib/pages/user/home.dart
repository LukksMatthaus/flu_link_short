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
  Future fetchLinks;
  @override
  void initState() {
    super.initState();
    fetchLinks = userController.getLinks();
  }

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

    //below you can get your result and update the view with setState
    //changing the value if you want, i just wanted know if i have to
    //update, and if is true, reload state

    if (result != null) {
      setState(() {});
    }
  }

  Widget buildList(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
}
