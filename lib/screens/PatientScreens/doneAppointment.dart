import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient_health_monitoring_app/screens/PatientScreens/patientdashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../../widgets/custom_app_bar.dart';

class DoneAppointment extends StatefulWidget {
  final String date;
  final String time;

  DoneAppointment({required this.date, required this.time});

  @override
  State<DoneAppointment> createState() => _DoneAppointmentState();
}

class _DoneAppointmentState extends State<DoneAppointment> {
  String? doctorName = "";

  String? hospital = "";

  String? hospitalLocation = "";

  String? phoneNo = "";

  String? specialization = "";

  @override
  void initState() {
    super.initState();
    getData();
    // Add listeners to this class
  }

  void getData() async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    doctorName = _sharedPreferences.getString('doctorname');
    specialization = _sharedPreferences.getString('doctorspecial');
    hospital = _sharedPreferences.getString('Hospital');
    hospitalLocation = _sharedPreferences.getString("Hospital Location");
    phoneNo = _sharedPreferences.getString("Phone No");
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 52.h,
            ),
            CustomAppBar(title: "Book Appointment", color: textblack),
            SizedBox(
              height: 90.h,
            ),
            Center(
              child: Container(
                height: 55.w,
                width: 55.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(width: 1, color: textfieldborder),
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: iconred,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              "Your in-person appointment has been booked!",
              style: TextStyle(
                  color: textred,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'poppins'),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 86.h,
            ),
            Text(
              "Appointment Details",
              style: TextStyle(
                  color: textgrey,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'poppins'),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 28.w,
                ),
                Icon(Icons.calendar_month_rounded),
                SizedBox(
                  width: 24.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Appointment Time",
                      style: TextStyle(
                          color: textgrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'poppins'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      widget.date + " , " + widget.time,
                      style: TextStyle(
                          color: textblack,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'poppins'),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 28.w,
                ),
                SizedBox(
                    height: 25.h,
                    width: 25.w,
                    child: Image.asset("assets/images/doctor2.png")),
                SizedBox(
                  width: 24.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Doctor Name",
                      style: TextStyle(
                          color: textgrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'poppins'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      doctorName!,
                      style: TextStyle(
                          color: textblack,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'poppins'),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 28.w,
                ),
                Icon(Icons.wallet),
                SizedBox(
                  width: 24.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Specialization",
                      style: TextStyle(
                          color: textgrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'poppins'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      specialization!,
                      style: TextStyle(
                          color: textblack,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'poppins'),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 46.h,
            ),
            Text(
              "Other Details",
              style: TextStyle(
                  color: textgrey,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'poppins'),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 28.w,
                ),
                Icon(Icons.location_on_rounded),
                SizedBox(
                  width: 24.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hospital!,
                      style: TextStyle(
                          color: textblack,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'poppins'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      hospitalLocation!,
                      style: TextStyle(
                          color: textgrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'poppins'),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 28.w,
                ),
                Icon(Icons.phone),
                SizedBox(
                  width: 24.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      phoneNo!,
                      style: TextStyle(
                          color: textblack,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'poppins'),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 100.h,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => PatientDashboard());
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
                    'Done',
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
    );
  }
}
