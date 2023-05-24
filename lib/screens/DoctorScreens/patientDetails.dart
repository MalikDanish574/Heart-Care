import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient_health_monitoring_app/screens/DoctorScreens/generateReport.dart';
import 'package:patient_health_monitoring_app/widgets/searchBAr.dart';
import 'package:scalable_data_table/scalable_data_table.dart';

import '../../utils/colors.dart';

class PatientDetails extends StatelessWidget {
  final fireStore = FirebaseFirestore.instance.collection('PatientDetails').snapshots();
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
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
                "Patient Details",
                style: TextStyle(
                    color: textblack,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomSearchBar(title: "Search Patient", controller: searchController),
            SizedBox(
              height: 20.h,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: fireStore,
              builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
                 if(!snapshot.hasData){
                   return Center(child: CircularProgressIndicator());
                  }else
                return SizedBox(
                  height: 700.h,
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
                          const Text('Blood Pressure Upper'),
                          const Text('Blood Pressure Lower'),
                          const Text('Pulse Rate'),
                          const Text('Date'),
                          const Text('Time'),
                          const Text('Report'),
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
                          Text(snapshot.data!.docs[index]["name"]),
                          Text(snapshot.data!.docs[index]["age"].toString()),
                          Text(snapshot.data!.docs[index]["gender"]),
                          Text(snapshot.data!.docs[index]["bpUpper"].toString()),
                          Text(snapshot.data!.docs[index]["bpLower"].toString()),
                          Text(snapshot.data!.docs[index]["heartRate"].toString()),
                          Text(snapshot.data!.docs[index]["date"]),
                          Text(snapshot.data!.docs[index]["time"]),
                          InkWell(
                            onTap: () {
                              Get.to(()=>GenerateReport());
                            },
                            child: Container(
                              height: 40.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                  color: containerbggreen,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Center(
                                child: Text(
                                  "Generate Report",
                                  style: TextStyle(
                                      color: textWhite,
                                      fontSize: 18.w,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    emptyBuilder: (context) => const Text('No users yet...'),
                    itemCount: snapshot.data!.docs.length,
                    minWidth: 1400.w, // max(MediaQuery.of(context).size.width, 1000),
                    textStyle: TextStyle(color: textgrey, fontSize: 18.sp),
                  ),
                );
              }
            )
          ],
        ),
      ),
    ));
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
          width: 150.w,
          padding: padding,
          child: child,
        );
    }
  }
}
