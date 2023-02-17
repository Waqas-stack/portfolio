import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'Feedback.dart';

class FeedbackView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10 * 2.5.h),
      constraints: BoxConstraints(maxWidth: 600.w),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            constraints: BoxConstraints(maxWidth: 600.w),
            height: 110.h,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 72.h),
                  margin: EdgeInsets.only(right: 10.w),
                  width: 2.w,
                  height: 100.h,
                  color: Colors.black,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Color(0xFF00B1FF)),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "clint's testimonials that inspired me a lot",
                      style: TextStyle(
                          fontWeight: FontWeight.w200, color: Colors.black54,fontSize: 20.sp),
                    ),
                    Text(
                      "Feedback Received",
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black,fontSize: 50.sp),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
                List.generate(feedbacks.length, (index) => Feedbackcard(index,() {

                },)),
          )
        ],
      ),
    );
  }
}

class Feedbackcard extends StatefulWidget {
  final int index;
  final VoidCallback ontap;

  Feedbackcard(this.index, this.ontap);

  @override
  State<Feedbackcard> createState() => _FeedbackcardState();
}

class _FeedbackcardState extends State<Feedbackcard> {
  bool ishover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      onHover: (value) {
        setState(() {
          ishover = value;
        });
      },
      hoverColor: Colors.transparent,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.only(top: 60.h),
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 350.h,
        width: 100.w,
        decoration: BoxDecoration(
            color: feedbacks[widget.index].color,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              if (ishover)
                BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 50,
                  color: Colors.black.withOpacity(0.1),
                )
            ]),
        child: Column(
          children: [
            Transform.translate(
              child: Container(
                height: 100.h,
                width: 100.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 3.w,
                  ),
                  image: DecorationImage(
                    image: AssetImage(feedbacks[widget.index].userPic),
                  ),
                  boxShadow: [if(!ishover) BoxShadow(
                    offset: Offset(0, 20),
                    blurRadius: 50.r,
                    color: Colors.black.withOpacity(0.1.r),
                  )]
                ),
              ),
              offset: Offset(0, -55),
            ),
            Text(
              feedbacks[widget.index].review,
              style: TextStyle(
                  color: Color(0xFF707070),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  height: 1.5.h),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "waqas ahmad",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),
            )
          ],
        ),
      ),
    );
  }
}
