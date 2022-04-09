
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';
import 'package:cuc_marca_app/models/models.dart';


class HomeScreen extends StatelessWidget {

  final TextEditingController _actividadController = new TextEditingController();
  final TextEditingController _comentariosController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    final userProvider = Provider.of<UserProvider>(context);
    final marcaProvider = Provider.of<MarcaProvider>(context);

    final areas = marcaProvider.areas;

    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido ${userProvider.user.identificacion}'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.highlight_off_outlined),
            onPressed: () {
              Navigator.pushNamed(context, 'login');
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
      
                  const InputTitleCustom(text: 'Codigo Area'),
                  const SizedBox(height: 10),
                  Container(
                    child: DropdownButton(  
                      value: areas[0].nombreArea,
                      items: areas.map(
                        (item) {
                          return DropdownMenuItem(
                            value: item.nombreArea,
                            child: Text(item.nombreArea ?? 'No Area'),
                          );
                        },
                      ).toList(),
                      onChanged: (opt) {
                        final marcaProvider = Provider.of<MarcaProvider>(context, listen: false);
                        marcaProvider.areaSelected = findArea(opt.toString(), areas);
                      }
                    ),
                  ),
                 
                  const SizedBox(height: 10),
      
                  const InputTitleCustom(text: 'Actividad'),
                  const SizedBox(height: 10),
                  CustomInput(
                    hintText: 'Actividad',
                    helpText: '', 
                    icon: Icons.task,
                    controller: _actividadController
                  ),
      
                  // SizedBox(height: 5),
      
                  const InputTitleCustom(text: 'Comentarios'),
                  // const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.all(12),
                    height: 6 * 24.0,
                    child: TextField(
                      controller: _comentariosController,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: "Ingrese un comentario",
                        fillColor: Colors.grey[300],
                        filled: true,
                      ),
                    ),
                  ),
      
                  CustomSingleButton(
                    title: 'Entrada', 
                    isEntrada: true,
                    actividad: _actividadController,
                    comentarios: _comentariosController,
                  ),
      
                  CustomSingleButton(
                    title: 'Salida', 
                    actividad: _actividadController,
                    comentarios: _comentariosController,
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

Area findArea(String namearea, List<Area> areas) {

  for (Area area in areas) {
    if (area.nombreArea == namearea) {
      return area;
    }
  }

  return Area.empty();
}
