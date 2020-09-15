class UserModel {
  int id;
  String nome;
  String email;
  String login;
  String token;

  UserModel({this.id, this.nome, this.email, this.login, this.token});

  factory UserModel.fromJson(Map json) {
    return UserModel(
        id: json['detalhesUsuario']['id'],
        nome: json['detalhesUsuario']['nome'],
        email: json['detalhesUsuario']['email'],
        login: json['detalhesUsuario']['login'],
        token: json['token']);
  }
}
