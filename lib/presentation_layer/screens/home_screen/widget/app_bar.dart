import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_animal/presentation_layer/screens/home_screen/controller/home_controller.dart';
import 'package:pos_animal/presentation_layer/screens/home_screen/home_screen.dart';
import 'package:pos_animal/presentation_layer/screens/home_screen/models/IconTitleHorizantals.dart';

import '../../../src/account_url.dart';

class AppBarWidget extends StatefulWidget {
  final PageController pageController;
  const AppBarWidget({
    super.key,
    required this.pageController
  });

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  int slectindex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      height: 80.h,
      width: double.infinity-125.w,
      color: ColorManager.feathery,
      child: Row(
        children: [
          Image.asset("assets/images/salony_logo.png"),
          SizedBox(
            width: 15.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "salony",
                // sharedPreferences.getString("name")!.length > 8
                //     ? sharedPreferences.getString("name")!.substring(0, 8) +
                //         ".."
                //     : sharedPreferences.getString("name")!,
                style: TextStyle(
                  color: Color(0xFF18181B),
                  fontSize: 20.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  // height: 0.09,
                ),
              ),
              Text(
                "user_name",
                // sharedPreferences.getString("phone")!.length > 8
                //     ? sharedPreferences
                //             .getString("phone")!
                //             .substring(0, 8) +
                //         ".."
                //     : sharedPreferences.getString("phone")!,
                style: TextStyle(
                  color: Color(0xFF828487),
                  fontSize: 18.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  // height: 0.10,
                ),
              ),
            ],
          ),
          Spacer(),
          ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: IconTitleHorizantals.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    slectindex = index;
                    PAGEID = index;
                    HomeController controller = Get.put(HomeController());
                    controller.manualUpdate();
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                  ),
                  child: IconTitleHorizantals[index],
                ),
              );
            },
          ),
          SizedBox(
            width: 30.w,
          ),
          CustomButton(
            rectangel: 30,
            width: 150.w,
            height: 40.h,
            backgroundColor: ColorManager.beige,
            fontSize: 17.sp,
            text: "Add Client",
            colorText: ColorManager.kPrimary,
            press: () {
              widget.pageController.jumpToPage(7);
            },
          ),
          SizedBox(
            width: 30.w,
          ),
          Text(
            "10:35:00  26/2/2023",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 30.w,
          ),
          Container(
            height: 45.h,
            width: 45.w,
            decoration: BoxDecoration(
                color: ColorManager.kPrimary,
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQltQfpfb_OH4uUzeUqOFguqsInW4p56onNGw&usqp=CAU',),fit: BoxFit.cover)
          ))
          // GestureDetector(
          //   child: Text("store oreder"),
          //   onTap: () {
          //     Get.to(() => StoreOrderScreen());
          //   },
          // )
          // SizedBox(
          //   width: 4,
          // ),
          // CustomButton(
          //   width: 110,
          //   height: 40,
          //   backgroundColor: Colors.white,
          //   fontSize: 14,
          //   text: "save oreder",
          //   colorText: ColorManager.kPrimary,
          //   press: () {
          //     Get.to(() => StoreOrderScreen());
          //   },
          // ),
        ],
      ),
    );
  }
}

class CustomAlertDialog extends StatefulWidget {
  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  // Controller for text fields
  TextEditingController field1Controller = TextEditingController();
  TextEditingController field2Controller = TextEditingController();
  TextEditingController field3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Custom Alert Dialog'),
      content: Column(
        children: [
          TextField(
            controller: field1Controller,
            decoration: InputDecoration(labelText: 'Field 1'),
          ),
          TextField(
            controller: field2Controller,
            decoration: InputDecoration(labelText: 'Field 2'),
          ),
          TextField(
            controller: field3Controller,
            decoration: InputDecoration(labelText: 'Field 3'),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // Access the values entered in the text fields
            String value1 = field1Controller.text;
            String value2 = field2Controller.text;
            String value3 = field3Controller.text;

            // Process the values as needed
            // For example, print them to the console
            print('Field 1: $value1');
            print('Field 2: $value2');
            print('Field 3: $value3');

            // Close the dialog
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
