import 'dart:async';
import 'package:bethabitss/pages/long_break.dart';
import 'package:bethabitss/pages/short_break.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  String? userEmail; // * Get email of user
  int initialMinutes = 25;
  int minutes = 25;
  int seconds = 0;
  bool isRunning = false;
  Timer? timer;
  Color textColor = Colors.black;
  // ! function utils
  void initState() {
    super.initState();
    getUserEmail();
  }

  void getUserEmail() {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      userEmail = user?.email;
    });
  }

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
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                icon: Icon(Icons.menu)),
            actions: [
              TextButton(onPressed: () {}, child: const Icon(Icons.settings)),
            ],
            title: Text(
              'Pomodoro',
              style: GoogleFonts.merienda(
                fontSize: 22.sp,
              ),
            ),
            backgroundColor: const Color(0xffE7BB41),
          )),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Material(
                color: Colors.redAccent,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                      bottom: 24,
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 65.5,
                          backgroundImage: NetworkImage(
                              'https://easy-peasy.ai/cdn-cgi/image/quality=80,format=auto,width=700/https://fdczvxmwwjwpwbeeqcth.supabase.co/storage/v1/object/public/images/5f1cf06e-289e-4b00-9fea-ef97aa96f365/bd3e14c9-24c6-49ff-99d1-8e502c1a64fe.png'),
                        ),
                        SizedBox(
                          height: 1.5.w,
                        ),
                        Text(
                          '${userEmail}',
                          style: GoogleFonts.roboto(fontSize: 18.2.sp),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(19.5),
                    child: Row(
                      children: [
                        Text(
                          'STUDY METHODS',
                          style: GoogleFonts.poppins(
                              fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.timelapse_outlined),
                    title: Text('POMODORO'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.timelapse_sharp),
                    title: Text('LONG BREAK'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.timelapse_sharp),
                    title: Text('SHORT BREAK'),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.mode_night_outlined),
                    title: Text('Mode'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.contact_mail_outlined),
                    title: Text('Contact'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.logout_outlined),
                    title: Text('GO OUT'),
                    onTap: () {},
                  ),
                  Container(
                    margin: EdgeInsets.all(30.5),
                    child: Text(
                      'Version: 1.0.0+1',
                      style: GoogleFonts.robotoCondensed(color: Colors.black26),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xff121420),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                  style: const ButtonStyle(),
                  child: Text(
                    'POMO',
                    style: GoogleFonts.changa(color: Colors.white),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      print('Click');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ShortBreak()));
                    },
                    child: const Text('SHORT BREAK')),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LongBreak()));
                    },
                    child: const Text('LONG BREAK')),
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
