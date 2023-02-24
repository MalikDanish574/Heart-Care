import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient_health_monitoring_app/screens/book_appointment.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';
import 'package:patient_health_monitoring_app/widgets/custom_app_bar.dart';
import 'package:patient_health_monitoring_app/widgets/ractanaglebutton.dart';
import 'package:patient_health_monitoring_app/widgets/searchBAr.dart';

class AvailableDoctor extends StatelessWidget {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            SizedBox(
              height: 41.h,
            ),
            CustomAppBar(title: "Available Doctor",color:textred ),
            SizedBox(
              height: 41.h,
            ),
            SearchBar(title: "Search Doctor", controller: searchController),
            SizedBox(
              height: 15.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 30.h,
                    width: 87.w,
                    decoration: BoxDecoration(
                        color: bgcolor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: Text(
                      "Cardiologist",
                      style: TextStyle(
                          color: textWhite,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'poppins'),
                    )),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Container(
                    height: 30.h,
                    width: 77.w,
                    decoration: BoxDecoration(
                        color: bgcolor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: Text(
                      "Cardiac",
                      style: TextStyle(
                          color: textWhite,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'poppins'),
                    )),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Container(
                    height: 30.h,
                    width: 97.w,
                    decoration: BoxDecoration(
                        color: bgcolor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: Text(
                      "Heart Surgeon",
                      style: TextStyle(
                          color: textWhite,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'poppins'),
                    )),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Container(
                    height: 30.h,
                    width: 97.w,
                    decoration: BoxDecoration(
                        color: bgcolor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: Text(
                      "Heart Failure",
                      style: TextStyle(
                          color: textWhite,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'poppins'),
                    )),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Container(
                    height: 30.h,
                    width: 117.w,
                    decoration: BoxDecoration(
                        color: bgcolor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: Text(
                      "Cardio-Oncologist",
                      style: TextStyle(
                          color: textWhite,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'poppins'),
                    )),
                  ),
                ],
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
                        height: 250.h,
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
                                  CircleAvatar(
                                    backgroundColor: textWhite,
                                    radius: 24,
                                    backgroundImage: AssetImage(
                                        "assets/images/doctorProfile.png"),
                                  ),
                                   SizedBox(width: 10.w,),
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "DR. Saif Malik",
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'poppins'),
                                      ),
                                      SizedBox(height: 8.h,),
                                       Text(
                                        "Cardiologist",
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'poppins'),
                                      )
                                    
                                    ],
                                  ),
                                ],
                              ),
                               SizedBox(height: 15.h,),
                              Row(
                                children: [
                                   Column(crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "15 years",
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'poppins'),
                                      ),
                                       Text(
                                        "Experience",
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'poppins'),
                                      )
                                    
                                    ],
                                  ),
                                    Spacer(),
                                  Container(
                                    height: 28.h,
                                    width: 1.w,
                                    color: textWhite,
                                  ),
                                  Spacer(),
                                  Column(crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "98% (487)",
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'poppins'),
                                      ),
                                       Text(
                                        "Satisfied patient",
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'poppins'),
                                      )
                                    
                                    ],
                                  ),
                                  Spacer(),

                                  Container(
                                    height: 28.h,
                                    width: 1.w,
                                    color: textWhite,
                                  ),
                                  Spacer(),
                                  Column(crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "4-9pm",
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'poppins'),
                                      ),
                                       Text(
                                        "Time",
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'poppins'),
                                      )
                                    
                                    ],
                                  ),

                                  
                                ],
                              ),
                              SizedBox(height: 15.h,),
                              Row(
                                children: [
                                   Text(
                                        "ABC Skin & Laser Hospital\nI-8, Islamabad",
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'poppins'),
                                      ),
                                      Spacer(),
                                      Column(
                                        children: [
                                          Text(
                                        "PKR 2500",
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'poppins'),
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 2,
                                            backgroundColor: iconWhite,
                                          ),
                                           Text(
                                        "Available Today",
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'poppins'),
                                      ),
                                        ],
                                      ),
                                      
                                        ],
                                      )
                                ],
                              ),
                            SizedBox(height: 13.h,),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RectangleBtn(ontap: () {
                                    Get.to(()=>BookAppointment());
                                  },title: 'Book Appointment')
                                ],
                              )
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
