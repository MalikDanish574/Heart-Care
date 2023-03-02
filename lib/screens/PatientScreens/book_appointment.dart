import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:patient_health_monitoring_app/screens/PatientScreens/doneAppointment.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';
import 'package:patient_health_monitoring_app/widgets/custom_app_bar.dart';

class BookAppointment extends StatefulWidget {
  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  String time = '';
  List<tabb> _tab = [
    tabb(
      title: "3:15 PM",
      select: false,
    ),
    tabb(
      title: "3:45 PM",
      select: false,
    ),
    tabb(
      title: "4:15 PM",
      select: false,
    ),
    tabb(
      title: "4:45 PM",
      select: false,
    ),
    tabb(
      title: "5:15 PM",
      select: false,
    ),
  ];

  String _date = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 52.h,
                ),
                CustomAppBar(title: "Book Appointment", color: textblack),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: textWhite,
                      radius: 24,
                      backgroundImage:
                          AssetImage("assets/images/doctorProfile.png"),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "DR. Saif Malik",
                          style: TextStyle(
                              color: textblack,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppins'),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          "Cardiologist",
                          style: TextStyle(
                              color: textblack,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'poppins'),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          "Fee: PKR 2500",
                          style: TextStyle(
                              color: textblack,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'poppins'),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Select a Date",
                  style: TextStyle(
                      color: textblack,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'poppins'),
                ),
                SizedBox(
                  height: 10.h,
                ),
                HorizontalCalendar(
                  date: DateTime.now().add(const Duration(days: 1)),
                  initialDate: DateTime.now(),
                  textColor: textgrey,
                  backgroundColor: Colors.white,
                  selectedColor: textred,
                  showMonth: true,
                  onDateSelected: (date) {
                    _date = date;
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  "Select a Time",
                  style: TextStyle(
                      color: textblack,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'poppins'),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 50.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: RawChip(
                            showCheckmark: false,
                            label: Container(
                              width: 80.w,
                              height: 32.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    15.r), //border corner radius
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.1), //color of shadow
                                    spreadRadius: 5, //spread radius
                                    blurRadius: 7, // blur radius
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(_tab[index].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: _tab[index].select
                                            ? textWhite
                                            : textgrey,
                                        fontSize: 18.sp)),
                              ),
                            ),
                            labelPadding: EdgeInsets.symmetric(horizontal: 1.w),
                            selected: _tab[index].select,
                            onSelected: (bool selected) {
                              if (selected == true) {
                                for (final f in _tab) {
                                  f.select = false;
                                }
                                time = _tab[index].title;
                                _tab[index].select = true;
                              }
                              // choice = selected ? 'All' : null;
                              //   print('gsdgsdffgfgfgggggggggggggg'+choice);
                              setState(() {});
                            },
                            backgroundColor: textWhite,
                            selectedColor:
                                _tab[index].select ? textred : textblack,
                            shape: ContinuousRectangleBorder(
                                side: BorderSide(
                                    width: 1,
                                    color: _tab[index].select
                                        ? textred
                                        : textgrey),
                                borderRadius: BorderRadius.circular(15.0.r))),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 264.h,
          ),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            )),
            child: Container(
              height: 132.h,
              width: 428.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: containerbg),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: 40.h,
                      width: 224.w,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: textfieldborder),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20.w,
                          ),
                          Icon(
                            Icons.access_time,
                            color: iconred,
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            _date + " , " + time,
                            style: TextStyle(
                                color: textred,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'poppins'),
                          ),
                        ],
                      ),
                    ),
                     SizedBox(
                      height: 15.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(()=>DoneAppointment(date: _date,time: time,));
                      },
                      child: Container(
                        width: 377.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              style: BorderStyle.solid,
                              color: btnborder),
                          color: btnbg,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'Confirm Booking',
                            style: TextStyle(
                                color: textWhite,
                                fontSize: 15,
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
          )
        ],
      ),
    );
  }
}

class tabb {
  bool select;
  String title;

  tabb({
    required this.title,
    required this.select,
  });
}
