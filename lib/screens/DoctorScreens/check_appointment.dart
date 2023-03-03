import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';
import '../../widgets/custom_app_bar.dart';

class CheckAppointment extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            SizedBox(
                height: 41.h,
              ),
              CustomAppBar(title: "Appointments",color:textred ), 
              SizedBox(
                height: 41.h,
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
                        height: 200.h,
                        width: 377.w,
                        decoration: BoxDecoration(
                            color: bgcolor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            children: [
                               Row(
                                children: [
                                  
                                  Text(
                                    "Name:",
                                    style: TextStyle(
                                        color: textWhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins'),
                                  ),
                                  SizedBox(width: 60.w,),
                                   Text(
                                    "Malik Danish Awan",
                                    style: TextStyle(
                                        color: textWhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'poppins'),
                                  ),
                                ],
                              ),
                               SizedBox(height: 15.h,),
                              
                              Row(
                                children: [
                                  
                                  Text(
                                    "Age:",
                                    style: TextStyle(
                                        color: textWhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins'),
                                  ),
                                  SizedBox(width: 75.w,),
                                   Text(
                                    "23 years",
                                    style: TextStyle(
                                        color: textWhite,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'poppins'),
                                  ),
                                ],
                              ),
                              
                               SizedBox(height: 15.h,),
                               Row(
                                children: [
                                  
                                  Text(
                                    "Gender:",
                                    style: TextStyle(
                                        color: textWhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins'),
                                  ),
                                   SizedBox(width: 50.w,),
                                   Text(
                                    "Male/Female",
                                    style: TextStyle(
                                        color: textWhite,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'poppins'),
                                  ),
                                ],
                              ),
                               SizedBox(height: 15.h,),
                               Row(
                                children: [
                                  
                                  Text(
                                    "Time:",
                                    style: TextStyle(
                                        color: textWhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins'),
                                  ),
                                   SizedBox(width: 65.w,),
                                   Text(
                                    "01:00",
                                    style: TextStyle(
                                        color: textWhite,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'poppins'),
                                  ),
                                ],
                              ),
                               SizedBox(height: 15.h,),
                               Row(
                                children: [
                                  
                                  Text(
                                    "Date:",
                                    style: TextStyle(
                                        color: textWhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins'),
                                  ),
                                   SizedBox(width: 65.w,),
                                   Text(
                                    "02-03-2023",
                                    style: TextStyle(
                                        color: textWhite,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'poppins'),
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