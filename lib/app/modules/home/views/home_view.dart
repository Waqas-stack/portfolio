import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:my_work/app/modules/home/views/recent_work_view.dart';
import 'package:my_work/app/modules/home/views/service_section_view.dart';
import 'package:my_work/app/modules/home/views/topsection_view.dart';

import '../controllers/home_controller.dart';
import 'about_section_view.dart';
import 'cotact_section_view.dart';
import 'feedback_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('HomeView'),
        //   centerTitle: true,
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TopsectionView(),
              SizedBox(height: 10.h,),
              AboutSectionView(),
              ServiceSectionView(),
              RecentWorkView(),
              FeedbackView(),
              SizedBox(height: 50.h,),
              CotactSectionView(),
              // SizedBox(height: 500.h,)
              // Center(
              //   child: Text(
              //     'HomeView is working',
              //     style: TextStyle(fontSize: 20),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
