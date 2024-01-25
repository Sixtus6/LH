import 'package:flutter/material.dart';
import 'package:lh/constant/constant.dart';
import 'package:lh/screen/home/provider.dart';
import 'package:lh/widget/app_input_field.dart';
import 'package:lh/widget/customGrid.dart';
import 'package:lh/widget/modal.dart';
import 'package:lh/widget/util/color.dart';
import 'package:lh/widget/util/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    final instances = Provider.of<HomePageProvider>(context, listen: false);
    instances.fetchProduct();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<HomePageProvider>();
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
              /* ------------------------------- Filtering ------------------------------- */
              Container(
                  decoration: BoxDecoration(
                      color: ColorConfig.gray.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5.sp)),
                  height: 40.h,
                  width: 300.w,
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: ColorConfig.blue,
                      ),
                      5.w.toInt().width,
                      Text("Search Category",
                          style: StyleConfig.primaryStyle.copyWith(
                              color: ColorConfig.blue.withOpacity(0.5),
                              fontSize: 16.sp)),
                    ],
                  )).paddingSymmetric(vertical: 20.h).onTap(() {
                showModal(context);
                print("lp");
              }),
              //  5.h.toInt().height,

              Consumer<HomePageProvider>(
                builder: (BuildContext context, provider, _) {
                  return Container(
                    child: Center(
                      child: DropdownButton<String>(
                          iconEnabledColor: ColorConfig.primary,
                          value: provider.category[0],
                          elevation: 1,
                          focusColor: Colors.amber,
                          dropdownColor: ColorConfig.white,
                          borderRadius: BorderRadius.circular(15),
                          onChanged: (newValue) {
                            //.setSelectedItem(newValue);
                          },
                          items: [
                            'Categories',
                            'Mens Clothing ',
                            'Women Clothing',
                            'Jewelery',
                            'Electronics',
                            // Add more items as needed
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: StyleConfig.primaryStyle.copyWith(
                                      color: ColorConfig.blue,
                                      fontSize: 15.sp)),
                            );
                          }).toList()),
                    ),
                  );
                },
              ),

              14.h.toInt().height,
              Row(
                children: [
                  Container(
                    child: Column(children: [
                      // List.generate(controller.products, (index) => Text(data))
                    ]),
                  )
                ],
              ),
              /* ------------------------------- PAGINATION ------------------------------- */
              Container(
                child: Consumer<HomePageProvider>(
                  builder: (BuildContext context, provider, _) {
                    if (!provider.products.isEmpty) {
                      print(provider.products[0].category);
                      print(provider.currentProducts[0].category);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomGrid(
                              rate: provider.currentProducts[0].rate.toString(),
                              img: provider.currentProducts[0].imageUrl,
                              category: provider.currentProducts[0].category,
                              price:
                                  provider.currentProducts[0].price.toString()),
                          10.w.toInt().width,
                          CustomGrid(
                              rate: provider.currentProducts[1].rate.toString(),
                              img: provider.currentProducts[1].imageUrl,
                              category: provider.currentProducts[1].category,
                              price:
                                  provider.currentProducts[1].price.toString()),
                        ],
                      );
                    } else {
                      return Center(
                        child:
                            CircularProgressIndicator(color: ColorConfig.blue),
                      );
                    }
                  },
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
                  child: Consumer<HomePageProvider>(
                    builder: (BuildContext context, provider, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.arrow_circle_left,
                            color: ColorConfig.blue,
                            size: 30,
                          ).onTap(() {
                            provider.previousPage();
                          }),
                          Icon(
                            Icons.arrow_circle_right,
                            color: ColorConfig.blue,
                            size: 30,
                          ).onTap(() {
                            provider.nextPage();
                          })
                        ],
                      );
                    },
                  ),
                ),
              ),
              14.h.toInt().height,
              Text(
                "Top Prices",
                style: StyleConfig.headerStyle,
              ),
              14.h.toInt().height,
              /* -------------------------- SORTING BY TOP PRICE -------------------------- */
              Container(
                height: 300.h,
                child: Consumer<HomePageProvider>(
                  builder: (BuildContext context, provider, _) {
                    if (provider.sortedProducts.isEmpty) {
                      return Center(
                        child:
                            CircularProgressIndicator(color: ColorConfig.blue),
                      );
                    }
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: provider.sortedProducts.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(thickness: 1),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            CustomGrid(
                                    rate: provider.sortedProducts[index].rate
                                        .toString(),
                                    img:
                                        provider.sortedProducts[index].imageUrl,
                                    category:
                                        provider.sortedProducts[index].category,
                                    price: provider.sortedProducts[index].price
                                        .toString())
                                .paddingRight(10),
                          ],
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
