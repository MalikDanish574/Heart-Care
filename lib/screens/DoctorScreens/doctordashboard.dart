import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../../widgets/drawer.dart';
import 'check_appointment.dart';

class DoctorDashboard extends StatefulWidget {
  @override
  State<DoctorDashboard> createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  String? doctorName = "";
  String? email = "";
  String? gender = "";
  @override
  void initState() {
    super.initState();
    getdata();
    // Add listeners to this class
  }

  void getdata() async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    doctorName = _sharedPreferences.getString('Doctorname');
    email = _sharedPreferences.getString('Email');
    gender = _sharedPreferences.getString('Gender');
    print(doctorName);
    print(email);
    print(gender);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final String currdate = DateFormat('yMMMMd').format(DateTime.now());
    final String currday = DateFormat('EEEE').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgwhite,
        iconTheme: IconThemeData(color: iconred),
      ),
      drawer: CustomDrawer(),
      backgroundColor: bgwhite,
      body: SafeArea(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hi "+doctorName!+",",
                  style: TextStyle(
                      color: textblack,
                      fontSize: 32,
                      fontWeight: FontWeight.w400),
                ),
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
            InkWell(
              onTap: () {
                Get.to(() => CheckAppointment());
              },
              child: Container(
                height: 200.h,
                width: 378.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/appointmentbg.png",
                      height: 150.h,
                      width: 378.w,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h, left: 20.w),
                      child: Text(
                        "Check\nAppointment",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: textWhite,
                            fontSize: 25.w,
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
          ],
        ),
      )),
    );
  }
}
