import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:patient_health_monitoring_app/screens/PatientScreens/doneAppointment.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';
import 'package:patient_health_monitoring_app/widgets/custom_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/utilities.dart';

class BookAppointment extends StatefulWidget {
  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  final fireStore = FirebaseFirestore.instance.collection('Appointments');
  String time = "";

  dynamic name = "";

  dynamic specialization = "";

  dynamic gender = "";

  TimeOfDay? starttime = TimeOfDay.now();
  TimeOfDay? endtime = TimeOfDay.now();
  String _date = DateFormat('yMMMMd').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    tab();
    getdata();
    // Add listeners to this class
  }

  TimeOfDay toTimeOfDay(String? time) {
    List<String> timeSplit = time!.split(":");
    int hour = int.parse(timeSplit.first);
    int minute = int.parse(timeSplit.last);
    return TimeOfDay(hour: hour, minute: minute);
  }

  void getdata() async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    name = _sharedPreferences.getString('doctorname');
    specialization = _sharedPreferences.getString('doctorspecial');
    gender = _sharedPreferences.getString('gender');
    starttime = toTimeOfDay(_sharedPreferences.getString("starttime"));
    endtime = toTimeOfDay(_sharedPreferences.getString("endtime"));

    print(name);
    print(specialization);
    print(gender);

    //  strttime=
    // endTime=new DateFormat("hh:mm:ss").parse(endtime);

    setState(() {});
    print(starttime!.hour);
    print(endtime);
  }

  int addhour = 0;
  int addHour(int time, int value) {
    addhour = time;
    addhour = addhour + value;
    return addhour;
  }

  List<tabb> _tab = [];
  void tab() {
    _tab = [
      tabb(
        title: addHour(starttime!.hour, 0).toString() +
            ":" +
            starttime!.minute.toString(),
        select: false,
      ),
      tabb(
        title: addHour(starttime!.hour, 1).toString() +
            ":" +
            starttime!.minute.toString(),
        select: false,
      ),
      tabb(
        title: addHour(starttime!.hour, 2).toString() +
            ":" +
            starttime!.minute.toString(),
        select: false,
      ),
      tabb(
        title: addHour(starttime!.hour, 3).toString() +
            ":" +
            starttime!.minute.toString(),
        select: false,
      ),
      tabb(
        title: addHour(starttime!.hour, 4).toString() +
            ":" +
            starttime!.minute.toString(),
        select: false,
      ),
    ];
  }

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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "DR." + name,
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
                          specialization,
                          style: TextStyle(
                              color: textblack,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'poppins'),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
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
                  date: DateTime.now().add(const Duration(days: 0)),
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
                      onTap: () async {
                       
                        final SharedPreferences _sharedPreferences =
                            await SharedPreferences.getInstance();
                        fireStore
                            .doc()
                            .set({
                              'Patient Name':
                                  _sharedPreferences.getString('patientname'),
                              'Age': _sharedPreferences.getString('age'),
                              'Gender': _sharedPreferences.getString('gender'),
                              'Doctor Name': name,
                              'Appointment Time': time,
                              'Appointment Date': _date,
                              'Hospital Name':
                                  _sharedPreferences.getString('Hospital'),
                              'Hospital Address': _sharedPreferences
                                  .getString('Hospital Location'),
                              'Doctor phone':
                                  _sharedPreferences.getString('Phone No'),
                              'Patient email':
                                  _sharedPreferences.getString('email'),
                              'Status': "Pending",
                            })
                            .then((value) {
                                 Get.to(() => DoneAppointment(
                              date: _date,
                              time: time,
                            ));
                            })
                            .onError((error, stackTrace) {
                              Utils().toastMessage(error.toString());
                            });
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
