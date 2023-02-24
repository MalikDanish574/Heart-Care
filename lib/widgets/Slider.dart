import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';

class ImageSlider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Container(
    height: 270.h,
    width:  377.w,
    child: ListView(
        children: [
          CarouselSlider(
              items: [
                  
                //1st Image of Slider
                Container(
                  // margin: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/images/bp1.jpg"),
                      fit: BoxFit.fill
                    ),
                  ),
                ),
                  
                //2nd Image of Slider
                Container(
                  // margin: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/images/bp2.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                  
                // 3rd Image of Slider
                Container(
                  // margin: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image:  AssetImage("assets/images/bp3.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                  
                // //4th Image of Slider
                Container(
                  // margin: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/images/bp4.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
               
          ],
              
            //Slider Container properties
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
          ),
        ],
      ),
   );
  }

}