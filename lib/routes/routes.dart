
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/login_screen.dart';


Map<String, WidgetBuilder> getRoutes() {

  return <String, WidgetBuilder> {
    'login' : (_) => LoginScreen(),
    'home'  : (_) => HomeScreen(),
  };

}