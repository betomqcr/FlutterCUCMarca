part of 'widgets.dart';

class CustomSingleButton extends StatelessWidget {

  final String title;
  final bool? isEntrada;
  final TextEditingController actividad;
  final TextEditingController comentarios;

  const CustomSingleButton({
    Key? key, 
    required this.title, 
    required this.actividad,
    required this.comentarios,
    this.isEntrada = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Container(
        width: 450,
        height: 50,
        decoration: BoxDecoration(  
          color: (isEntrada == true)? Colors.green : Colors.amber.shade900,
          border: Border.all(color: (isEntrada == true) ? Colors.green : Colors.red),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              (isEntrada == true) ? Icons.login : Icons.logout, 
              color: Colors.white
            ),

            const SizedBox(width: 10),

            Center(
              child: Text(title, style: const TextStyle(
                fontSize: 15, 
                color: Colors.white
              ))
            ),

          ],
        )
         
      ),
      onPressed: () {

        if(isEntrada == true) {
          marcaEntrada(context, actividad, comentarios);
        } else {
          marcaSalida(context, actividad, comentarios);
        }

      }
    );
  }
}

void marcaEntrada(BuildContext context, TextEditingController actividad, TextEditingController comentarios) async {

  final marcaProvider = Provider.of<MarcaProvider>(context, listen: false);
  final userProvider = Provider.of<UserProvider>(context, listen: false);

  if(comentarios.text.isEmpty || actividad.text.isEmpty || marcaProvider.areaSelected.id == null) {
    showAlert(
      context: context, 
      title: 'Error', 
      subTitle: 'Debe ingresar una area, actividad y un comentario', 
      status: StatusAlert.Error,
      isValidation: true,
    );
    return;
  }

  marcaProvider.isLoading = true;
  
  final user = Marca(
    codigoFuncionario:userProvider.user.identificacion,
    areaId: marcaProvider.areaSelected.id,
    tipoMarca: 'E',
    actividad: actividad.text,
    comentarios: comentarios.text,
    contrasena: userProvider.user.contrasea,
    direccionIp: '',
    latitud: 0,
    longitud: 0,
  );
  final resp = await MarcaServices.marcar(user, context);

  if ( resp ) {

    actividad.text = '';
    comentarios.text = '';

    showAlert(
      context  : context, 
      title    : 'Marca Entrada', 
      subTitle : 'Su marca ha sido registrada', 
      status   : StatusAlert.Success,
      pageOk   : 'home',
    );

  } else {

    showAlert(
      context    : context, 
      title      : 'Marca Entrada', 
      subTitle   : 'Error: Por favor revise los campos e intente nuevamente', 
      status     : StatusAlert.Error,
      pageCancel : 'home',
    );

  }

  marcaProvider.isLoading = false;
}

void marcaSalida(BuildContext context, TextEditingController actividad, TextEditingController comentarios) async {

  if(comentarios.text.isEmpty || actividad.text.isEmpty) {
    showAlert(
      context: context, 
      title: 'Error', 
      subTitle: 'Debe ingresar una actividad y un comentario', 
      status: StatusAlert.Error
    );
    return;
  }

  final marcaProvider = Provider.of<MarcaProvider>(context, listen: false);
  final userProvider = Provider.of<UserProvider>(context, listen: false);

  marcaProvider.isLoading = true;
  
  final user = Marca(
    codigoFuncionario:userProvider.user.identificacion,
    areaId: marcaProvider.areaSelected.id,
    tipoMarca: 'S',
    actividad: actividad.text,
    comentarios: comentarios.text,
    contrasena: userProvider.user.contrasea,
    direccionIp: '',
    latitud: 0,
    longitud: 0,
  );
  final resp = await MarcaServices.marcar(user, context);

  if ( resp ) {

    actividad.text = '';
    comentarios.text = '';

    showAlert(
      context  : context, 
      title    : 'Marca Salida', 
      subTitle : 'Su marca ha sido registrada', 
      status   : StatusAlert.Success,
      pageOk   : 'home',
    );

  } else {

    showAlert(
      context    : context, 
      title      : 'Marca Salida', 
      subTitle   : 'Error: Por favor revise los campos e intente nuevamente', 
      status     : StatusAlert.Error,
      pageCancel : 'home',
    );

  }

  marcaProvider.isLoading = false;
}