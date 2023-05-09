import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class GenerateReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios)),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Text(
                  "Report",
                  style: TextStyle(
                      color: textblack,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Patient Name",
                        style: TextStyle(
                            color: textblack,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Age",
                        style: TextStyle(
                            color: textblack,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Gender",
                        style: TextStyle(
                            color: textblack,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Blood Pressure",
                        style: TextStyle(
                            color: textblack,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Pulse Rate",
                        style: TextStyle(
                            color: textblack,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Date",
                        style: TextStyle(
                            color: textblack,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Time",
                        style: TextStyle(
                            color: textblack,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Muhammad Danish Raza",
                        style: TextStyle(
                            color: textblack,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "23",
                        style: TextStyle(
                            color: textblack,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Male",
                        style: TextStyle(
                            color: textblack,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "87",
                        style: TextStyle(
                            color: textblack,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "45",
                        style: TextStyle(
                            color: textblack,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "23-4-2023",
                        style: TextStyle(
                            color: textblack,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "10:45",
                        style: TextStyle(
                            color: textblack,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 70.h,
              ),
              GestureDetector(
                onTap: () {
                  // Get.to(() => PatientDashboard());
                },
                child: Container(
                  width: 377.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, style: BorderStyle.solid, color: btnborder),
                    color: btnbg,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Download',
                      style: TextStyle(
                          color: textWhite,
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
