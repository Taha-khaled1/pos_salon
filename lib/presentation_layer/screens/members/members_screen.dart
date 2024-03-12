import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/custom_text_field.dart';
import '../../resources/color_manager.dart';

// ignore: must_be_immutable
class MembersScreen extends StatefulWidget {
  final PageController pageController;

  MembersScreen({super.key, required this.pageController});

  @override
  State<MembersScreen> createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  List<String> items = [
    'First Name',
    'Last Name',
    'username',
    'Email',
    'PhoneNumber',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Members",
              style: TextStyle(
                  color: ColorManager.kPrimary,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                //search field
                CustomTextfield(
                  icon: Icons.search,
                  verticalPadding: 0,
                  height: 45.h,
                  validator: (search) {
                    return null;
                  },
                  onSaved: (search) {
                    return null;
                  },
                  titel: "Search Members...",
                  width: 430.w,
                ),
                SizedBox(
                  width: 20.w,
                ),
                // filter widget
                Expanded(
                  child: SizedBox(
                    height: 38.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: selectedIndex == index
                                    ? ColorManager.beige
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  width: 1,
                                  color: ColorManager.grey2,
                                )),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Center(
                              child: Text(
                                items[index],
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: selectedIndex == index
                                      ? ColorManager.kPrimary
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            // Members table
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Center(
                  child: Column(
                children: [
                  Image.asset(
                    'assets/images/search_empty.png',
                    height: 275.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text("No members found Add new member now",style: TextStyle(
                    fontSize: 22.sp,
                    color: Colors.black,
                      fontWeight: FontWeight.w700
                  ),),

                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: (){
                      widget.pageController.jumpToPage(7);
                    },
                    child: Container(
                      width: 275.w,
                      height: 55.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xffF4E57E),Color(0xffDFC45D),Color(0xffBB9121)]

                        )
                      ),
                      child: Text(
                        "+ Add New Member",
                        style: TextStyle(fontSize: 22.sp, color: Colors.white,fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),

                ],
              )),
            )
          ],
        ),
      ),
    );
  }


}
