import 'package:bethabitss/pages/home.dart';
import 'package:bethabitss/pages/long_break.dart';
import 'package:bethabitss/pages/presentation.dart';
import 'package:bethabitss/pages/short_break.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CallRoutes extends StatefulWidget {
  const CallRoutes({super.key});

  @override
  State<CallRoutes> createState() => _CallRoutesState();
}

class _CallRoutesState extends State<CallRoutes> {
  String? userEmail;
  String currentRoute = '/PresentetionCard';
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


  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xff121420),
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
                      onTap: () {
                        setState(() {
                          Navigator.pop(context);
                          currentRoute = '/HomePage'; // Navega a HomePage
                        });
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.timelapse_sharp),
                      title: Text('LONG BREAK'),
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          currentRoute = '/LongBreak'; // Navega a HomePage
                        });
                        
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.timelapse_sharp),
                      title: Text('SHORT BREAK'),
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          currentRoute = '/ShortBreak';
                        });
                      },
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
                        style:
                            GoogleFonts.robotoCondensed(color: Colors.black26),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        body: Navigator(onGenerateRoute: (RouteSettings senttings) {
          late Widget page;
          switch (currentRoute) {
            case '/HomePage':
              page = HomePage();
              break;
            case '/LongBreak':
              page = LongBreak();
            case '/ShortBreak':
              page = ShortBreak();
            default:
              page = PresentetionCard();
          }
          return MaterialPageRoute(builder: (context) => page);
        }));
  }
}
