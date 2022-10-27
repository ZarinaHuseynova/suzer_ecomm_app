import 'dart:async';

import 'package:flutter/material.dart';
import 'package:suzer_ecom_appp/global/constants/app_colors.dart';

class CountdownPageState extends StatefulWidget {
  const CountdownPageState({super.key});

  @override
  State<CountdownPageState> createState() => _CountdownPageStateState();
}

class _CountdownPageStateState extends State<CountdownPageState> {
  static const countdownDuration = Duration(minutes: 10);
  Duration duration = const Duration();
  Timer? timer;
  bool isCountdown = true;

  @override
  void initState() {
    super.initState();

    startTimer();
    reset();
  }

  void reset() {
    if (isCountdown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = const Duration());
    }
  }

  void addTime() {
    final addSeconds = isCountdown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      if (seconds < 0) {
        timer?.cancel();
      }else{
      duration = Duration(seconds: seconds);
      }

    });
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => addTime(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: buildTime()),
    );
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTimeCard(time: hours, header: " Hours"),
        const SizedBox(
          width: 8,
        ),
        buildTimeCard(time: minutes, header: " Minutes"),
        const SizedBox(
          width: 8,
        ),
        buildTimeCard(time: seconds, header: "Seconds"),
      ],
    );
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          time,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
            fontSize: 30,
          ),
        ),
      );
}
