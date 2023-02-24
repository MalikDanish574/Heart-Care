import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient_health_monitoring_app/screens/available_doctor.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';
import 'package:patient_health_monitoring_app/widgets/Slider.dart';
import 'package:patient_health_monitoring_app/widgets/searchBAr.dart';


class PatientDashboard extends StatelessWidget {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgwhite,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(children: [
          SizedBox(
            height: 51.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hi Malik,",
                style: TextStyle(
                    color: textblack,
                    fontSize: 32,
                    fontWeight: FontWeight.w400),
              ),
              CircleAvatar(
                backgroundColor: iconbg,
                child: Icon(
                  Icons.menu_rounded,
                  color: iconred,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "January 06, 2023\nFriday ",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: textgrey, fontSize: 18, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: 100.h,
            width: 378.w,
            decoration: BoxDecoration(
                color: containerbg, borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "I'm searching for",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: textblack,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SearchBar(
                      title: "Search Doctor", controller: searchController)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),

          Container(
            height: 270.h,
            width:  377.w,
            decoration: BoxDecoration(
              color:containerbg,
              borderRadius: BorderRadius.circular(8)),
              child: ImageSlider(),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: 260.h,
            width: 377.w,
            decoration: BoxDecoration(
              color: containerbg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "I want to book",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: textblack,
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(()=>AvailableDoctor());
                        },
                        child: Container(
                          height: 200.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: textred),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w, top: 10.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Doctor\nAppointment",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: textWhite,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 22.h,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                      height: 130.h,
                                      width: 100.w,
                                      child: Image.asset(
                                        "assets/images/doctor.png",
                                        fit: BoxFit.fill,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Container(
                        height: 200.h,
                        width: 160.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: textred),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w, top: 10.h,right: 10.w,bottom: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Patient\nDetails",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: textWhite,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                    height: 130.h,
                                    width: 160.w,
                                    child: Image.asset(
                                      "assets/images/patient.jpg",
                                      
                                      fit: BoxFit.fill
                                      ,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
