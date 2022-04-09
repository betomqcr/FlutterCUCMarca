
part of 'services.dart';

class MarcaServices {

  static Future<bool> getAllAreas(String identificador, BuildContext context) async {

    try {
      
      final marcaProvider = Provider.of<MarcaProvider>(context, listen: false);

      Uri url = Uri.parse('${Environment.apiAreasUrl}/$identificador');

      final resp = await http.get(url, 
        headers: {
          'Content-Type' : 'application/json; charset=utf-8',
        },
      );

      if (resp.statusCode == 200) {

        final decodedData = json.decode(resp.body);

        marcaProvider.areas = Area.fromJsonList(decodedData);
        return true;

      } else if(resp.statusCode == 400 || resp.statusCode == 404 || resp.statusCode == 403) {
        return false;
      } else {
        return false;
      }

    } catch (err) {
      print('Error: $err');
      return false;
    }

  }

  static Future<bool> marcar(Marca marca, BuildContext context) async {

    try {
      
      Uri url = Uri.parse(Environment.apiMarcaUrl);

      final token = await UserServices.readUserToken();

      final resp = await http.post(url, 
        headers: {
          'Content-Type' : 'application/json; charset=utf-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(marca.toJson()),
      );

      if (resp.statusCode == 201) {
        
        return true;

      } else if(resp.statusCode == 400 || resp.statusCode == 404 || resp.statusCode == 403) {
        return false;
      } else {
        return false;
      }

    } catch (err) {
      print('Error: $err');
      return false;
    }

  }

}