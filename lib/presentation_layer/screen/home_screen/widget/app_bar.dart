import 'package:pos_animal/presentation_layer/screen/home_screen/controller/home_controller.dart';
import 'package:pos_animal/presentation_layer/screen/home_screen/home_screen.dart';
import 'package:pos_animal/presentation_layer/screen/home_screen/models/IconTitleHorizantals.dart';
import 'package:pos_animal/presentation_layer/screen/home_screen/widget/change_password.dart';
import 'package:pos_animal/presentation_layer/screen/store_order/store_order.dart';

import '../../../src/account_url.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  int slectindex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      height: 75,
      color: Color(0xFFE5FBFF),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Image.asset("assets/images/salony_logo.png"),
          SizedBox(
            width: 5,
          ),
          SizedBox(
              width: 80,
              height: 55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sharedPreferences.getString("name")!.length > 8
                        ? sharedPreferences.getString("name")!.substring(0, 8) +
                            ".."
                        : sharedPreferences.getString("name")!,
                    style: TextStyle(
                      color: Color(0xFF18181B),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      // height: 0.09,
                    ),
                  ),
                  Text(
                    sharedPreferences.getString("phone")!.length > 8
                        ? sharedPreferences
                                .getString("phone")!
                                .substring(0, 8) +
                            ".."
                        : sharedPreferences.getString("phone")!,
                    style: TextStyle(
                      color: Color(0xFF828487),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      // height: 0.10,
                    ),
                  ),
                ],
              )),
          Expanded(
            child: ListView.builder(
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
          ),
          CustomButton(
            width: 100,
            height: 40,
            backgroundColor: Colors.white,
            fontSize: 14,
            text: "add client",
            colorText: ColorManager.kPrimary,
            press: () {
              changePasswordhowBottomSheet(context);
            },
          ),
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
