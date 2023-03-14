import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:patient_health_monitoring_app/screens/AdminScreens/manage_appointment.dart';
import 'package:patient_health_monitoring_app/screens/AdminScreens/records.dart';
import '../../utils/colors.dart';
import '../../widgets/drawer.dart';

class AdminDashboard extends StatelessWidget {
  final DateTime now = DateTime.now();
  final String currdate = DateFormat('yMMMMd').format(DateTime.now());
  final String currday = DateFormat('EEEE').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgwhite,
        iconTheme: IconThemeData(color: iconred),
      ),
      drawer: CustomDrawer(),
      backgroundColor: bgwhite,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            Text(
              "Hi Admin,",
              style: TextStyle(
                  color: textblack, fontSize: 32, fontWeight: FontWeight.w400),
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
                Get.to(() => ManageRecords());
              },
              child: Container(
                height: 200.h,
                width: 378.w,
                decoration: BoxDecoration(
                    color: bgcolor, borderRadius: BorderRadius.circular(15.r)),
                child: Stack(
                  children: [
                    Container(
                        height: 200.h,
                        width: 378.w,
                        child: Image.asset(
                          "assets/images/calenderbg.png",
                          fit: BoxFit.fill,
                        )),
                    Center(
                      child: Text(
                        "Manage Records",
                        style: TextStyle(
                            color: textWhite,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () {
                Get.to(() => ManageAppointment());
              },
              child: Container(
                height: 200.h,
                width: 378.w,
                decoration: BoxDecoration(
                    color: bgcolor, borderRadius: BorderRadius.circular(15.r)),
                child: Stack(
                  children: [
                    Container(
                        height: 200.h,
                        width: 378.w,
                        child: Image.asset(
                          "assets/images/appointmentbg.png",
                          fit: BoxFit.fill,
                        )),
                    Center(
                      child: Text(
                        "Manage Appointments",
                        style: TextStyle(
                            color: textWhite,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
