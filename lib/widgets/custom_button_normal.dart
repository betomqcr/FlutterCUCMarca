part of 'widgets.dart';

class CustomButtonNormal extends StatelessWidget {

  final String title;
  // final Function onPressed;

  const CustomButtonNormal({
    Key? key, 
    required this.title, 
    // required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Container(
        width: 450,
        height: 50,
        decoration: BoxDecoration(  
          color: Colors.white,
          border: Border.all(color: Colors.blue),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Center(
          child: Text(title, style: const TextStyle(fontSize: 15, color: Colors.blue))
        )
      ),
      onPressed: () {}
    );
  }
}