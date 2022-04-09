part of 'models.dart';

// To parse this JSON data, do
//
//     final area = areaFromJson(jsonString);

List<Area> areaFromJson(String str) => List<Area>.from(json.decode(str).map((x) => Area.fromJson(x)));

String areaToJson(List<Area> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Area {
    Area({
        this.codigoFuncionario,
        this.nombreArea,
        this.id,
    });

    String? codigoFuncionario;
    String? nombreArea;
    int? id;

    Area.empty();

    factory Area.fromJson(Map<String, dynamic> json) => Area(
        codigoFuncionario: json["CodigoFuncionario"],
        nombreArea: json["NombreArea"],
        id: json["id"],
    );

    static List<Area> fromJsonList( List<dynamic> jsonList  ) {

      List<Area> areas = [];

      for ( var item in jsonList  ) {
        areas.add( Area.fromJson(item) );
      }

      return areas;

    }

    Map<String, dynamic> toJson() => {
        "CodigoFuncionario": codigoFuncionario,
        "NombreArea": nombreArea,
        "id": id,
    };
}
