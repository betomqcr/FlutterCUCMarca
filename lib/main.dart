import 'package:cuc_marca_app/providers/user_provider.dart';
import 'package:flutter/material.dart';

import 'package:cuc_marca_app/routes/routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: ( _ ) => UserProvider(),
        ),

      ],
      child: MaterialApp(
        title: 'CUC Marca',
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: getRoutes(),
      ),
    );
  }
}