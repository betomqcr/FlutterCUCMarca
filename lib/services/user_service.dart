
part of 'services.dart';

class UserServices {

  static const storage = FlutterSecureStorage();

  static Future<bool> login(User user, BuildContext context) async {

    try {
      
      final userProvider = Provider.of<UserProvider>(context, listen: false);

      Uri url = Uri.parse(Environment.apiAuthLoginUrl);

      final dataUser = user.toJson();

      final resp = await http.post(url, 
        headers: {
          'Content-Type' : 'application/json; charset=utf-8',
        },
        body: jsonEncode(dataUser)
      );

      if (resp.statusCode == 200) {

        final decodedData = json.decode(resp.body);

        userProvider.token = decodedData;
        await storage.write(key: 'token', value: decodedData);

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

  static Future<String> readUserToken() async {

    try {
      
      return await storage.read(key: 'token') ?? '';

    } catch (e) {
      print('Error $e');
      return '';
    }
  }

}