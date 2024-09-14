import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  static const String routename = 'HomePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int initialMinutes = 25;
  int minutes = 25;
  int seconds = 0;
  bool isRunning = false;
  Timer? timer;
  Color textColor = Colors.black;

  // ! function timer
  void startTime() {
    setState(() {
      isRunning = true;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (minutes == 0 && seconds == 0) {
          timer.cancel;
          isRunning = true;
        } else {
          if (seconds == 0) {
            minutes--;
            seconds = 59;
          } else {
            seconds--;
          }
        }
        if (minutes <= 0 && seconds <= 60) {
          textColor = Colors.red;
        } else {
          textColor = Colors.black;
        }
      });
    });
  }

  void resetTimer() {
    timer?.cancel();
    setState(() {
      minutes = initialMinutes;
      seconds = 0;
      isRunning = false;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121420),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Color(0xffE2E2E2),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                    style: GoogleFonts.changa(
                      fontSize: 40.5.sp,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                if (isRunning) {
                  resetTimer();
                } else {
                  startTime();
                }
              },
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all(const Size(300, 40)),
                backgroundColor:
                    WidgetStateProperty.all(const Color(0xff416de7)),
              ),
              child: Text(
                isRunning ? 'Reset' : 'Start',
                style: GoogleFonts.changa(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
