part of 'widgets.dart';

class CustomInput extends StatelessWidget {

  final String helpText;
  final String? hintText;
  final IconData icon;
  final TextEditingController? controller;
  final bool? enable;
  final bool? isPassword;
  
  const CustomInput({
    Key? key, 
    required this.helpText, 
    required this.icon, 
    this.controller,
    this.enable = true,
    this.hintText = '',
    this.isPassword = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(  
        controller: controller,
        textCapitalization: TextCapitalization.sentences,
        autofocus: false,
        cursorColor: Colors.red.shade300,
        obscureText: isPassword ?? false,
        decoration: InputDecoration( 
          focusedBorder: OutlineInputBorder(  
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Colors.blue, width: 2.0)
          ),
          border: OutlineInputBorder(  
            borderRadius: BorderRadius.circular(15.0),
          ),
          helperText: helpText,
          hintText: hintText,
          prefixIcon: Icon(icon, color: Colors.blue),
          enabled: enable ?? true
        ),
      ),
    );
  }
}