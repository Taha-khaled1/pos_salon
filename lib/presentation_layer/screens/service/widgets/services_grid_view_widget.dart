import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos_animal/main.dart';
import 'package:pos_animal/presentation_layer/screens/home_screen/controller/home_controller.dart';
import 'package:pos_animal/presentation_layer/screens/service/widgets/service_details_dialog.dart';

import '../../../resources/color_manager.dart';

class ServicesWidget extends StatefulWidget {
  const ServicesWidget({super.key});

  @override
  State<ServicesWidget> createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> {
  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: homeController.serviceModel?.data?.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              sharedPreferences.setString("s_name",
                  homeController.serviceModel?.data?[index].title ?? "");
              sharedPreferences.setString("s_image",
                  homeController.serviceModel?.data?[index].image ?? "");
              sharedPreferences.setInt(
                  "s_id", homeController.serviceModel?.data?[index].id ?? 0);
              sharedPreferences.setInt("s_price",
                  homeController.serviceModel?.data?[index].price ?? 0);
              showDetailsDialog(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey.shade200),
              child: Column(
                children: [
                  Container(
                      height: 200.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(
                              homeController.serviceModel?.data?[index].image ??
                                  "",
                            ),
                          ))),
                  Text(homeController.serviceModel?.data?[index].title ?? "",
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.bold)),
                  Text(
                      "\$ ${homeController.serviceModel?.data?[index].price ?? ""}",
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.kPrimary)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
