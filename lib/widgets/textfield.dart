import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';

class textfeild extends StatelessWidget{
   final TextEditingController controller;
   final String title;
   final String error;
   textfeild({
    required this.title,
    required this.controller,
    required this.error
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
                      borderSide: BorderSide(color: textfieldborder)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: textfieldborder)
                    ),
                    labelText: title,
                   
                    labelStyle: TextStyle(
                      fontSize: 11,
                      color: textfieldlabel,
                    ),
              
                  ),
                  
                  style: TextStyle(
                    color: textblack,
                    fontFamily: 'Montserrat',
                    fontSize: 14
                  ),
                  validator: (value) {
                    if (value!.isEmpty){
                      return error;
                    }
                    return null;
                  },
                ),
    );
  }

}