import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';

class button extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  button({
    required this.title,
    required this.ontap
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: InkWell(
        onTap: ontap,
        child: Container(
          width: 320.w,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: btnbg,
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
