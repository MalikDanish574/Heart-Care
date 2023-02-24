import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';

class SearchBar extends StatelessWidget{
   final TextEditingController controller;
   final String title;
   SearchBar({
    required this.title,
    required this.controller
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 50.h,
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
                    prefixIcon: Icon(Icons.search_rounded,color: iconred,)
                  ),
                  
                  style: TextStyle(
                    color: textblack,
                    fontFamily: 'Montserrat',
                    fontSize: 14
                  ),
                  
                ),
    );
  }

}