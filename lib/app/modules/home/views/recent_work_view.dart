import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'Recentwork.dart';
import 'about_section_view.dart';

class RecentWorkView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60.h),
      width: double.infinity.w,
      // height: 600,
      decoration: BoxDecoration(
          color: Color(0xFFF7E8FF).withOpacity(0.3.r),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/recent_work_bg.png",))),
      child: Column(
        children: [
          Transform.translate(
            offset: Offset(0, -80),
            child: Hiremecard(),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.h),
            constraints: BoxConstraints(maxWidth: 600.w),
            height: 120.h,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 72.h),
                  margin: EdgeInsets.only(right: 10.w),
                  width: 2.w,
                  height: 100.h,
                  color: Colors.black,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Color(0xFFFFF9C4)),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "My Strong Area",
                      style: TextStyle(fontSize:20.sp,
                          fontWeight: FontWeight.w200, color: Colors.black54),
                    ),
                    Text(
                      "Recent Work",
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black,fontSize:50.sp,),
                    )
                  ],
                ),
              ],
            ),
          ),
          // SizedBox(height: 20*1.5.h,),
          SizedBox(
            width: 600.w,
            child: Wrap(
              spacing: 10.h,
              runSpacing:20.h ,
              children: List.generate(recentWorks.length, (index) => Recentworkcard(index,(){}),),
            ),
          ),
          SizedBox(
            height: 20 * 5.h,
          ),
        ],
      ),
    );
  }
}

class Recentworkcard extends StatefulWidget {
 final int index;
 final VoidCallback ontap;
 Recentworkcard(this.index, this.ontap);

  @override
  State<Recentworkcard> createState() => _RecentworkcardState();
}

class _RecentworkcardState extends State<Recentworkcard> {
  bool ishover=false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:widget.ontap,
      onHover: (value) {
        setState(() {
          ishover=value;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: 320.h,
        width: 250.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [if(ishover)
              BoxShadow(
                offset: Offset(0, 20),
                blurRadius: 50.r,
                color: Colors.black.withOpacity(0.1.r),
              )
            ]),
        child: Row(
          children: [
            Image.asset(recentWorks[widget.index].image,height: 320.h,),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(recentWorks[widget.index].category.toUpperCase(),style: TextStyle(fontSize: 20.sp),),
                    SizedBox(height: 20/2.h,),
                    Text(recentWorks[widget.index].title,style: Theme.of(context).textTheme.headline5?.copyWith(height: 1.5.h,fontSize: 20.sp),),
                    SizedBox(height: 20.h,),
                    Text("View Details",style: TextStyle(decoration: TextDecoration.underline,fontSize:20.sp,),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Hiremecard extends StatelessWidget {
  const Hiremecard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40.h),
      constraints: BoxConstraints(maxWidth: 600.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 20),
              blurRadius: 50,
              color: Colors.black.withOpacity(0.1),
            )
          ]),
      child: Row(
        children: [
          Image.asset(
            "assets/email.png",
            height: 80.h,
            width: 80.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.h),
            child: SizedBox(
              height: 80.h,
              child: VerticalDivider(),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Start New project?",
                  style:
                      TextStyle(fontSize: 42.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10 / 2.h,
                ),
                Text(
                  "Get an estimate for the new project",
                  style: TextStyle(fontWeight: FontWeight.w200,fontSize:20.sp,),
                ),
              ],
            ),
          ),
          Myoulinebutton(
            imgsrc: 'assets/hand.png',
            text: 'Hire me',
            ontap: () {},
          ),
        ],
      ),
    );
  }
}
