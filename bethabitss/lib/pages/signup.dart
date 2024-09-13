import 'package:bethabitss/custom/custom_form.dart';

import 'package:bethabitss/pages/login_pages.dart';
import 'package:bethabitss/servers/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUp extends StatefulWidget {
  static const String routename = 'SignUp';
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // ! create required key
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
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
                      height: 30.h,
                      width: 90.w,
                      child: Image.asset('assets/images/Logo_app.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(0.1.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SignUp',
                            style: GoogleFonts.bebasNeue(
                              color: Color(0xffE7E5DF),
                              fontSize: 25.5.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    // ! input user
                    Padding(
                      padding: EdgeInsets.all(2.5.w),
                      child: CustomFormBuilder(
                        name: 'userName',
                        osbcureText: false,
                        hinText: 'Enter Your Name',
                        icon: Icons.person_2,
                        keytype: TextInputType.name,
                      ),
                    ),
                    // ! input email
                    Padding(
                      padding: EdgeInsets.all(2.5.w),
                      child: const CustomFormBuilder(
                        name: 'user',
                        osbcureText: false,
                        hinText: 'Enter Your Email',
                        icon: Icons.email_sharp,
                        keytype: TextInputType.emailAddress,
                      ),
                    ),
                    // ! input password
                    Padding(
                      padding: EdgeInsets.all(2.5.w),
                      child: const CustomFormBuilder(
                        name: 'Pass',
                        osbcureText: true,
                        hinText: 'Enter Your Password',
                        icon: Icons.lock,
                        keytype: TextInputType.visiblePassword,
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    ElevatedButton(
                      onPressed: () async {
                        _formKey.currentState?.save();
                        if (_formKey.currentState?.validate() == true) {
                          final v = _formKey.currentState?.value;
                          var result =
                              await _auth.createAccount(v?['user'], v?['Pass']);

                          if (result == 2) {
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
                                builder: (context) => const LoginPages()));
                          }
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Color(0xffE7BB41)),
                          minimumSize: WidgetStateProperty.all(Size(150, 50))),
                      child: Text(
                        'SignUp',
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
                              Navigator.pop(context);
                            },
                            child: Text(
                              'I have an account',
                              style: GoogleFonts.bebasNeue(
                                color: Color(0xffE7BB41),
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
