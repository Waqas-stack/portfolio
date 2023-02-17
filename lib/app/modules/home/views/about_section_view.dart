import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class AboutSectionView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 10.0 * 2.h),
      constraints: BoxConstraints(maxWidth: 600.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AboutwithSign(),
              Expanded(
                child: Container(
                  // flex: 3,
                  width: 50.h,
                  height: 50.h,
                  child: AboutSectiontext(
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras non augue sodales, ullamcorper tortor eu, suscipit neque. ',
                  ),
                ),
              ),
              Expericecard(
                ex: '02',
              ),
              Expanded(
                child: Container(
                  // flex: 3,
                  width: 50.h,
                  height: 50.h,
                  child: AboutSectiontext(
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras non augue sodales, ullamcorper tortor eu, suscipit neque.',
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Myoulinebutton(
                imgsrc: 'assets/hand.png',
                text: 'Hire me',
                ontap: () {},
              ),
              SizedBox(
                width: 20.w,
              ),
              FlatButton(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.h, vertical: 20.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.w)),
                  color: Color(0xFFE8F0F9),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/download.png",
                        height: 40.h,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Download cv",
                        style: TextStyle(fontSize:20.sp,color: Colors.black54),
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class Myoulinebutton extends StatelessWidget {
  final String imgsrc, text;
  final VoidCallback ontap;

  Myoulinebutton(
      {required this.text, required this.imgsrc, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: OutlinedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 40.0.w),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.r),
                side: BorderSide(color: Color(0xFFEDEDED))
                // side: BorderSide()
                ),
          ),
        ),
        onPressed: ontap,
        child: Row(
          children: [
            Image.asset(
              imgsrc,
              height: 40.h,
            ),
            SizedBox(
              width: 20.h,
            ),
            Text(
              text,
              style: TextStyle(fontSize:20.sp,color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}

class Expericecard extends StatelessWidget {
  final String ex;

  Expericecard({required this.ex});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      padding: EdgeInsets.all(20.h),
      height: 260.h,
      // 180.h,
      width: 120.w,
      // 200.h,
      // 60.w,
      decoration: BoxDecoration(
          color: Color(0xFFEDD2FC), borderRadius: BorderRadius.circular(10.r)),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xFFEDD2FC),
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 6.r,
              color: Color(0xFFA600FF).withOpacity(0.25.r),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Text(
                  ex,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.sp,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6.r
                        ..color = Color(0xFFDFA3FF).withOpacity(0.5.r),
                      shadows: [
                        BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 10.r,
                            color: Color(0xFFA600FF).withOpacity(0.5.r))
                      ]),
                ),
                Text(
                  ex,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.sp,
                      color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Year of Experience",
              style: TextStyle(
                  fontSize:20.sp,
                  color: Color(0xFFA600FF)),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutSectiontext extends StatelessWidget {
  String text;
  var myGroup = AutoSizeGroup();
  AboutSectiontext({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0.w),
      child: AutoSizeText(
        text,
        // group: myGroup,
           // maxLines: 1,
        stepGranularity: 3,

        style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w200,
             height: 00.h,
            color: Colors.black54),
      ),
    );
  }
}

class AboutwithSign extends StatelessWidget {
  const AboutwithSign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "About \nmy story",
          style: Theme.of(context).textTheme.headline2?.copyWith(
              fontSize: 80.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20.h,
        ),
        Image.asset("assets/sign.png",height: 50.h,)
      ],
    );
  }
}
