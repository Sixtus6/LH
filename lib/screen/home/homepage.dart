import 'package:flutter/material.dart';
import 'package:lh/constant/constant.dart';
import 'package:lh/widget/app_input_field.dart';
import 'package:lh/widget/customGrid.dart';
import 'package:lh/widget/util/color.dart';
import 'package:lh/widget/util/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConfig.white,
        appBar: AppBar(
          backgroundColor: ColorConfig.white,
          elevation: 3,
          title: Text(
            "Popular Products",
            style: StyleConfig.headerStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: AppInputField(
                    fillColor: ColorConfig.gray.withOpacity(0.2),
                    prefixIcon: Icon(
                      Icons.search,
                      color: ColorConfig.blue,
                    ),
                    controller: inputController,
                  )),
              Container(
                //  padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomGrid(),
                    10.w.toInt().width,
                    CustomGrid(),
                  ],
                ),
              ),
              20.h.toInt().height,
              Container(
                decoration: BoxDecoration(
                    color: ColorConfig.gray.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15.sp)),
                height: 30.h,
                width: 120,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.arrow_circle_left,
                        color: ColorConfig.blue,
                        size: 30,
                      ),
                      0.height.expand(),
                      Icon(
                        Icons.arrow_circle_right,
                        color: ColorConfig.blue,
                        size: 30,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
