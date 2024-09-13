import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomFormBuilder extends StatelessWidget {
  // ! parametros requeridos
  final String name;
  final bool osbcureText;
  final String hinText;
  final String Function(String?)? validator;
  final IconData icon;
  final TextInputType keytype;

  const CustomFormBuilder(
      {super.key,
      required this.name,
      required this.osbcureText,
      required this.hinText,
      this.validator,
      required this.icon,
      required this.keytype});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      name: name,
      obscureText: osbcureText,
      validator: validator,
      keyboardType: keytype,
      // ! This are styles for default
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
        hintText: hinText,
        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 26.6.sp),
        // ! change when the user tap input
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrange),
            borderRadius: BorderRadius.all(Radius.circular(20))),
            prefixIcon: Icon(icon, color: Colors.amber,),
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}

