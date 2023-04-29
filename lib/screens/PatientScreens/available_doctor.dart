import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient_health_monitoring_app/screens/PatientScreens/book_appointment.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';
import 'package:patient_health_monitoring_app/widgets/custom_app_bar.dart';
import 'package:patient_health_monitoring_app/widgets/ractanaglebutton.dart';
import 'package:patient_health_monitoring_app/widgets/searchBAr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AvailableDoctor extends StatelessWidget {
  final searchController = TextEditingController();
  final fireStore =
      FirebaseFirestore.instance.collection('Doctor').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            SizedBox(
              height: 41.h,
            ),
            CustomAppBar(title: "Available Doctor",color:textred ),
            SizedBox(
              height: 41.h,
            ),
            SizedBox(
              height: 15.h,
            ),

            StreamBuilder<QuerySnapshot>(
              stream: fireStore,
              builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData){
                  return CircularProgressIndicator();
                }else{
                   return Expanded(
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Container(
                        height: 240.h,
                        width: 377.w,
                        decoration: BoxDecoration(
                            color: bgcolor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "DR. "+snapshot.data!.docs[index]["name"].toString(),
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'poppins'),
                                      ),
                                      SizedBox(height: 8.h,),
                                       Text(
                                        snapshot.data!.docs[index]["Specialization"].toString(),
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'poppins'),
                                      )
                                    
                                    ],
                                  ),
                                ],
                              ),
                               SizedBox(height: 15.h,),
                              Row(
                                children: [
                                  
                                   Column(crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        snapshot.data!.docs[index]["Phone Number"].toString(),
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'poppins'),
                                      ),
                                       Text(
                                        "Phone",
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'poppins'),
                                      )
                                    
                                    ],
                                  ),
                                    Spacer(),
                                  Container(
                                    height: 28.h,
                                    width: 1.w,
                                    color: textWhite,
                                  ),
                                  Spacer(),
                                    Column(crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        snapshot.data!.docs[index]["email"].toString(),
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'poppins'),
                                      ),
                                       Text(
                                        "Email",
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'poppins'),
                                      )
                                    
                                    ],
                                  ),
                                 
                                  Spacer(),
                                  Container(
                                    height: 28.h,
                                    width: 1.w,
                                    color: textWhite,
                                  ),
                                  
                                  Column(crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        snapshot.data!.docs[index]["Start Time"].toString()+"-"+snapshot.data!.docs[index]["End Time"].toString(),
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'poppins'),
                                      ),
                                       Text(
                                        "Time",
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'poppins'),
                                      )
                                    
                                    ],
                                  ),
                                  
                                  
                                ],
                              ),
                              SizedBox(height: 15.h,),
                              Row(
                                children: [
                                   Text(
                                        snapshot.data!.docs[index]["Hospital Name"].toString()+"\n"+snapshot.data!.docs[index]["Hospital Location"].toString(),
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'poppins'),
                                      ),
                                      Spacer(),
                                      Column(
                                        children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 2,
                                            backgroundColor: iconWhite,
                                          ),
                                           Text(
                                        "Available Today",
                                        style: TextStyle(
                                            color: textWhite,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'poppins'),
                                      ),
                                        ],
                                      ),
                                      
                                        ],
                                      )
                                ],
                              ),
                            SizedBox(height: 13.h,),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RectangleBtn(ontap: () async {
                                    final SharedPreferences _sharedPreferences=await SharedPreferences.getInstance();
                                    _sharedPreferences.setString("doctorname","${snapshot.data!.docs[index]["name"]}");
                                    _sharedPreferences.setString("doctorspecial","${snapshot.data!.docs[index]["Specialization"]}");
                                    _sharedPreferences.setString("starttime","${snapshot.data!.docs[index]["Start Time"]}");
                                    _sharedPreferences.setString("gender","${snapshot.data!.docs[index]["Gender"]}");
                                    _sharedPreferences.setString("endtime","${snapshot.data!.docs[index]["End Time"]}");
                                    _sharedPreferences.setString("Hospital","${snapshot.data!.docs[index]["Hospital Name"]}");
                                    _sharedPreferences.setString("Hospital Location","${snapshot.data!.docs[index]["Hospital Location"]}");
                                    _sharedPreferences.setString("Phone No","${snapshot.data!.docs[index]["Phone Number"]}");
                                    Get.to(()=>BookAppointment());
                                  },title: 'Book Appointment')
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              );
                }
             
            },),
            
            
          ],
        ),
      ),
    );
  }
}
