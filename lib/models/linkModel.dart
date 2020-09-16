class Link {
  String shortLink;
  String data;
  int id;
  String original;

  Link({this.shortLink, this.data, this.id, this.original});

  factory Link.fromJson(Map<String, dynamic> doc) {
    return new Link(
        shortLink: doc['curta'],
        data: doc['data'],
        id: doc['id'],
        original: doc['original']);
  }
}

class LinkList {
  final List<Link> links;

  LinkList({this.links});

  factory LinkList.fromJson(List<dynamic> parsedDoc) {
    List<Link> lin = new List<Link>();
    lin = parsedDoc.map((i) => Link.fromJson(i)).toList();
    return new LinkList(links: lin);
  }
}
