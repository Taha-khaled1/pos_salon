import 'package:http/http.dart' as http;
import 'package:pos_animal/application_layer/utils/valid.dart';
import 'package:pos_animal/data_layer/database/database.dart';
import 'package:pos_animal/presentation_layer/components/custom_text_field.dart';
import 'package:pos_animal/presentation_layer/screen/login/login.dart';
import 'package:pos_animal/presentation_layer/src/account_url.dart';
import 'package:quickalert/models/quickalert_type.dart';

changePasswordhowBottomSheet(BuildContext context) {
  String? a, x, y, z;
  showModalBottomSheet(
    backgroundColor: ColorManager.white,
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(25),
      topRight: Radius.circular(25),
    )),
    builder: (BuildContext context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: InfoWidget(
          builder: (context, deviceInfo) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'add customer',
                      style: MangeStyles().getBoldStyle(
                        color: ColorManager.kPrimary,
                        fontSize: FontSize.s18,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomTextfield(
                    validator: (value) {
                      return validInput(value.toString(), 8, 100, "password");
                    },
                    onSaved: (value) {
                      return null;
                    },
                    titel: "name",
                    width: deviceInfo.localWidth * 0.85,
                    onChanged: (value) {
                      a = value;
                    },
                  ),
                  SizedBox(height: 10),
                  CustomTextfield(
                    validator: (value) {
                      return validInput(value.toString(), 8, 100, "password");
                    },
                    onSaved: (value) {
                      return null;
                    },
                    titel: "phone",
                    width: deviceInfo.localWidth * 0.85,
                    onChanged: (value) {
                      x = value;
                    },
                  ),
                  SizedBox(height: 10),
                  CustomTextfield(
                    validator: (value) {
                      return validInput(value.toString(), 8, 100, "password");
                    },
                    onSaved: (value) {
                      return null;
                    },
                    titel: "email",
                    width: deviceInfo.localWidth * 0.85,
                    onChanged: (value) {
                      y = value;
                    },
                  ),
                  SizedBox(height: 10),
                  CustomTextfield(
                    validator: (value) {
                      return validInput(value.toString(), 8, 100, "password");
                    },
                    onSaved: (value) {
                      return null;
                    },
                    titel: "address",
                    width: deviceInfo.localWidth * 0.85,
                    onChanged: (value) {
                      z = value;
                    },
                  ),
                  SizedBox(height: 10),
                  CustomButton(
                      backgroundColor: ColorManager.kPrimary,
                      width: deviceInfo.localWidth * 0.42,
                      rectangel: 25,
                      height: 55,
                      text: "confairmtion",
                      press: () async {
                        try {
                          print('fffffffffffffffffffffffffffffffffffffffffff');
                          // Make a post request with the email and password
                          final response = await http.post(
                            Uri.parse(
                              'https://salon-app.nanots.ae/api/v1/user/customer',
                            ),
                            headers: Curd().myheaders3,
                            body: {
                              "name": a,
                              "phone": x,
                              "email": y,
                              "emirate_id": "1",
                              "address": z
                            },
                          );
                          if (response.statusCode == 401) {
                            sharedPreferences.remove("id");
                            Get.offAll(() => LoginScreen());
                            return;
                          }
                          if (response.statusCode == 200) {
                            showDilog(
                              context,
                              "The user has been added successfully",
                              type: QuickAlertType.success,
                              onConfirmBtnTap: () {
                                Get.back();
                              },
                            );
                          } else {
                            print('zzzzzzzzzzzzz${response.body}zzzzzzzzzzzzz');
                            showDilog(
                              context,
                              'Complete data must be entered',
                              type: QuickAlertType.info,
                              onConfirmBtnTap: () {
                                Get.back();
                              },
                            );
                          }
                        } catch (e) {
                          print("error : $e");
                          showDilog(
                            context,
                            'Complete data must be entered',
                            type: QuickAlertType.info,
                            onConfirmBtnTap: () {
                              Get.back();
                            },
                          );
                        }
                      }),
                  SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
