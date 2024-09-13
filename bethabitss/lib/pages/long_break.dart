import 'dart:async';

import 'package:bethabitss/pages/home.dart';
import 'package:bethabitss/pages/short_break.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LongBreak extends StatefulWidget {
  const LongBreak({super.key});

  @override
  State<LongBreak> createState() => _LongBreakState();
}

class _LongBreakState extends State<LongBreak> {
  int initialMinutes = 15;
  int minutes = 15;
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
    timer?.cancel;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            actions: [
              TextButton(
                onPressed: () {}, 
                child: const Icon(Icons.settings)
              ),
            ],
            title: Text(
              'Pomodoro',
              style: GoogleFonts.merienda(
                fontSize: 22.sp,
              ),
            ),
            backgroundColor: const Color(0xffE7BB41),
          )),
      backgroundColor: const Color(0xff121420),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                TextButton(
                  onPressed: () {
                     print('Click1');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  child: Text(
                    'POMO',
                    style: GoogleFonts.changa(color: Colors.white),
                  ),
                  style: ButtonStyle(),
                ),
                TextButton(
                    onPressed: () {
                      print('Click');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShortBreak()
                        )
                      );
                    },
                    child: Text('SHORT BREAK')),
                TextButton(onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LongBreak()));
                    
                }, 
                child: Text('LONG BREAK')),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
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
              child: Text(
                isRunning ? 'Reset' : 'Start',
                style: GoogleFonts.changa(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                ),
              ),
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all(Size(300, 40)),
                backgroundColor: WidgetStateProperty.all(Color(0xff416de7)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
