import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PresentetionCard extends StatelessWidget {
  const PresentetionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121420),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  height: 300,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color(0xffE2E2E2),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(8.5),
                      child: Text(
                        'Hola Bienvenid@ ☺ \nA Pomodoro Donde Con el metodo de estudio Pomodoro ⌚, vas a poder realizar todas tus tareas ✅ sin estresarte. para empezar ve al menu en la parte derecha y elige cuanto tiempo vas a estudiar.',
                        style: GoogleFonts.yanoneKaffeesatz(
                          fontSize: 22.0.sp,
                        ),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
