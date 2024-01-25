import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lh/widget/util/color.dart';
import 'package:nb_utils/nb_utils.dart';

class StyleConfig {
  static TextStyle primaryStyle = primaryTextStyle(
      color: ColorConfig.iconColor,
      size: 16.sp.toInt(),
      weight: FontWeight.bold);

  static TextStyle defaultWhiteTextStyle = primaryTextStyle(
      color: ColorConfig.iconColor,
      size: 13.sp.toInt(),
      weight: FontWeight.bold);

  static TextStyle defaultBlackTextStyle = primaryTextStyle(
      color: ColorConfig.black, size: 13.sp.toInt(), weight: FontWeight.bold);

  static TextStyle headerStyle = primaryTextStyle(
      color: ColorConfig.black, size: 18.sp.toInt(), weight: FontWeight.bold);
}
