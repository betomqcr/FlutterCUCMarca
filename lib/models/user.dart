// To parse this JSON data, do
//
//     final User = userFromJson(jsonString);

part of 'models.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({this.identificacion, this.contrasea});

  String? identificacion;
  String? contrasea;

  User.empty();

  factory User.fromJson(Map<String, dynamic> json) => User(
        identificacion: json["Identificacion"],
        contrasea: json["Contraseña"],
      );

  Map<String, dynamic> toJson() => {
        "Identificacion": identificacion,
        "Contraseña": contrasea,
      };
}
