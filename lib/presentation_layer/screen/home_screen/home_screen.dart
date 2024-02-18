import 'package:pos_animal/presentation_layer/screen/home_screen/data_table_bill.dart';
import 'package:pos_animal/presentation_layer/screen/home_screen/data_table_member.dart';
import 'package:pos_animal/presentation_layer/screen/home_screen/data_table_order.dart';
import 'package:pos_animal/presentation_layer/screen/home_screen/widget/app_bar.dart';
import 'package:pos_animal/presentation_layer/screen/home_screen/widget/reports.dart';
import 'package:pos_animal/presentation_layer/screen/home_screen/widget/services.dart';
import 'package:pos_animal/presentation_layer/screen/home_screen/widget/side_bar.dart';
import 'package:pos_animal/presentation_layer/src/account_url.dart';
import 'controller/home_controller.dart';

int PAGEID = 0;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return GetBuilder<HomeController>(
            init: HomeController(),
            initState: (_) {},
            builder: (_) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SideBar(),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: AppBarWidget(),
                        ),
                        tableName(),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

Widget tableName() {
  if (PAGEID == 1) {
    return CustomDataTableOrder();
  } else if (PAGEID == 2) {
    return CustomDataTableBill();
  } else if (PAGEID == 0) {
    return ServiceWidget();
  } else if (PAGEID == 3) {
    return CustomDataTableMember();
  } else if (PAGEID == 4) {
    return ReportWidget();
  } else if (PAGEID == 5) {
    return ReportWidget();
  }
  return SizedBox();
}
