import 'package:bethabitss/firebase_options.dart';
import 'package:bethabitss/pages/load_screen.dart';
import 'package:bethabitss/servers/pref_users.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await usersPreferences.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final prefs = usersPreferences();

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    

    return ResponsiveSizer(
      builder: (BuildContext, Orientation, ScreenType) {
        return const MaterialApp(
          
          title: 'Pages Principal',
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          
        );
      },
    );
  }
}

