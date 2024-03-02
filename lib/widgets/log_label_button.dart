import 'package:flutter/material.dart';
import '../app_style/app_text_style.dart';


class LogLabelButton extends StatelessWidget {

  final VoidCallback onTap;
  final String title;
  final String subTitle;

  const LogLabelButton({Key? key, required this.onTap, required this.title, this.subTitle = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: logLabelButtonStyle
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              subTitle,
              style: logLabelButtonStyle1
            ),
          ],
        ),
      ),
    );
  }
}