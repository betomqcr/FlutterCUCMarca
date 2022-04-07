import 'package:flutter/material.dart';

import '../widgets/widgets.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
      
            Stack(
              children: [
      
                Container(
                  height: 110,
                  width: double.infinity,
                  color: Colors.blue,
                ),
      
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
                  padding: const EdgeInsets.only(left: 50),
                  width: 350,
                  child: const Text(
                    'Bienvenido', 
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    )
                  )
                ),             
      
              ],
            ),
            
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
              child: Column(
                children: const [
      
                  InputTitleCustom(text: 'Codigo Funcionario'),
                  SizedBox(height: 10),
                  CustomInput(
                    hintText: 'Codigo',
                    helpText: '', 
                    icon: Icons.looks_one, 
                    // controller: _emailController
                  ),
      
                  // SizedBox(height: 5),
      
                  InputTitleCustom(text: 'Actividad'),
                  SizedBox(height: 10),
                  CustomInput(
                    hintText: 'Actividad',
                    helpText: '', 
                    icon: Icons.looks_one, 
                    // controller: _emailController
                  ),
      
                  // SizedBox(height: 5),
      
                  InputTitleCustom(text: 'Comentarios'),
                  SizedBox(height: 10),
                  CustomInput(
                    hintText: 'Comentarios',
                    helpText: '', 
                    icon: Icons.looks_one, 
                    // controller: _emailController
                  ),
      
                  CustomSingleButton(
                    title: 'Entrada', 
                    // onPressed: () {}
                  ),
      
                  CustomSingleButton(
                    title: 'Salida', 
                    // onPressed: () {}
                  ),
                ],
              ),
              // color: Colors.red,
            ),
      
          ],
        ),
      )
   );
  }
}