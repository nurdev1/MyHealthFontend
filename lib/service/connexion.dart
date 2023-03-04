import 'dart:convert';

import 'package:masante/AllFile/global/LaisonBankend.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
  ////////////////////////////////////////////////////////////////
  //SIGN IN

  var client = http.Client();
  Future<String> signin(String username, String password) async {
    var url = Uri.parse('$masante/signin');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = jsonEncode(
        {'username': username, 'password': password});
    Map<String, String> headers = {"Content-Type": "application/json"};
    var response = await client.post(url, body: data, headers: headers);

    if (response.statusCode == 200) {
      prefs.setBool("loggedIn", true);
      connecte = true;
      Map<String, dynamic> json = jsonDecode(response.body);
      prefs.setString("token", json['accessToken']);
      token = json['accessToken'];
      prefs.setInt("id", json['id']);
      //prefs.setString("profil", json['image']);
      id = json['id'];
      print("mon id");
      print(id);
      connexion = true;
      return "Bienvenue ${json['username']} !".toUpperCase();

    } else {
      //throw ("Can't get the Articles");
      return "Nom d'utilisateur ou mot de passe incorrect !";
    }
  }
  ///////////////////////////////////////////////////////////////////
  //Get user
  Future<Map<String,dynamic>> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? UID = prefs.getInt("id");

    String? token = prefs.getString("token");
    //Get the item from the API
    var url = Uri.parse('$masante/user/$UID');
    var headers = {
      "Authorization": "Bearer $token"
    };
    http.Response response = await http.get(url,
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      Map<String,dynamic> item = {};
      //get the data from the response
      String jsonString = response.body;
      var jsonByte = response.bodyBytes;

      //Convert to List<Map>
      item = json.decode(utf8.decode(jsonByte));
      prefs.setString("profil", item['image']);
      return item;
    } else {
      throw ("Liste introuvable : ${response.body}");
    }
  }
  //auth
  bool connexion = true;
  bool connecte = false;
  String token = '';
  int id = 0;
  String photo = '';
}