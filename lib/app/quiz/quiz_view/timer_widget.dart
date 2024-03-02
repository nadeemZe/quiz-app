import 'package:flutter/material.dart';
import 'dart:async';
import '../../../app_style/app_text_style.dart';


class TimerWidget extends StatefulWidget{
  const TimerWidget({super.key});
  static String? minutes;
  static String? seconds;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {

  Timer? timer;
  Duration duration = const Duration();

  void addTime() {
    const addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
        buildTime();
      }
    });
  }
  String twoDigits(int n) => n.toString().padLeft(2, '0');

  buildTime(){
     TimerWidget.minutes = twoDigits(duration.inMinutes.remainder(60));
     TimerWidget.seconds = twoDigits(duration.inSeconds.remainder(60));
  }


  @override
  void initState(){
    super.initState();
    timer = Timer.periodic(const Duration(seconds:1), (_) => addTime(),);

  }

  @override
  void dispose() {
    timer?.cancel();
    TimerWidget.minutes='';
    TimerWidget.seconds='';
    super.dispose();
  }

  @override
  Widget build (BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          TimerWidget.minutes??'00',
          style: currentIndexStyle,
        ),
        Text(
          ':',
          style: currentIndexStyle,
        ),
        Text(
          TimerWidget.seconds??'00',
          style: currentIndexStyle,
        ),
      ],
    );
  }
}