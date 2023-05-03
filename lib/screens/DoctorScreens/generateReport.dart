import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class GenerateReport extends StatelessWidget{
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
                  "Report",
                  style: TextStyle(
                      color: textblack,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );

  }

}