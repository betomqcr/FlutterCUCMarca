import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';

import 'package:cuc_marca_app/helpers/showAlert.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _identificacionController =
      new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        body: LoadingOverlay(
      isLoading: userProvider.isLogin,
      child: Center(
          child: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  color: Colors.blue,
                ),
                Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.only(left: 60, right: 60, top: 10),
                    width: 350,
                    child: const Image(
                      image: AssetImage('assets/logo.jpeg'),
                      height: 220,
                      fit: BoxFit.cover,
                    )),
              ],
            ),

            // Body
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 50, left: 25, right: 25),
              child: Column(
                children: [
                  CustomInput(
                      hintText: 'Identificacion',
                      helpText: 'Ejemplo: 101110111',
                      icon: Icons.looks_one,
                      controller: _identificacionController),
                  const SizedBox(height: 15),
                  CustomInput(
                    hintText: 'Contrase??a',
                    helpText: '',
                    icon: Icons.password,
                    controller: _passwordController,
                    isPassword: true,
                  ),
                  _LoginButton(
                    identificacion: _identificacionController,
                    pass: _passwordController,
                  ),
                  const SizedBox(height: 15),
                  const CustomButtonNormal(
                    title: 'Olvido contrase??a?',
                    // onPressed: () {}
                  ),
                ],
              ),
              // color: Colors.red,
            ),
          ],
        )),
      )),
    ));
  }
}

class _LoginButton extends StatelessWidget {
  final TextEditingController identificacion;
  final TextEditingController pass;

  const _LoginButton({
    Key? key,
    required this.identificacion,
    required this.pass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return TextButton(
        autofocus: true,
        child: Container(
            width: 250,
            height: 50,
            decoration: BoxDecoration(
                color: (!userProvider.isLogin) ? Colors.blue : Colors.grey,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 5),
                  )
                ]),
            child: const Center(
                child: Text('Iniciar Sesion',
                    style: TextStyle(fontSize: 20, color: Colors.white)))),
        onPressed: () async {
          LocationPermission permission = await Geolocator.checkPermission();
          if (permission == LocationPermission.denied) {
            permission = await Geolocator.requestPermission();
          }

          if (permission == LocationPermission.denied ||
              permission == LocationPermission.deniedForever) {
            showAlert(
              context: context,
              title: 'Error',
              subTitle:
                  'Para usar esta aplicacion debe dar permisos sobre el GPS',
              status: StatusAlert.Error,
              isValidation: true,
            );
            return;
          }

          Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);
          final marcaProvider =
              Provider.of<MarcaProvider>(context, listen: false);
          marcaProvider.latitud = position.latitude.toString();
          marcaProvider.longitud = position.longitude.toString();
          if (identificacion.text.isEmpty || pass.text.isEmpty) {
            showAlert(
              context: context,
              title: 'Error',
              subTitle: 'Debe ingresar una identificacion y una contrase??a',
              status: StatusAlert.Error,
              isValidation: true,
            );
            return;
          }

          final userProvider =
              Provider.of<UserProvider>(context, listen: false);
          userProvider.isLogin = true;

          final user =
              User(identificacion: identificacion.text, contrasea: pass.text);
          final resp = await UserServices.login(user, context);

          if (resp) {
            userProvider.user = user;
            await MarcaServices.getAllAreas(user.identificacion ?? '', context);
            Navigator.pushReplacementNamed(context, 'home');
          } else {
            showAlert(
                context: context,
                title: 'Error',
                subTitle: 'Credenciales incorrectas',
                status: StatusAlert.Error,
                isLogin: true);
          }

          userProvider.isLogin = false;

          //print(position);
        });
  }
}
