import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class TopsectionView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      constraints: BoxConstraints(maxHeight: 900.h, minHeight: 700.h),
      width: Get.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("assets/background.png"))),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 80.h),
        width: 900.w,
        child: Stack(
          // alignment: Alignment.center,
          children: [
            logoandBulerbox(),
            Positioned(
              // top: 0,
              // left: 120,
              right: 0,
              bottom: 200.h,
              child: Personpic(),
            ),
            Positioned(
              bottom: 0,
              child: Menu(),
            )
          ],
        ),
      ),
    );
  }
}

class Menu extends StatefulWidget {
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedindex = 0;

  int hoverindex = 0;

  List<String> menusitems = [
    "Home",
    "About",
    "Services",
    "Portfolio",
    "Testimonail",
    "Contact",
  ];

  // const Menu({
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        height: 80.h,
        constraints: BoxConstraints(maxWidth: 600.w),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 50.r),
                blurRadius: 50.r,
                color: Color(0xFF0700B1).withOpacity(0.15.r),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
              List.generate(menusitems.length, (index) => Menuitems(index)),
        ));
  }

  Widget Menuitems(int index) => InkWell(
        onTap: () {
          setState(() {
            selectedindex = index;
          });
        },
        onHover: (value) {
          setState(() {
            value ? hoverindex = index : hoverindex = selectedindex;
          });
        },
        child: Container(
            constraints: BoxConstraints(minWidth: 55.w),
            height: 80.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  menusitems[index],
                  style: TextStyle(color: Colors.black54, fontSize: 20.sp),
                ),

                ///Todo Hover
                AnimatedPositioned(
                    left: 0,
                    right: 0,
                    bottom: selectedindex != index && hoverindex == index
                        ? -12
                        : -32,
                    duration: Duration(milliseconds: 300),
                    child: Image.asset("assets/Hover.png",height: 50.h,)),
                AnimatedPositioned(
                    left: 0,
                    right: 0,
                    bottom: selectedindex == index ? -12 : -32,
                    duration: Duration(milliseconds: 300),
                    child: Image.asset("assets/Hover.png",height: 50.h,)),
              ],
            )),
      );
}

class Personpic extends StatelessWidget {
  const Personpic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 639.w, maxHeight: 860.h),
      child: Image.asset("assets/waqas.png",height: 300.w,),
    );
  }
}

class logoandBulerbox extends StatelessWidget {
  const logoandBulerbox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Spacer(),
        Image.asset("assets/Logo.png",height: 80.r,),
        Spacer(),
        Glassefect(),
        Spacer(
          flex: 3,
        ),
      ],
    );
  }
}

class Glassefect extends StatelessWidget {
  const Glassefect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.w, sigmaY: 10.h),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          constraints:
              BoxConstraints(maxWidth: 600.w, maxHeight: Get.height * 0.7.h),
          width: Get.width,
          color: Colors.white.withOpacity(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hello world",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontSize:40.sp,color: Colors.white)),
              Text(
                "Waqas \nAhmad",
                style: TextStyle(
                    fontSize: 80.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.5.h),
              ),
              Text("Creative Developer",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontSize:40.sp,color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
