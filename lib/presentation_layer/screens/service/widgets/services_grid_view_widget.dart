import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_animal/presentation_layer/screens/service/widgets/service_details_dialog.dart';

import '../../../resources/color_manager.dart';

class ServicesWidget extends StatefulWidget {
  const ServicesWidget({super.key});

  @override
  State<ServicesWidget> createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
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
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTEnb4bQKUe6UZLmUIKn1u5BqsTmyTA0S8TA&usqp=CAU",
                            ),
                          ))),
                  Text("Hair cut",
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.bold)),
                  Text("\$10.00",
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
