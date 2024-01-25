import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lh/constant/constant.dart';
import 'package:lh/screen/home/provider.dart';
import 'package:lh/widget/app_input_field.dart';
import 'package:lh/widget/customGrid.dart';
import 'package:lh/widget/util/color.dart';
import 'package:lh/widget/util/style.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class MyBottomModalContent extends StatefulWidget {
  MyBottomModalContent({
    Key? key,
    required this.itemList,
  }) : super(key: key);

  final List itemList;
  @override
  _MyBottomModalContentState createState() => _MyBottomModalContentState();
}

class _MyBottomModalContentState extends State<MyBottomModalContent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (BuildContext context, provider, _) {
        return Container(
          color: ColorConfig.white,
          height: 600.h,
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Text("Total Categories: ${provider.products.length}",
                  style: StyleConfig.primaryStyle
                      .copyWith(color: ColorConfig.blue, fontSize: 12.sp)),
              5.height,
              Text(
                  "${provider.filteredProducts.length}/ ${provider.products.length}",
                  style: StyleConfig.primaryStyle
                      .copyWith(color: ColorConfig.blue, fontSize: 12.sp)),
              AppInputField(
                hintText: "Search By Category",
                fillColor: ColorConfig.gray.withOpacity(0.2),
                // readOnly: true,
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorConfig.blue,
                ),
                onChanged: (value) {
                  final userWalletInstance =
                      Provider.of<HomePageProvider>(context, listen: false);
                  userWalletInstance.searchProducts(value);
                  print(value);
                },
                controller: inputController,
              ),
              SizedBox(height: 7),
              Expanded(
                  child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: provider.filteredProducts.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(thickness: 1),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      CustomGrid(
                              rate: provider.filteredProducts[index].rate
                                  .toString(),
                              img: provider.filteredProducts[index].imageUrl,
                              category:
                                  provider.filteredProducts[index].category,
                              price: provider.filteredProducts[index].price
                                  .toString())
                          .paddingRight(10),
                    ],
                  );
                },
              )),
            ],
          ),
        );
      },
    );
  }
}

void showModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    // isDismissible: false,
    builder: (BuildContext context) {
      final controller = context.read<HomePageProvider>();
      return MyBottomModalContent(
        itemList: controller.filteredProducts,
      );
    },
  );
}
