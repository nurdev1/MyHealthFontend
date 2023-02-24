import 'dart:convert';

import 'package:masante/AllFile/global/LaisonBankend.dart';
import 'package:http/http.dart' as http;

class ConnexionService{

  static const String api = "http://localhost:8082";
  static const String login = "$api/api/auth/signin";

  static Future<bool> LoginUser(String username, String password) async {
    Map data = {'username': username, 'password': password};
    // const _url = Uri.parse(_baseUrl + '/auth/signin');
    var body = jsonEncode(data);
    var url = Uri.parse('$masante +/api/auth/signin');
    var response = await http.post(url, body: body, headers: headers);
    if (response.statusCode == 200) {
      var loginArr = json.decode(response.body);
      var name = json.decode(response.body);
      var firstname = json.decode(response.body);
      var mail = json.decode(response.body);
      nomUser = name['nom'];
      print(nomUser);
      prenomUser = firstname['prenom'];
      print(prenomUser);
      emailUser = mail['email'];
      print(emailUser);
      idUser = loginArr['id'];
      print(loginArr['id']);
      return true;
    } else {
      print(response.body);
      throw ('erreur de connexion');
    }
  }
}