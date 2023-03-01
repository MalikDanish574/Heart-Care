import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../utils/colors.dart';
import '../../widgets/drawer.dart';

class DoctorDashboard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final String currdate =  DateFormat('yMMMMd').format(DateTime.now());
  final String currday=DateFormat('EEEE').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgwhite,
      iconTheme: IconThemeData(color: iconred),
      ),
      drawer: CustomDrawer(),
      backgroundColor: bgwhite,
      body: SafeArea(child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hi Malik,",
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
              currdate+"\n"+currday,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textgrey, fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      )),
    );
  }

}