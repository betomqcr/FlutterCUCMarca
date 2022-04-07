import 'package:flutter/material.dart';

import 'package:cuc_marca_app/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'CUC Marca',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: getRoutes(),
    );
  }
}