import 'package:flu_link_short/models/linkModel.dart';
import 'package:flu_link_short/services/api.dart';
import 'package:get/get.dart';

class LinkRegisterController extends GetxController {
  final api = API();

  String dest;
  Link link;
  setDest(d) {
    dest = d;
  }

  Future<bool> registerLink(int id, String token) async {
    var temp = await api.shrinkLink(dest);
    if (temp != null) {
      link = new Link(
          data: DateTime.now().toUtc().toIso8601String(),
          shortLink: 'https://' + temp['shortUrl'],
          original: dest);
      print(link.data);
      print(link.shortLink);
      print(link.original);

      var temp2 = await api.registerLink(
          link.shortLink, link.original, link.data, id, token);
      if (temp2 != null)
        return Future<bool>.value(true);
      else
        return Future<bool>.value(false);
    } else
      return Future<bool>.value(false);
  }
}
