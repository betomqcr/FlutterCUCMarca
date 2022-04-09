import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/providers.dart';
import 'package:cuc_marca_app/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: ( _ ) => UserProvider(),
        ),

        ChangeNotifierProvider(
          create: ( _ ) => MarcaProvider(),
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