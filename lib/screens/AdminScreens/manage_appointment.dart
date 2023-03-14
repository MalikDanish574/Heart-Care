import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class ManageAppointment extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Padding(
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
                "Manage Appointments",
                style: TextStyle(
                    color: textblack,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Container(
                        height: 270.h,
                        width: 377.w,
                        decoration: BoxDecoration(
                            color: containerbg,
                            borderRadius: BorderRadius.circular(15.r),
                             border: Border.all(width: 1,color: textfieldborder),),
                            
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Name:",
                                    style: TextStyle(
                                        color: textred,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins'),
                                  ),
                                  SizedBox(
                                    width: 60.w,
                                  ),
                                  Text(
                                    "Malik Danish Awan",
                                    style: TextStyle(
                                        color: textred,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'poppins'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Age:",
                                    style: TextStyle(
                                        color: textred,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins'),
                                  ),
                                  SizedBox(
                                    width: 75.w,
                                  ),
                                  Text(
                                    "23 years",
                                    style: TextStyle(
                                        color: textred,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'poppins'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Gender:",
                                    style: TextStyle(
                                        color: textred,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins'),
                                  ),
                                  SizedBox(
                                    width: 50.w,
                                  ),
                                  Text(
                                    "Male/Female",
                                    style: TextStyle(
                                        color: textred,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'poppins'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Time:",
                                    style: TextStyle(
                                        color: textred,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins'),
                                  ),
                                  SizedBox(
                                    width: 65.w,
                                  ),
                                  Text(
                                    "01:00",
                                    style: TextStyle(
                                        color: textred,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'poppins'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Date:",
                                    style: TextStyle(
                                        color: textred,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins'),
                                  ),
                                  SizedBox(
                                    width: 65.w,
                                  ),
                                  Text(
                                    "02-03-2023",
                                    style: TextStyle(
                                        color: textred,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'poppins'),
                                  ),
                                ],
                              ),
                               SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 50.h,
                                    width: 150.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                      border: Border.all(width: 1,color: textWhite),
                                      color: containerbggreen
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Accept",
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'poppins'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Container(
                                     height: 50.h,
                                    width: 150.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                      border: Border.all(width: 1,color: textWhite),
                                      color: bgcolor
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Reject",
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'poppins'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
        ],
      ),
    ),
   );
  }

}