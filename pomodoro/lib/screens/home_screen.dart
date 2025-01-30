import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const SECONDS = 1500;
  int totalSecond = SECONDS;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer;

  void onTick() {
    if (totalSecond == 0) {
      setState(() {
        totalPomodoros += 1;
        isRunning = false;
        totalSecond = SECONDS;
      });
      onPausePressed();
    } else {
      setState(() {
        totalSecond -= 1;
      });
    }
  }

  void onRestartPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalSecond = SECONDS;
    });
  }

  String format(int seconrds) {
    var duration = Duration(seconds: seconrds);
    var timeElement = duration.toString().split(".")[0].split(":");
    //print(timeElement);
    return "${timeElement[1]} : ${timeElement[2]}";
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onStartPressed() {
    isRunning = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      onTick();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  format(totalSecond),
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: isRunning
                          ? IconButton(
                              icon: const Icon(Icons.pause),
                              onPressed: onPausePressed,
                              iconSize: 120,
                              color: Theme.of(context).cardColor,
                            )
                          : IconButton(
                              icon: const Icon(Icons.play_circle_outline),
                              onPressed: onStartPressed,
                              iconSize: 120,
                              color: Theme.of(context).cardColor,
                            ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.restore),
                          onPressed: onRestartPressed,
                        ),
                        const Text("Reset Timer")
                      ],
                    ),
                  ]),
            ),
            Flexible(
              flex: 1,
              child: Row(children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodoros",
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.color,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "$totalPomodoros",
                          style: TextStyle(
                              fontSize: 60,
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.color,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            )
          ],
        ));
  }
}
