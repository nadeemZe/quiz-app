import 'package:flutter/material.dart';
import '../app_style/app_text_style.dart';

class LogButton extends StatelessWidget{

  final VoidCallback onPressed;
  final String text;
  final Color color;

  const LogButton({Key? key,required this.onPressed,required this.text,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width/1.7,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12)),
              backgroundColor: MaterialStateProperty.all(color),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
          ),
          child: Text(
            text,
            style: logButtonStyle
          )
      ),
    );
  }
}