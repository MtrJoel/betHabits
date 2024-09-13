import 'package:bethabitss/custom/custom_form.dart';
import 'package:bethabitss/pages/home.dart';
import 'package:bethabitss/pages/signup.dart';
import 'package:bethabitss/servers/auth.dart';
import 'package:bethabitss/servers/pref_users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPages extends StatefulWidget {
  static const String routename = 'Login';
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  // ! create required key
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  void loginUser(String email, String authToken) {
    usersPreferences prefs = usersPreferences();
    prefs.email = email;
    prefs.authToken = authToken;
    prefs.ultimaPagina = 'HomePage'; // Guardar la última página visitada

    // Redirigir a la HomePage
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121420),
      body: SingleChildScrollView(
        child: SafeArea(
          child: FormBuilder(
            // ! required key
            key: _formKey,
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40.h,
                      width: 90.w,
                      child: Image.asset('assets/images/Logo_app.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3.w),
                      child: Row(
                        children: [
                          Text(
                            'Great ideas are written down',
                            style: GoogleFonts.dancingScript(
                              color: Color(0xffE7E5DF),
                              fontSize: 20.5.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    Padding(
                      padding: EdgeInsets.all(2.5.w),
                      child: const CustomFormBuilder(
                        name: 'email',
                        osbcureText: false,
                        hinText: 'Enter Your Email',
                        icon: Icons.email_sharp,
                        keytype: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.5.w),
                      child: const CustomFormBuilder(
                        name: 'Password',
                        osbcureText: true,
                        hinText: 'Enter Your Password',
                        icon: Icons.lock,
                        keytype: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    ElevatedButton(
                      onPressed: () async {
                        _formKey.currentState?.save();
                        if (_formKey.currentState?.validate() == true) {
                          final v = _formKey.currentState?.value;
                          var result = await _auth.signInEmailAndPassword(
                              v?['email'], v?['Password']);
                          if (result is String) {
                            print('');
                            loginUser(v?['email'], result);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Error al iniciar sesión'),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }

                          if (result == 1) {
                            const SnackBar(
                              content: Text('Error password too small'),
                              duration: Duration(seconds: 3),
                            );
                          } else if (result == 2) {
                            const SnackBar(
                              content: Text('Error email in use'),
                              duration: Duration(seconds: 3),
                            );
                          } else if (result != null) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomePage()));
                          }
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(const Color(0xffE7BB41)),
                          minimumSize:
                              WidgetStateProperty.all(const Size(150, 50))),
                      child: Text(
                        'SignIn',
                        style: GoogleFonts.bebasNeue(
                            color: Colors.black, fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Center(
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()));
                            },
                            child: Text(
                              'You Have an Account?',
                              style: GoogleFonts.bebasNeue(
                                color: const Color(0xffE7BB41),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
