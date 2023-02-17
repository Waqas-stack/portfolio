import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'Services.dart';

class ServiceSectionView extends GetView {
  @override
  Widget build(BuildContext context) {
   return Container(
     margin: EdgeInsets.symmetric(vertical: 40.h),
     constraints: BoxConstraints(maxWidth: 600.w),

     child: Column(
       children: [
         Container(
           margin: EdgeInsets.symmetric(vertical: 20.h),
           constraints: BoxConstraints(maxWidth: 600.w),
           height: 110.h,
           child: Row(
             children: [
               Container(

                 padding: EdgeInsets.only(bottom: 72.h),
                 margin: EdgeInsets.only(right: 5.w),
                 width: 2.w,
                 height: 100.h,
                 color: Colors.black,
                 child: DecoratedBox(decoration: BoxDecoration(
                   color: Color(0xFFFF0000)
                 ),

                 ),
               ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Text("My Strong Area",style: TextStyle(fontWeight: FontWeight.w200,color: Colors.black54,fontSize: 20.sp),),
                   Text("Services Offering",style: Theme.of(context).textTheme.headline2?.copyWith(
                     fontSize: 50.sp,
                     fontWeight: FontWeight.bold,
                     color: Colors.black
                   ),)
                 ],
               )
             ],
           ),

         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: List.generate(services.length, (index) =>  Servicescard(index),)
         )
       ],
     ),
   );
  }
}

class Servicescard extends StatefulWidget {
  final int index;
  Servicescard(this.index);
  @override
  State<Servicescard> createState() => _ServicescardState();
}

class _ServicescardState extends State<Servicescard> {
  bool ishover=false;

  Duration duration=Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      onHover: (value) {
        setState(() {
          ishover=value;
        });
      },
      hoverColor: Colors.transparent,
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(vertical: 20.h),
        height: 256.h,
        width: 126.w,
        decoration: BoxDecoration(
            color: services[widget.index].color,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [if(ishover)BoxShadow(
            offset: Offset(0, 20),
            blurRadius: 50.r,
            color: Colors.black.withOpacity(0.1.r),
          )]
        ),
        duration: duration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center  ,
          children: [
            Container(
              padding: EdgeInsets.all(20.h),
              height: 120.h,
              width: 120.h,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [if(!ishover)BoxShadow(
                  offset: Offset(0,20),
                  blurRadius: 30.r,
                  color: Colors.black.withOpacity(0.1.r),
                )]
              ),
              child: Image.asset(services[widget.index].image,fit: BoxFit.fill,
              height: 20.h,),
            ),
            SizedBox(height: 20.h,),
            Text(services[widget.index].title,style: TextStyle(fontSize: 22.sp),),
          ],
        ),
      ),
    );
  }
}
