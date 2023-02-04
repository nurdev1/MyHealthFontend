import 'package:masante/modeles/Role.dart';

class Connexion {
  int id;
  String username;
  String email;
  List<Role> roles;
 String accessToken;
  String tokenType;

  Connexion(
      {required this.id,
      required this.username,
      required this.email,
      required this.roles,
      required this.accessToken,
      required this.tokenType
      });

  factory Connexion.fromJson(Map<String, dynamic> json) {
    return Connexion(
      id: json['id'],
      username: json['username'] as String,
      email: json['email'] as String,
      //roles : json['roles'].cast<String>(),
      roles: List<Role>.from((json['roles'] as List<dynamic>).map((element) {
        return Role.fromJson(element as Map<String, dynamic>);
      })),
      accessToken: json['accessToken'],
      tokenType: json['tokenType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'roles': roles,
     'accessToken': accessToken,
      'tokenType': tokenType,
    };
  }
/* Future<String> connexion() async {
    final reponse = await http.post(ConnexionService.login, body: {});
  }*/
}
