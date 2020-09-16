import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flu_link_short/models/userModel.dart';
import 'package:http/http.dart' as http;

const baseUrl = "http://secundario.logiquesistemas.com.br:8097/desafio-api";

class API {
  Future<Map<String, dynamic>> signup(
      String name, String email, String login, String password) async {
    var body = {
      'email': email,
      'login': login,
      'nome': name,
      'senha': password
    };

    final header = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    try {
      final resp = await http.post(baseUrl + '/v1/auth/cadastrar/usuario',
          headers: header, body: jsonEncode(body));
      Map<String, dynamic> respJson;
      if (resp.statusCode == 200) {
        respJson = json.decode(resp.body);

        return respJson;
      }
      return respJson = null;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserModel> login(String login, String password) async {
    var body = {'login': login, 'senha': password};
    final header = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    try {
      final resp = await http.post(baseUrl + '/v1/auth/login',
          headers: header, body: jsonEncode(body));
      if (resp.statusCode == 200) {
        print(resp.body);
        return UserModel.fromJson(json.decode(resp.body));
      } else
        return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> shrinkLink(String dest) async {
    var body = {'destination': dest};
    final header = {
      HttpHeaders.contentTypeHeader: 'application/json',
      'apikey': '5258083034ec4afa98a137df22b6fad8'
    };
    try {
      final resp = await http.post('https://api.rebrandly.com/v1/links',
          headers: header, body: jsonEncode(body));
      Map<String, dynamic> respJson;
      if (resp.statusCode == 200) {
        respJson = json.decode(resp.body);
        return respJson;
      } else
        return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> registerLink(
      String short, String original, String data, int idU, String token) async {
    print("token: " + token);
    var body = {
      "curta": short,
      "data": data,
      "idUsuario": idU,
      "original": original
    };
    final header = {
      HttpHeaders.contentTypeHeader: 'application/json',
      "Authorization": token
    };
    try {
      final resp = await http.post(baseUrl + '/v1/url',
          headers: header, body: jsonEncode(body));
      Map<String, dynamic> respJson;
      if (resp.statusCode == 201) {
        respJson = json.decode(resp.body);
        print(respJson);
        return respJson;
      } else
        return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<dynamic>> getLinks(int id, String token) async {
    final header = {
      HttpHeaders.contentTypeHeader: 'application/json',
      "Authorization": token
    };
    try {
      final resp = await http.get(baseUrl + '/v1/url/listar/' + id.toString(),
          headers: header);
      List<dynamic> respJson;
      if (resp.statusCode == 200) {
        respJson = json.decode(resp.body);
        return respJson;
      } else {
        print('entrou no else bro');
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
