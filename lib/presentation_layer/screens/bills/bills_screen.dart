import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_animal/presentation_layer/screens/Bills/widgets/Bills_table.dart';

import '../../components/custom_text_field.dart';
import '../../resources/color_manager.dart';



class BillsScreen extends StatefulWidget {
  final PageController pageController;
   BillsScreen({super.key,required this.pageController});

  @override
  State<BillsScreen> createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen> {
  List<String> items = [
    'All',
    'Hair cut',
    'color',
    'spa',
    'Routine',
    'Hair cut'
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
              "Bills",
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
                  titel: "Search date...",
                  width: 430.w,
                  suffixIcon: Icon(Icons.date_range,size: 25.w,color: ColorManager.kPrimary,),
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
            SizedBox(height: 20.h,),
            // Bills table
            Align(
                alignment: Alignment.center,
                child: BillsTable(controller: widget.pageController,
                ))
          ],
        ),
      ),
    );
  }
}
