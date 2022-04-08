part of 'widgets.dart';

class CustomSingleButton extends StatelessWidget {

  final String title;
  final bool? isEntrada;
  // final Function onPressed;

  const CustomSingleButton({
    Key? key, 
    required this.title, 
    this.isEntrada = false,
    // required this.onPressed,
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
      onPressed: () {}
    );
  }
}