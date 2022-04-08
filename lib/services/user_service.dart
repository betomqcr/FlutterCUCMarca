
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'package:cuc_marca_app/providers/user_provider.dart';
import '../global/enviroment.dart';

class UserServices {

  static Future<bool> login(BuildContext context) async {

    try {
      
      final userProvider = Provider.of<UserProvider>(context, listen: false);

      const ident = '112780286';
      const pass = 'Alberto09*';

      Uri url = Uri.parse('${ Environment.apiAuthLoginUrl}?identificacion=$ident&clave=$pass');

      final resp = await http.get(url, 
        headers: {
          'Content-Type' : 'application/json; charset=utf-8',
        },
      );
      

      if (resp.statusCode == 200) {

        final decodedData = json.decode(resp.body);

        userProvider.token = decodedData;
        // userProvider.token = decodedData['token'];
        // await storage.write(key: 'token', value: decodedData['token']);
        // userProvider.user = User.fromJson(decodedData['documents'][0]);
        // await storage.write(key: 'userID',         value: userProvider.user.uid);
        // await storage.write(key: 'identification', value: userProvider.user.identification);
        // await storage.write(key: 'name',           value: userProvider.user.name);
        // await storage.write(key: 'email',          value: userProvider.user.email);
        // await storage.write(key: 'password',       value: userProvider.user.password);
        // await storage.write(key: 'profileImage',   value: userProvider.user.profileImage);
        return true;

      } else if(resp.statusCode == 400 || resp.statusCode == 404 || resp.statusCode == 403) {

        // userProvider.msgError = decodedData['msg'];
        print('mal 1');
        return false;

      } else {
        print('mal 2');
        return false;

      }

    } catch (err) {
      print('Error: $err');
      return false;
    }

  }


}