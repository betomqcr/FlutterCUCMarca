import 'package:flutter/material.dart';

import '../widgets/widgets.dart';


class HomeScreen extends StatelessWidget {

  final List<String> nameList = <String>[
    "A123456789",
    "B123456789",
    "C123456789",
    "D123456789",
    "E123456789",
    "F123456789",
    "G123456789",
    "H123456789"
  ];
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenido"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.highlight_off_outlined),
            onPressed: () {
              
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
      
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
              child: Column(
                children: [
      
                  const InputTitleCustom(text: 'Codigo Funcionario'),
                  const SizedBox(height: 10),
                  Container(
                    child: DropdownButton(  
                      value: 'A123456789',
                      items: nameList.map(
                        (item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        },
                      ).toList(),
                      onChanged: (opt) {}
                    ),
                  ),
                 
      
                  const SizedBox(height: 10),
      
                  const InputTitleCustom(text: 'Actividad'),
                  const SizedBox(height: 10),
                  const CustomInput(
                    hintText: 'Actividad',
                    helpText: '', 
                    icon: Icons.task
                    // controller: _emailController
                  ),
      
                  // SizedBox(height: 5),
      
                  const InputTitleCustom(text: 'Comentarios'),
                  // const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.all(12),
                    height: 6 * 24.0,
                    child: TextField(
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: "Ingrese un comentario",
                        fillColor: Colors.grey[300],
                        filled: true,
                      ),
                    ),
                  ),
      
                  const CustomSingleButton(
                    title: 'Entrada', 
                    isEntrada: true,
                    // onPressed: () {}
                  ),
      
                  const CustomSingleButton(
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

List<DropdownMenuItem<String>> getOpcionesDropdowm() {

    List<DropdownMenuItem<String>> lista =[];
 
    lista.add( const DropdownMenuItem( 
      child: Text('Codigo'),
      value: 'Codigo',
    ));

    return lista;
  }