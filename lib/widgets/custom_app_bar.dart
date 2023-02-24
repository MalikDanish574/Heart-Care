import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';

class CustomAppBar extends StatelessWidget{
  final String title;
  final Color color;

  CustomAppBar({
    required this.title,
     required this.color
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 377.w,
      child: Row(
        children: [
            InkWell(
              onTap:() {
                Get.back();
              },
              child: CircleAvatar(
                  backgroundColor: iconbg,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: iconblack,
                  ),
                ),
            ),
               SizedBox(width: 92.w,),
           Text(title,style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.bold ,
            fontFamily: 'poppins'          ),),
        ],
        
        
        
      ),
    );
  }

}