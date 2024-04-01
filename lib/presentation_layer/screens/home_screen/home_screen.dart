import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_animal/presentation_layer/screens/bills/bill_details_screen.dart';
import 'package:pos_animal/presentation_layer/screens/bills/bills_screen.dart';
import 'package:pos_animal/presentation_layer/screens/home_screen/controller/home_controller.dart';
import 'package:pos_animal/presentation_layer/screens/home_screen/widget/IconTitleVertical.dart';
import 'package:pos_animal/presentation_layer/screens/home_screen/widget/app_bar.dart';
import 'package:pos_animal/presentation_layer/screens/members/add_new_member_screen.dart';
import 'package:pos_animal/presentation_layer/screens/members/members_screen.dart';
import 'package:pos_animal/presentation_layer/screens/orders/orders_screen.dart';
import 'package:pos_animal/presentation_layer/screens/reservation/reservation_screen.dart';
import 'package:pos_animal/presentation_layer/screens/service/new_recerviation_screen.dart';
import 'package:pos_animal/presentation_layer/screens/service/service_screen.dart';
import 'package:pos_animal/presentation_layer/src/account_url.dart';
import '../reports/report_screen.dart';
import 'models/IconTitleVerticals.dart';

int PAGEID = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());
  late int select = 0;
  late PageController controller;
  @override
  void initState() {
    controller = PageController(initialPage: select, keepPage: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //sideBar
            Container(
              width: 125.w,
              height: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 15.w),
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(-0.04, 0.92),
                  radius: 0,
                  colors: [Color(0xFF12798A), Color(0xFF0E5D6A)],
                ),
              ),
              child: ListView.builder(
                itemCount: iconsAndTitlesData.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        select = index;
                        controller.jumpToPage(index);
                      });
                    },
                    child: Container(
                      width: 80.w,
                      height: 85.h,
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Color(0xFFBB9121),
                            Color(0xFFDFC45D),
                            Color(0xFFF4E57E)
                          ],
                        ),
                        color: select == index
                            ? Color(0xffBB9121)
                            : Colors.transparent,
                      ),
                      child: IconTitleVertical(
                        color: select != index
                            ? Color(0xFFFFF9C9)
                            : ColorManager.kPrimary,
                        image: iconsAndTitlesData[index]['image'].toString(),
                        title: iconsAndTitlesData[index]['title'].toString(),
                      ),
                    ),
                  );
                },
              ),
            ),
            // AppBar and PageView
            Expanded(
              child: Column(
                children: [
                  AppBarWidget(
                    pageController: controller,
                  ),
                  // page view
                  Expanded(
                    child: PageView(
                      controller: controller,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        // 0-5
                        ServiceScreen(controller: controller),
                        OrdersScreen(),
                        OrdersScreen(),
                        // ReservationScreen(),
                        BillsScreen(
                          pageController: controller,
                        ),
                        MembersScreen(pageController: controller),
                        ReportsScreen(),
                        //Additional interfaces
                        BillDetailsScreen(),
                        AddNewMemberScreen(),
                        NewRecerviationScreen(
                          controller: controller,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
