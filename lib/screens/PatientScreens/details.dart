import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scalable_data_table/scalable_data_table.dart';

import '../../utils/colors.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(children: [
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
                "Details",
                style: TextStyle(
                    color: textblack,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
           SizedBox(
              height: 780.h,
              child: ScalableDataTable(
                header: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: textred,
                  ),
                  child: ScalableTableHeader(
                    columnWrapper: columnWrapper,
                    children: [
                      const Text('Patient Name'),
                      const Text('Age'),
                      const Text('Gender'),
                      const Text('Blood Pressure'),
                      const Text('Pulse Rate'),
                      const Text('Date'),
                      const Text('Time'),
                      const Text('Checcked by'),
                    ],
                  ),
                ),
                rowBuilder: (context, index) {
                  // final user = snapshot.data![index];
                  return ScalableTableRow(
                    columnWrapper: columnWrapper,
                    color: MaterialStateColor.resolveWith((states) =>
                        (index % 2 == 0)
                            ? Colors.grey[200]!
                            : Colors.transparent),
                    children: [
                      Text("Muhammad Danish Raza"),
                      Text("23"),
                      Text("MALE"),
                      Text('87'),
                      Text("45"),
                      Text("23-4-2023"),
                      Text("10:45"),
                      Text("Dansih Awan"),
                    ],
                  );
                },
                emptyBuilder: (context) => const Text('No users yet...'),
                itemCount: 15,
                minWidth: 1000, // max(MediaQuery.of(context).size.width, 1000),
                textStyle: TextStyle(color: textgrey, fontSize: 18.sp),
              ),
            )
          ]),
        ),
      ),
    );
  }
   Widget columnWrapper(BuildContext context, int columnIndex, Widget child) {
    const padding = EdgeInsets.symmetric(horizontal: 10, vertical: 10);
    switch (columnIndex) {
      case 0:
        return Container(
          width: 200.w,
          padding: padding,
          child: child,
        );
      case 1:
        return Container(
          width: 120.w,
          padding: padding,
          child: child,
        );
      case 3:
        return Container(
          width: 120.w,
          padding: padding,
          child: child,
        );
      case 4:
        return Container(
          width: 120.w,
          padding: padding,
          child: child,
        );

      case 5:
        return Container(
          width: 120.w,
          padding: padding,
          child: child,
        );
      default:
        return Container(
          width: 120.w,
          padding: padding,
          child: child,
        );
    }
   }
}
