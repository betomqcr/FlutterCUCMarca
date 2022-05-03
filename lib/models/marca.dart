part of 'models.dart';

Marca marcaFromJson(String str) => Marca.fromJson(json.decode(str));

String marcaToJson(Marca data) => json.encode(data.toJson());

class Marca {
  Marca({
    this.codigoFuncionario,
    this.areaId,
    this.tipoMarca,
    this.actividad,
    this.comentarios,
    this.contrasena,
    this.direccionIp,
    this.latitud,
    this.longitud,
  });

  String? codigoFuncionario;
  int? areaId;
  String? tipoMarca;
  String? actividad;
  String? comentarios;
  String? contrasena;
  String? direccionIp;
  String? latitud;
  String? longitud;

  factory Marca.fromJson(Map<String, dynamic> json) => Marca(
        codigoFuncionario: json["CodigoFuncionario"],
        areaId: json["AreaID"],
        tipoMarca: json["TipoMarca"],
        actividad: json["Actividad"],
        comentarios: json["Comentarios"],
        contrasena: json["Contrasena"],
        direccionIp: json["DireccionIP"],
        latitud: json["Latitud"],
        longitud: json["Longitud"],
      );

  Map<String, dynamic> toJson() => {
        "CodigoFuncionario": codigoFuncionario,
        "AreaID": areaId,
        "TipoMarca": tipoMarca,
        "Actividad": actividad,
        "Comentarios": comentarios,
        "Contrasena": contrasena,
        "DireccionIP": direccionIp,
        "Latitud": latitud,
        "Longitud": longitud,
      };
}
