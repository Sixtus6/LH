import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lh/widget/util/color.dart';
import 'package:lh/widget/util/style.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomGrid extends StatelessWidget {
  const CustomGrid({
    super.key,
    this.rate,
    this.img,
    this.category,
    this.price,
  });
  final String? rate;
  final String? img;
  final String? category;
  final String? price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 150.w,
      decoration: BoxDecoration(
          color: ColorConfig.gray.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15.sp)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              2.height,
              Container(
                decoration: BoxDecoration(
                    color: ColorConfig.yellow.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5.sp)),
                height: 19.h,
                width: 35.w,
                child: Center(
                  child: Text(rate ?? "4.7%",
                      style: StyleConfig.primaryStyle
                          .copyWith(color: Colors.black, fontSize: 15.sp)),
                ),
              ),
            ],
          ),
          5.h.toInt().height,
          Image.network(
            img ?? "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
            width: 110.w,
            height: 90.h,
          ),
          5.h.toInt().height,
          Row(
            children: [
              3.w.toInt().width,
              Text("Category: ",
                  style: StyleConfig.primaryStyle
                      .copyWith(color: ColorConfig.blue, fontSize: 12.sp)),
              Text(category ?? "men's clothing",
                  style: StyleConfig.primaryStyle.copyWith(
                      color: ColorConfig.black.withOpacity(0.7),
                      fontSize: 12.sp))
            ],
          ),
          5.h.toInt().height,
          Row(
            children: [
              3.w.toInt().width,
              Text("Price: ",
                  style: StyleConfig.primaryStyle
                      .copyWith(color: ColorConfig.blue, fontSize: 12.sp)),
              Text('\$${price ?? 64}',
                  style: StyleConfig.primaryStyle.copyWith(
                      color: ColorConfig.black.withOpacity(0.7),
                      fontSize: 12.sp))
            ],
          ),
        ],
      ),
    );
  }
}
