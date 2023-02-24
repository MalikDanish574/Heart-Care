import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';

class RectangleBtn extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  RectangleBtn({
    required this.title,
    required this.ontap
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: InkWell(
        onTap: ontap,
        child: Container(
          width: 157.w,
          height: 40.h,
          decoration: BoxDecoration(
            border:Border.all(width:1,style: BorderStyle.solid,color:btnborder),
            color: btnbg,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: textWhite,
                  fontSize: 15,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
