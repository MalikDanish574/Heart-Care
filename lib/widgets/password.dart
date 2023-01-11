import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';

class Password extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  Password({
    required this.controller,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59.h,
      width: 381.w,
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: textfieldborder)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: textfieldborder)),
          labelText: title,
          labelStyle: TextStyle(
            fontSize: 11,
            color: textfieldlabel,
          ),
        ),
        obscureText: true,
        obscuringCharacter: "*",
        style:
            TextStyle(color: textblack, fontFamily: 'Montserrat', fontSize: 14),
        validator: (value) {
          if (value!.isEmpty) {
            return "Enter Password";
          }
          return null;
        },
      ),
    );
  }
}
