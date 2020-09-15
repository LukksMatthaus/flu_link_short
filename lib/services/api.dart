import 'dart:async';
import 'dart:convert';
import 'dart:io';
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
      Map<String, dynamic> respJson = json.decode(resp.body);
      return respJson;
    } catch (e) {
      throw Exception(e);
    }
  }
}
