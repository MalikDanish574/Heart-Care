import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient_health_monitoring_app/screens/PatientScreens/available_doctor.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';
import 'package:patient_health_monitoring_app/widgets/Slider.dart';
import 'package:patient_health_monitoring_app/widgets/drawer.dart';
import 'package:patient_health_monitoring_app/widgets/searchBAr.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'details.dart';

class PatientDashboard extends StatefulWidget  {
 
  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  dynamic name="";

  dynamic email="";

  dynamic age="";

  final String currdate = DateFormat('yMMMMd').format(DateTime.now());

  final String currday = DateFormat('EEEE').format(DateTime.now());

  final fireStore =
      FirebaseFirestore.instance.collection('Patient').snapshots();

  final searchController = TextEditingController();

 @override
void initState() {
  super.initState();
  getdata();
 // Add listeners to this class
}

   void getdata()async{
      final SharedPreferences _sharedPreferences=await SharedPreferences.getInstance();
      name=_sharedPreferences.getString('name');
        email=_sharedPreferences.getString('email');
          age=_sharedPreferences.getString('age');
      print(name);
      print(email);
      print(age);
      setState(() {
        
      });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgwhite,
        iconTheme: IconThemeData(color: iconred),
      ),
      drawer: CustomDrawer(),
      backgroundColor: bgwhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hi "+name,
                  style: TextStyle(
                      color: textblack,
                      fontSize: 32,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              currdate + "\n" + currday,
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
                    CustomSearchBar(
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
              width: 377.w,
              decoration: BoxDecoration(
                  color: containerbg, borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageSlider(),
              ),
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
                            Get.to(() => AvailableDoctor());
                          },
                          child: Container(
                            height: 200.h,
                            width: 160.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: textred),
                            child: Stack(
                              children: [
                                Container(
                                    height: 200.h,
                                    width: 160.w,
                                    child: Image.asset(
                                      "assets/images/doctorbg.png",
                                      fit: BoxFit.fill,
                                    )),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.h, left: 10.w),
                                  child: Text(
                                    "Doctor\nAppointment",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: textWhite,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  height: 22.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => Details());
                          },
                          child: Container(
                            height: 200.h,
                            width: 160.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: textred),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.w,
                                  top: 10.h,
                                  right: 10.w,
                                  bottom: 10.h),
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
                                          fit: BoxFit.fill,
                                        )),
                                  )
                                ],
                              ),
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
      ),
    );
  }
}
