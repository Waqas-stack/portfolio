import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'about_section_view.dart';

class CotactSectionView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 1800.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFE8F0F9),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/bg_img_2.png"),
        ),
      ),
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
                  margin: EdgeInsets.only(right: 10.w),
                  width: 2.w,
                  height: 100.h,
                  color: Colors.black,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Color(0xFF07E24A)),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "For project inquiry and information",
                      style: TextStyle(
                          fontWeight: FontWeight.w200, color: Colors.black54,fontSize: 20.sp),
                    ),
                    Text(
                      "Contact me",
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black,fontSize: 50.sp),
                    )
                  ],
                ),
              ],
            ),
          ),
          ContactBox()
        ],
      ),
    );
  }
}

class ContactBox extends StatelessWidget {
  const ContactBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 600.w),
      margin: EdgeInsets.only(
        top: 30.h,
      ),
      padding: EdgeInsets.all(40.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Socialcard(
                iconsrc: 'assets/skype.png',
                colour: Color(0xFFD9FFFC),
                text: 'Skype',
                ontap: () {},
              ),
              Socialcard(
                iconsrc: 'assets/whatsapp.png',
                colour: Color(0xFFE4FFC7),
                text: 'Whatsapp',
                ontap: () {},
              ),
              Socialcard(
                iconsrc: 'assets/messanger.png',
                colour: Color(0xFFE8F0F9),
                text: 'Facebook',
                ontap: () {},
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          ContactForm()
        ],
      ),
    );
  }
}

class ContactForm extends StatelessWidget {
  const ContactForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Wrap(
          alignment: WrapAlignment.center,
      spacing: 10
           * 1.5.sp,
      runSpacing: 10
           * 1.5.sp,
      children: [
        SizedBox(
          width: 270.w,
          child: TextFormField(
            onChanged: (value) {},
            decoration: InputDecoration(
                labelText: "Your Name", hintText: "Enter Your Name"),
          ),
        ),

        SizedBox(
          width: 270.w,
          child: TextFormField(
            onChanged: (value) {},
            decoration: InputDecoration(
                labelText: "Your Email", hintText: "Enter Your Email"),
          ),
        ),
        SizedBox(
          width: 270.w,
          child: TextFormField(
            onChanged: (value) {},
            decoration: InputDecoration(
                labelText: "Your Project", hintText: "Enter Your Project Name"),
          ),
        ),
        SizedBox(
          width: 270.w,
          child: TextFormField(
            onChanged: (value) {},
            decoration: InputDecoration(
                labelText: "Your budget", hintText: "Enter Your Project Budget"),
          ),
        ),
        SizedBox(
          // height: 300.h,
          child: TextFormField(
            onChanged: (value) {},
            decoration: InputDecoration(
                labelText: "Project Description", hintText: "Enter Your Project Description "),
          ),
        ),
        // SizedBox(height: 40.h,),
        Center(
          child: Myoulinebutton(
            imgsrc: 'assets/contact_icon.png',
            text: 'Contact me',
            ontap: () {},
          ),
        ),
      ],
    ),);
  }
}

class Socialcard extends StatefulWidget {
  final String text, iconsrc;
  final Color colour;
  final VoidCallback ontap;

  Socialcard(
      {required this.text,
      required this.iconsrc,
      required this.colour,
      required this.ontap});

  @override
  State<Socialcard> createState() => _SocialcardState();
}

class _SocialcardState extends State<Socialcard> {
  bool ishove = false;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: InkWell(
        onTap: widget.ontap,
        onHover: (value) {
          setState(() {
            ishove = value;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding:
              EdgeInsets.symmetric(vertical: 20 / 2.h, horizontal: 20 * 1.5.w),
          decoration: BoxDecoration(
            color: widget.colour,
            //
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              if (ishove)
                BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 50.r,
                  color: Colors.black.withOpacity(0.1.r),
                ),
            ],
          ),
          child: Row(
            children: [
              Image.asset(
                widget.iconsrc,
                height: 80.h,
                width: 50.w,
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                widget.text,
                style: TextStyle(fontSize: 20.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
