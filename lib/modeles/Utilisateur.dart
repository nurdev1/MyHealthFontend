class User {
  String username;
  String password;
  String email;

  User({required this.username, required this.password, required this.email});


  factory User.fromJson(Map<String, dynamic> json) {

    return User(
      username : json['username'],
    password : json['password'],
    email : json['email'],);
  }

  Map<String, dynamic> toJson() {
   return {
      'username' : username,
      'password' : password,
      'email' : email,
    };
  }

}