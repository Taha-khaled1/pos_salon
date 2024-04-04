import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pos_animal/presentation_layer/screens/reports/report_controller.dart';
import 'package:pos_animal/presentation_layer/screens/reports/widgets/card_static.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../components/slider_example.dart';
import '../../components/stars_rating.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  final List<ChartData> chartData = [
    ChartData('13 mar', 2000, 3000, ColorManager.kPrimary, Color(0xffEECA5E)),
    ChartData('14 mar', 2000, 3000, ColorManager.kPrimary, Color(0xffEECA5E)),
    ChartData('15 mar', 4000, 4000, ColorManager.kPrimary, Color(0xffEECA5E)),
    ChartData('16 mar', 3500, 4500, ColorManager.kPrimary, Color(0xffEECA5E)),
    ChartData('17 mar', 2400, 4400, ColorManager.kPrimary, Color(0xffEECA5E)),
    ChartData('18 mar', 3400, 2300, ColorManager.kPrimary, Color(0xffEECA5E)),
    ChartData('19 mar', 4000, 4000, ColorManager.kPrimary, Color(0xffEECA5E)),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportController>(
        init: ReportController(),
        builder: (_) {
          return _.load
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Reports",
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.kPrimary,
                          fontSize: 26.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 0.43.sw,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 0.21.sw,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 10.h),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Color(0xffF8F8F8),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: CardStatic(
                                        title: 'TODAY SELLING',
                                        money: '2189',
                                        precetge: '',
                                        bottomIcon: 'assets/icons/increase.png',
                                        topIcon:
                                            'assets/icons/selling_icon.png',
                                      ),
                                    ),
                                    Container(
                                      width: 0.21.sw,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 10.h),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Color(0xffF8F8F8),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: CardStatic(
                                        title: 'Today Visitors',
                                        money: '512',
                                        precetge: '',
                                        bottomIcon: 'assets/icons/increase.png',
                                        topIcon:
                                            'assets/icons/visitors_icon.png',
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20.h, horizontal: 20.w),
                                  decoration: BoxDecoration(
                                      color: Color(0xffF8F8F8),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Top services sales",
                                            style: TextStyle(
                                                fontSize: 24.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Spacer(),
                                          Container(
                                            height: 35.h,
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  hint: Text(
                                                    'week',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 16.sp),
                                                  ),
                                                  onChanged: (newValue) {},
                                                  items: [],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        children: [
                                          Spacer(),
                                          Container(
                                            height: 12.h,
                                            width: 12.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              color: ColorManager.kPrimary,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            "previous",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Container(
                                            height: 12.h,
                                            width: 12.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              color: Color(0xffEECA5E),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            "current",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 0.4.sw,
                                        child: SfCartesianChart(
                                          primaryXAxis: CategoryAxis(),
                                          primaryYAxis: NumericAxis(
                                            minimum: 0,
                                            maximum: 5000,
                                            interval: 1000,
                                          ),
                                          series: <ColumnSeries<ChartData,
                                              String>>[
                                            ColumnSeries<ChartData, String>(
                                              dataSource: chartData,
                                              xValueMapper:
                                                  (ChartData data, _) =>
                                                      data.day,
                                              yValueMapper:
                                                  (ChartData data, _) =>
                                                      data.value1,
                                              pointColorMapper:
                                                  (ChartData data, _) =>
                                                      data.color1,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              name: 'First Column',
                                            ),
                                            ColumnSeries<ChartData, String>(
                                              dataSource: chartData,
                                              xValueMapper:
                                                  (ChartData data, _) =>
                                                      data.day,
                                              yValueMapper:
                                                  (ChartData data, _) =>
                                                      data.value2,
                                              pointColorMapper:
                                                  (ChartData data, _) =>
                                                      data.color2,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              name: 'Second Column',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Order Status",
                                      style: TextStyle(
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Spacer(),
                                    Container(
                                      height: 35.h,
                                      width: 110.w,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade50,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            hint: Text(
                                              'Sort by',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16.sp),
                                            ),
                                            onChanged: (newValue) {},
                                            items: [],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  width: 0.45.sw,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 15.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xffFAFAFA),
                                  ),
                                  child: DataTable(
                                    headingTextStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                    dataTextStyle: TextStyle(
                                        fontSize: 18.0.h, color: Colors.black),
                                    columns: [
                                      DataColumn(
                                        label: Text(
                                          'Order ID',
                                          style: MangeStyles().getBoldStyle(
                                            color: ColorManager.black,
                                            fontSize: 18.h,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Row(
                                          children: [
                                            Text(
                                              'OrderDate',
                                              style: MangeStyles().getBoldStyle(
                                                color: ColorManager.black,
                                                fontSize: 18.h,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Image.asset(
                                              'assets/icons/mobile_data.png',
                                              height: 15.h,
                                            )
                                          ],
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Status',
                                          style: MangeStyles().getBoldStyle(
                                            color: ColorManager.black,
                                            fontSize: 18.h,
                                          ),
                                        ),
                                      ),
                                    ],
                                    rows: [
                                      for (int i = 0; i < 4; i++)
                                        DataRow(
                                          cells: [
                                            DataCell(Text(
                                              '#01005',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color: ColorManager.kPrimary),
                                            )),
                                            DataCell(Text(
                                              '17 May 2022, 10:00 PM',
                                              style: TextStyle(fontSize: 16.sp),
                                            )),
                                            DataCell(
                                              Container(
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Color(0xffE1FFDC),
                                                ),
                                                child: Text(
                                                  'complete',
                                                  style: TextStyle(
                                                      color: Color(0xff07A104)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 0.43.sw,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20.h, horizontal: 10.w),
                                  decoration: BoxDecoration(
                                      color: Color(0xffF8F8F8),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Best Selling Product",
                                            style: TextStyle(
                                                fontSize: 24.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Spacer(),
                                          Container(
                                            height: 35.h,
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  hint: Text(
                                                    'week',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 16.sp),
                                                  ),
                                                  onChanged: (newValue) {},
                                                  items: [],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      SizedBox(
                                        width: 0.4.sw,
                                        height: 250.h,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 5,
                                            itemBuilder:
                                                (ctx, ind) => Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      height: 250.h,
                                                      width: 220.w,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.w),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5.w,
                                                              vertical: 5.h),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            height: 150.h,
                                                            width: 200.w,
                                                            decoration:
                                                                BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    image: DecorationImage(
                                                                        image: NetworkImage(
                                                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTEnb4bQKUe6UZLmUIKn1u5BqsTmyTA0S8TA&usqp=CAU',
                                                                        ),
                                                                        fit: BoxFit.cover)),
                                                          ),
                                                          Text(
                                                            "Hair cut",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 18.sp,
                                                                color: Color(
                                                                    0xff19191c)),
                                                          ),
                                                          Text(
                                                            "\$ 25.12",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 18.sp,
                                                                color: ColorManager
                                                                    .kPrimary),
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20.h, horizontal: 20.w),
                                  decoration: BoxDecoration(
                                      color: Color(0xffF8F8F8),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/icons/star_icon.png',
                                                height: 20.h,
                                                width: 20.w,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                "OUR SATISFIED CLIENTS",
                                                style: TextStyle(
                                                    fontSize: 20.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Container(
                                            height: 35.h,
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  hint: Text(
                                                    'week',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 16.sp),
                                                  ),
                                                  onChanged: (newValue) {},
                                                  items: [],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "+12,189",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 42.sp),
                                              ),
                                              StarRating(
                                                starCount: 5,
                                                rating: 4,
                                                color: Colors.amber,
                                                size: 30.0.w,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 0.22.sw,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 75.w,
                                                      child: Text(
                                                        "EMPLOYEE",
                                                        style: TextStyle(
                                                            fontSize: 14.sp),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 0.165.sw,
                                                      child: SliderExample(
                                                        value: 70.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 75.w,
                                                      child: Text(
                                                        "PRODUCTS",
                                                        style: TextStyle(
                                                            fontSize: 14.sp),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 0.165.sw,
                                                      child: SliderExample(
                                                        value: 60.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 75.w,
                                                      child: Text(
                                                        "OTHER",
                                                        style: TextStyle(
                                                            fontSize: 14.sp),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 0.165.sw,
                                                      child: SliderExample(
                                                        value: 50.0,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20.h, horizontal: 20.w),
                                  decoration: BoxDecoration(
                                      color: Color(0xffF8F8F8),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Reservation",
                                            style: TextStyle(
                                                fontSize: 24.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Spacer(),
                                          Container(
                                            height: 35.h,
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  hint: Text(
                                                    'week',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 16.sp),
                                                  ),
                                                  onChanged: (newValue) {},
                                                  items: [],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 12.h,
                                            width: 12.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              color: Color(0xffD3FFE3),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            "Un recervied",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Container(
                                            height: 12.h,
                                            width: 12.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              color: Color(0xff036666),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            "recervied",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                      SizedBox(height: 10.h),
                                      SizedBox(
                                        height: 240.h,
                                        width: 540.w,
                                        child: GridView.count(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          crossAxisSpacing:
                                              5.w, // Space between columns
                                          mainAxisSpacing:
                                              5.h, // Space between rows
                                          crossAxisCount: 7,
                                          childAspectRatio: 2,
                                          children: List.generate(49, (index) {
                                            return Container(
                                              height: 30.h,
                                              width: 70.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                color: index % 3 != 0
                                                    ? Color(0xffD3FFE3)
                                                    : Color(0xff036666),
                                              ),
                                            );
                                          }),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
        });
  }
}

class ChartData {
  final String day;
  final double value1;
  final double value2;
  final Color color1;
  final Color color2;

  ChartData(this.day, this.value1, this.value2, this.color1, this.color2);
}
