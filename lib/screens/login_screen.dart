import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                      padding: const EdgeInsets.only(left: 60, right: 60, top: 10),
                      width: 350,
                      child: const Image(
                        image: AssetImage('assets/logo.jpeg'),
                        height: 220,
                        fit: BoxFit.cover,
                      )
                    ),
                  ],
                ),
                
                // Body
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 50, left: 25, right: 25),
                  child: Column(
                    children: const [

                      CustomInput(
                        hintText: 'Identificacion',
                        helpText: 'Ejemplo: 101110111', 
                        icon: Icons.looks_one, 
                        // controller: _emailController
                      ),

                      SizedBox(height: 15),

                      CustomInput(
                        hintText: 'Contraseña',
                        helpText: '', 
                        icon: Icons.password, 
                        // controller: _passwordController,
                        isPassword: true,
                      ),

                      _LoginButton(
                        // email: _emailController,
                        // pass: _passwordController,
                      ),

                      SizedBox(height: 15),

                      CustomButtonNormal(
                        title: 'Olvido contraseña?', 
                        // onPressed: () {}
                      ),


                    ],
                  ),
                  // color: Colors.red,
                ), 
              ],
            )
          )
        )
      );
  }
}

class _LoginButton extends StatelessWidget {
  
  // final TextEditingController email;
  // final TextEditingController pass;

  const _LoginButton({
    Key? key, 
    // required this.email, 
    // required this.pass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    // final userProvider = Provider.of<UserProvider>(context);

    return TextButton(
      autofocus: true,
      child: Container(
        width: 250,
        height: 50,
        decoration: BoxDecoration(  
          // color: ( !userProvider.isLogin ) ? Colors.red.shade300 : Colors.grey,
          color: Colors.blue,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 5),
            )
          ]
        ),
        child: const Center(
          child: Text('Iniciar Sesion', style: TextStyle(fontSize: 20, color: Colors.white))
        )
      ),
      // onPressed: ( !userProvider.isLogin ) ? () => login( context ): null,
      onPressed: () {},
    );
  }

}