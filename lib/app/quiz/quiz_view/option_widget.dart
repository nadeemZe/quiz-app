import 'package:flutter/material.dart';
import '../../../app_style/app_text_style.dart';


class OptionWidget extends StatelessWidget {

  final String option;
  final VoidCallback onTap;
  final Color optionColor;

  const OptionWidget({Key? key,
    required this.option,
    required this.onTap,
    required this.optionColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        alignment: Alignment.center,
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: optionColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          option,
          style: optionWidgetStyle
        ),
      ),
    );
  }
}