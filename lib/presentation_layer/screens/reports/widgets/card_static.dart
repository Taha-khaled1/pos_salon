import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
List<CardStatic> statics = [
  CardStatic(
    title: 'TODAY SELLING',
    money: '2189',
    precetge: '',
    bottomIcon: 'assets/icons/increase.png',
    topIcon: 'assets/icons/selling_icon.png',
  ),
  CardStatic(
    title: 'Today Visitors',
    money: '512',
    precetge: '',
    bottomIcon: 'assets/icons/increase.png',
    topIcon: 'assets/icons/visitors_icon.png',
  ),
  CardStatic(
    title: 'Today Transactions',
    money: '325',
    precetge: '',
    bottomIcon: 'assets/icons/decrease.png',
    topIcon: 'assets/icons/transaction_icon.png',
  ),
  CardStatic(
    title: 'Total Services',
    money: '268',
    precetge: '',
    bottomIcon: 'assets/icons/increase.png',
    topIcon: 'assets/icons/services_icon.png',
  ),
];

class ChartData {
  ChartData(this.x, this.y, this.y1);
  final int x;
  final double y;
  final double y1;
}

final List<ChartData> chartData = <ChartData>[
  ChartData(2010, 10.53, 3.3),
  ChartData(2011, 9.5, 5.4),
  ChartData(2012, 7.5, 1.4),
  ChartData(2013, 2.5, 2.4),
  ChartData(2014, 10.53, 3.3),
  ChartData(2015, 9.5, 5.4),
  // Add more data points as needed
];

class CardStatic extends StatelessWidget {
  const CardStatic({
    super.key,
    required this.title,
    required this.money,
    required this.precetge,
    required this.bottomIcon,
    required this.topIcon
  });
  final String title, money, precetge,bottomIcon,topIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [

          Column(
            children: [
              Row(
                children: [
                  Image.asset(topIcon,height: 15.h,),
                  SizedBox(width: 5.w,),
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xFF6B6B6B),
                      fontSize: 14.sp,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                      // height: 0.13,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                '\$$money',
                style: TextStyle(
                  color: Color(0xFF18120F),
                  fontSize: 35.sp,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w800,
                  // height: 0.03,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(bottomIcon,height: 12.h,),
                  SizedBox(width: 4.w,),
                  Text(
                    '+12%',
                    style: TextStyle(
                      color: Color(0xFF15CAB8),
                      fontSize: 12.sp,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                      // height: 0.11,
                    ),
                  ),
                   SizedBox(width: 5.w),
                  Text(
                    'vc yesterday',
                    style: TextStyle(
                      color: Color(0xFF6B6B6B),
                      fontSize: 12.sp,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                      // height: 0.12,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(width: 10.w,),
          SizedBox(
height: 120.h,
            width: 120.w,
            child: SfCartesianChart(
              palette: [
                Color(0xff15CAB8),
              ],
              plotAreaBorderWidth: 0, // Remove plot area border
              primaryXAxis: NumericAxis(
                isVisible: false, // Hide the X-axis
              ),
              primaryYAxis: NumericAxis(
                isVisible: false, // Hide the Y-axis
              ),
    // Set the background color to transparent
    plotAreaBackgroundColor: Colors.transparent,
    series: <CartesianSeries>[
    SplineAreaSeries<ChartData, int>(
    dataSource: chartData,
    xValueMapper: (ChartData data, _) => data.x,
    yValueMapper: (ChartData data, _) => data.y,
    ),
    ],
    ),
          ),
        ],
      ),
    );
  }
}
