import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_animal/presentation_layer/screens/home_screen/controller/home_controller.dart';
import 'package:pos_animal/presentation_layer/screens/home_screen/home_screen.dart';
import 'package:pos_animal/presentation_layer/screens/service/widgets/right_side_widget.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:pos_animal/presentation_layer/src/account_url.dart';
import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_field.dart';
import '../../resources/color_manager.dart';

class NewRecerviationScreen extends StatefulWidget {
  final PageController controller;
  const NewRecerviationScreen({super.key, required this.controller});

  @override
  State<NewRecerviationScreen> createState() => _NewRecerviationScreenState();
}

class _NewRecerviationScreenState extends State<NewRecerviationScreen> {
  List<String> items = [
    'All',
    'Hair cut',
    'color',
    'spa',
    'Routine',
    'Hair cut'
  ];
  int selectedIndex = 0;

  // number of individuals
  int selectedNumberIndex = -1;
  final List<String> numbers = ['1', '2', '3', '4', '5', '6', '7', '8+'];

  // date
  int selectedDayIndex = -1;
  final List<String> weekdays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];
  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New recerviation",
                    style: TextStyle(
                        color: ColorManager.kPrimary,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // Row(
                  //   children: [
                  //     //search field
                  //     CustomTextfield(
                  //       icon: Icons.search,
                  //       verticalPadding: 0,
                  //       height: 45.h,
                  //       validator: (search) {
                  //         return null;
                  //       },
                  //       onSaved: (search) {
                  //         return null;
                  //       },
                  //       titel: "Search date...",
                  //       width: 430.w,
                  //     ),
                  //     SizedBox(
                  //       width: 20.w,
                  //     ),
                  //     // filter widget
                  //     Expanded(
                  //       child: SizedBox(
                  //         height: 38.h,
                  //         child: ListView.builder(
                  //           scrollDirection: Axis.horizontal,
                  //           itemCount: items.length,
                  //           itemBuilder: (BuildContext context, int index) {
                  //             return GestureDetector(
                  //               onTap: () {
                  //                 setState(() {
                  //                   selectedIndex = index;
                  //                 });
                  //               },
                  //               child: Container(
                  //                 decoration: BoxDecoration(
                  //                     color: selectedIndex == index
                  //                         ? ColorManager.beige
                  //                         : Colors.white,
                  //                     borderRadius: BorderRadius.circular(30),
                  //                     border: Border.all(
                  //                       width: 1,
                  //                       color: ColorManager.grey2,
                  //                     )),
                  //                 alignment: Alignment.center,
                  //                 padding: EdgeInsets.symmetric(
                  //                   horizontal: 10.w,
                  //                 ),
                  //                 margin:
                  //                     EdgeInsets.symmetric(horizontal: 10.w),
                  //                 child: Center(
                  //                   child: Text(
                  //                     items[index],
                  //                     style: TextStyle(
                  //                       fontSize: 16.sp,
                  //                       color: selectedIndex == index
                  //                           ? ColorManager.kPrimary
                  //                           : Colors.black,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             );
                  //           },
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 20.h,
                  // ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffFAFAFA),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            children: [
                              Text(
                                "New reservation",
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: ColorManager.kPrimary,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 20.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Number of individuals",
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.5,
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Table(
                                  border: TableBorder.all(
                                      width: 0.5,
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10)),
                                  children: [
                                    TableRow(
                                      children: List.generate(
                                        numbers.length,
                                        (index) =>
                                            buildTableCell(index, numbers),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "select date",
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),

                              EasyDateTimeLine(
                                initialDate: DateTime.now(),
                                onDateChange: (selectedDate) {
                                  homeController.selectedDateN = selectedDate;
                                },
                                headerProps: const EasyHeaderProps(
                                  monthPickerType: MonthPickerType.switcher,
                                  dateFormatter: DateFormatter.fullDateDMY(),
                                ),
                                dayProps: const EasyDayProps(
                                  width: 120,
                                  height: 70,
                                  dayStructure: DayStructure.dayStrDayNum,
                                  activeDayStyle: DayStyle(
                                    dayNumStyle: TextStyle(color: Colors.black),
                                    monthStrStyle:
                                        TextStyle(color: ColorManager.black),
                                    dayStrStyle:
                                        TextStyle(color: ColorManager.black),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xffFFFACA),
                                          Color(0xffFFFACA),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Container(
                              //   decoration: BoxDecoration(
                              //     border: Border.all(
                              //       width: 0.5,
                              //       color: Colors.grey,
                              //     ),
                              //     borderRadius: BorderRadius.circular(10),
                              //   ),
                              //   child: Table(
                              //     border: TableBorder.all(
                              //         width: 0.5,
                              //         color: Colors.grey,
                              //         borderRadius: BorderRadius.circular(10)),
                              //     children: [
                              //       TableRow(
                              //         children: List.generate(
                              //           weekdays.length,
                              //           (index) =>
                              //               buildTableCell2(index, weekdays),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              SizedBox(
                                height: 30.h,
                              ),
                              TimeSlotSelector(),
                              SizedBox(
                                height: 30.h,
                              ),
                              Row(
                                children: [
                                  CustomElevatedButton(
                                    height: 50.h,
                                    width: 400.w,
                                    backgroundColor: Colors.white,
                                    borderColor: ColorManager.kPrimary,
                                    text: 'cancel',
                                    onPressed: () {
                                      Get.offAll(() => HomeScreen());
                                    },
                                    textSize: 18.sp,
                                    textColor: ColorManager.kPrimary,
                                    iconColor: ColorManager.kPrimary,
                                    borderRadius: 30,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  GetBuilder<HomeController>(
                                    init: HomeController(),
                                    initState: (_) {},
                                    builder: (_) {
                                      return _.isLoad1
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : CustomElevatedButton(
                                              height: 50.h,
                                              width: 400.w,
                                              backgroundColor:
                                                  ColorManager.kPrimary,
                                              borderColor:
                                                  ColorManager.kPrimary,
                                              text: 'Pay Now',
                                              onPressed: () {
                                                homeController.createOrder();
                                              },
                                              textSize: 18.sp,
                                              textColor: ColorManager.white,
                                              iconColor: ColorManager.kPrimary,
                                              borderRadius: 30,
                                            );
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  // Bills table
                ],
              ),
            ),
          ),
          RightSideWidget(controller: widget.controller)
        ],
      ),
    );
  }

  TableCell buildTableCell(int index, List myList) {
    HomeController homeController = Get.find();
    final bool isSelected = selectedNumberIndex == index;
    return TableCell(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedNumberIndex = index;
            homeController.indvidual = selectedNumberIndex;
          });
        },
        child: Container(
          height: 65.h,
          alignment: Alignment.center,
          color: isSelected ? ColorManager.beige : Colors.transparent,
          child: Text(
            myList[index],
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: isSelected ? ColorManager.kPrimary : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  TableCell buildTableCell2(int index, List myList) {
    final bool isSelected = selectedDayIndex == index;
    return TableCell(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedDayIndex = index;
          });
        },
        child: Container(
          height: 80.h,
          alignment: Alignment.center,
          color: isSelected ? ColorManager.beige : Colors.transparent,
          child: Column(
            children: [
              Text(
                myList[index],
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? ColorManager.kPrimary : Colors.black,
                ),
              ),
              Text(
                index.toString(),
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? ColorManager.kPrimary : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeSlotSelector extends StatefulWidget {
  @override
  _TimeSlotSelectorState createState() => _TimeSlotSelectorState();
}

class _TimeSlotSelectorState extends State<TimeSlotSelector> {
  List<String> _timeSlots = [
    '09:00 AM', '09:15 AM', '11:00 AM', // ... Add all the times
    '12:45 PM', '01:00 PM', '01:15 PM', // ... Continue for all slots
    '02:45 PM', '03:00 PM', '05:15 PM', // ... Add remaining slots
    '06:00 PM', '07:15 AM', '07:45 AM', // ... And so on
    '08:30 PM', '08:45 AM', // '09:00 AM', // ... Until the end
  ];

  String? _selectedTimeSlot;
  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Adjust number of columns
          childAspectRatio: 3.0, // Adjust the aspect ratio
        ),
        itemCount: _timeSlots.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTimeSlot = _timeSlots[index];
                homeController.slot = _selectedTimeSlot!.split(' ').first;
                print(_selectedTimeSlot!.split(' ').first);
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: _selectedTimeSlot == _timeSlots[index]
                    ? Colors.yellow
                    : Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.all(4.0),
              child: Text(
                _timeSlots[index],
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
