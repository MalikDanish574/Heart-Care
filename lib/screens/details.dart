import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

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
              height: 30.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {

                  return textred; // Use the default value.
                }),
                columns: [
                  DataColumn(
                      label: Text('Blood\nPressure',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: textWhite))),
                  DataColumn(
                      label: Text('Heart\nRate',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: textWhite))),
                  DataColumn(
                      label: Text('Date',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: textWhite))),
                  DataColumn(
                      label: Text('Time',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: textWhite))),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('34')),
                    DataCell(Text('67')),
                    DataCell(Text('23-02-2023')),
                    DataCell(Text('6:00')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('67')),
                    DataCell(Text('64')),
                    DataCell(Text('23-02-2023')),
                    DataCell(Text('6:00')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('67')),
                    DataCell(Text('64')),
                    DataCell(Text('23-02-2023')),
                    DataCell(Text('6:00')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('67')),
                    DataCell(Text('64')),
                    DataCell(Text('23-02-2023')),
                    DataCell(Text('6:00')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('67')),
                    DataCell(Text('64')),
                    DataCell(Text('23-02-2023')),
                    DataCell(Text('6:00')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('67')),
                    DataCell(Text('64')),
                    DataCell(Text('23-02-2023')),
                    DataCell(Text('6:00')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('67')),
                    DataCell(Text('64')),
                    DataCell(Text('23-02-2023')),
                    DataCell(Text('6:00')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('67')),
                    DataCell(Text('64')),
                    DataCell(Text('23-02-2023')),
                    DataCell(Text('6:00')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('67')),
                    DataCell(Text('64')),
                    DataCell(Text('23-02-2023')),
                    DataCell(Text('6:00')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('67')),
                    DataCell(Text('64')),
                    DataCell(Text('23-02-2023')),
                    DataCell(Text('6:00')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('67')),
                    DataCell(Text('64')),
                    DataCell(Text('23-02-2023')),
                    DataCell(Text('6:00')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('67')),
                    DataCell(Text('64')),
                    DataCell(Text('23-02-2023')),
                    DataCell(Text('6:00')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('67')),
                    DataCell(Text('64')),
                    DataCell(Text('23-02-2023')),
                    DataCell(Text('6:00')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('67')),
                    DataCell(Text('64')),
                    DataCell(Text('23-02-2023')),
                    DataCell(Text('6:00')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('67')),
                    DataCell(Text('64')),
                    DataCell(Text('23-02-2023')),
                    DataCell(Text('6:00')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('67')),
                    DataCell(Text('64')),
                    DataCell(Text('23-02-2023')),
                    DataCell(Text('6:00')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('67')),
                    DataCell(Text('64')),
                    DataCell(Text('23-02-2023')),
                    DataCell(Text('6:00')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('67')),
                    DataCell(Text('64')),
                    DataCell(Text('23-02-2023')),
                    DataCell(Text('6:00')),
                  ]),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
