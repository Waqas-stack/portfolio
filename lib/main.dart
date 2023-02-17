import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<FirebaseApp> _intilization=Firebase.initializeApp();
  runApp(


    FutureBuilder(
      future: _intilization,
      builder: (BuildContext context, snapshot) {
        if(snapshot.hasError){
          print("Error");
        }if(snapshot.connectionState==ConnectionState.done){
          return ScreenUtilInit(
            designSize: Size(1001, 1008),
            minTextAdapt: true,
            builder: (BuildContext context, Widget? child) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: "My_Work",
                initialRoute: AppPages.INITIAL,
                theme: ThemeData(
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: Color(0xFFCEE4FD),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: Color(0xFFCEE4FD),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: Color(0xFFCEE4FD),
                      ),
                    ),
                  ),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                getPages: AppPages.routes,
              );
            },
          );
        }
        return Center(child: CircularProgressIndicator());

      },
    ),
  );
}
