import 'dart:io';
import 'dart:ui' as ui;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:patient_health_monitoring_app/utils/utilities.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;

import '../../utils/colors.dart';

class GenerateReport extends StatefulWidget {
  @override
  State<GenerateReport> createState() => _GenerateReportState();
}

class _GenerateReportState extends State<GenerateReport> {
  final _key = GlobalKey();

  // GlobalKey _key = GlobalKey();
  Future<void> _exportImage() async {
    final random = Random();
    String reo = random.nextInt(200).toString();
    await Permission.storage.request();
    final boundary = _key.currentContext?.findRenderObject();
    if (boundary is RenderRepaintBoundary) {
      print("ffgd");
      final image = await boundary.toImage();
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final pngBytes = byteData!.buffer.asUint8List();

      if (Platform.isAndroid) {
        File file = File('/storage/emulated/0/Download/HeartCare${reo}.png');

        await file.writeAsBytes(pngBytes);
        print("${file}");
      } else {
        final directory = await getExternalStorageDirectory();
        final filePath =
            path.join(directory!.path, 'asasa${random.nextInt(200)}.png');
        final file = File(filePath);
        await file.writeAsBytes(pngBytes);
      }
      Utils().toastMessage("Image saved to Download Folder");
      String ext = 'png';
      openFile(reo, ext);
    }
  }

  var _openResult = "unknown";
  Future<void> openFile(String name, String ext) async {
    print(
        "${name}.............==================================================........${ext}");
    final filePath = '/storage/emulated/0/Download/HeartCare${name}.${ext}';
    final result = await OpenFilex.open(filePath);

    setState(() {
      _openResult = "type=${result.type}  message=${result.message}";
    });
  }

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
              RepaintBoundary(
                key: _key,
                child: Column(
                  children: [
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
                  height: 60.h,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Patient Name",
                          style: TextStyle(
                              color: textblack,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Age",
                          style: TextStyle(
                              color: textblack,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Gender",
                          style: TextStyle(
                              color: textblack,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Blood Pressure",
                          style: TextStyle(
                              color: textblack,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Pulse Rate",
                          style: TextStyle(
                              color: textblack,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Date",
                          style: TextStyle(
                              color: textblack,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Time",
                          style: TextStyle(
                              color: textblack,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Muhammad Danish Raza",
                          style: TextStyle(
                              color: textblack,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "23",
                          style: TextStyle(
                              color: textblack,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Male",
                          style: TextStyle(
                              color: textblack,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "87",
                          style: TextStyle(
                              color: textblack,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "45",
                          style: TextStyle(
                              color: textblack,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "23-4-2023",
                          style: TextStyle(
                              color: textblack,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "10:45",
                          style: TextStyle(
                              color: textblack,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
                  ],
                ),
              ),
             
              SizedBox(
                height: 300.h,
              ),
              GestureDetector(
                onTap: () {
                  print("hjdhsjdhsjjhdjsh");
                  _exportImage();
                  print("hjdhsjdhsjj9999999999999999999999999999999");
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
                      'Download',
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
      ),
    );
  }
}
