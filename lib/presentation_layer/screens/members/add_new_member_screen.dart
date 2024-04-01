import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_animal/application_layer/utils/valid.dart';
import 'package:pos_animal/data_layer/database/database.dart';
import 'package:pos_animal/presentation_layer/components/custom_text_field.dart';
import 'package:pos_animal/presentation_layer/resources/msnge_api.dart';

import 'package:http/http.dart' as http;
import 'package:pos_animal/presentation_layer/src/show_toast.dart';
import '../../src/account_url.dart';

List<dynamic> emirates = [];
int? selectedEmirateId = 1; // قم بتحديد القيمة الافتراضية إلى -1

class AddNewMemberScreen extends StatefulWidget {
  const AddNewMemberScreen({super.key});

  @override
  State<AddNewMemberScreen> createState() => _AddNewMemberScreenState();
}

class _AddNewMemberScreenState extends State<AddNewMemberScreen> {
  String _selectedCountryItem = 'choose country';
  List<String> _dropdownCountriesItems = [
    'choose country',
    'Egypt',
    'Syria',
    'UAE'
  ];
  var formKey = GlobalKey<FormState>();
  String? name, number, email, city, address, notes;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/icons/back_arrow_circle.png',
                    height: 25.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "Add New Member",
                    style: TextStyle(
                        color: ColorManager.kPrimary,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 16.sp, color: Color(0xff2E2E2E)),
                      ),
                      CustomTextfield(
                        validator: (text) {
                          // return validInput(text.toString(), 8, 100, "text");
                        },
                        onSaved: (text) {
                          return name = text.toString();
                        },
                        titel: "",
                        width: 0.22.sw,
                        height: 45.h,
                        borderRadius: 5,
                        fontSize: 16.sp,
                        verticalPadding: 2.h,
                        horizontalPadding: 10.w,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone Number",
                        style: TextStyle(
                            fontSize: 16.sp, color: Color(0xff2E2E2E)),
                      ),
                      CustomTextfield(
                        validator: (text) {
                          // return validInput(text.toString(), 8, 100, "text");
                        },
                        onSaved: (text) {
                          return number = text.toString();
                        },
                        titel: "",
                        width: 0.22.sw,
                        height: 45.h,
                        borderRadius: 5,
                        fontSize: 16.sp,
                        verticalPadding: 2.h,
                        horizontalPadding: 10.w,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 14.sp, color: Color(0xff2E2E2E)),
                      ),
                      CustomTextfield(
                        validator: (text) {
                          // return validInput(text.toString(), 8, 100, "email");
                        },
                        onSaved: (text) {
                          return email = text.toString();
                        },
                        titel: "",
                        width: 0.40.sw,
                        // height: 45.h,
                        borderRadius: 5,
                        fontSize: 16.sp,
                        verticalPadding: 2.h,
                        horizontalPadding: 10.w,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       "Country",
                  //       style:
                  //           TextStyle(fontSize: 16.sp, color: Color(0xff2E2E2E)),
                  //     ),
                  // Container(
                  //   height: 45.h,
                  //   width: 0.22.sw,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(5),
                  //     border: Border.all(
                  //       color: Colors.grey,
                  //       width: 0.5,
                  //     ),
                  //   ),
                  //       child: Padding(
                  //         padding: EdgeInsets.symmetric(horizontal: 10.w),
                  //         child: DropdownButtonHideUnderline(
                  //           child: DropdownButton<String>(
                  //             value: _selectedCountryItem,
                  //             hint: Text(
                  //               'choose Country',
                  //               style: TextStyle(
                  //                   color: Colors.grey, fontSize: 16.sp),
                  //             ),
                  //             onChanged: (newValue) {
                  //               setState(() {
                  //                 _selectedCountryItem = newValue.toString();
                  //               });
                  //             },
                  //             items: _dropdownCountriesItems
                  //                 .map<DropdownMenuItem<String>>((String value) {
                  //               return DropdownMenuItem<String>(
                  //                 value: value,
                  //                 child: Text(
                  //                   value,
                  //                   style: TextStyle(
                  //                       color: Colors.grey, fontSize: 16.sp),
                  //                 ),
                  //               );
                  //             }).toList(),
                  //           ),
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "city",
                        style: TextStyle(
                            fontSize: 16.sp, color: Color(0xff2E2E2E)),
                      ),
                      MyDropdown(),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Address",
                        style: TextStyle(
                            fontSize: 14.sp, color: Color(0xff2E2E2E)),
                      ),
                      CustomTextfield(
                        validator: (text) {
                          // return validInput(text.toString(), 1, 100, "add");
                        },
                        onSaved: (text) {
                          return address = text.toString();
                        },
                        titel: "",
                        width: 0.40.sw,
                        height: 45.h,
                        borderRadius: 5,
                        fontSize: 16.sp,
                        verticalPadding: 2.h,
                        horizontalPadding: 10.w,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "note",
                    style: TextStyle(fontSize: 14.sp, color: Color(0xff2E2E2E)),
                  ),
                  CustomTextfield(
                    validator: (text) {
                      return null;
                    },
                    onSaved: (text) {
                      return notes = text.toString();
                    },
                    titel: "",
                    height: 140.h,
                    borderRadius: 5,
                    fontSize: 16.sp,
                    verticalPadding: 2.h,
                    horizontalPadding: 10.w,
                    width: 0.9.sw,
                    maxLines: 4,
                  )
                ],
              ),
              Center(
                child: SizedBox(
                  height: 50.h,
                  width: 600.w,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.kPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45.0),
                          )),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          postData(
                            name,
                            number,
                            email,
                            selectedEmirateId,
                            notes,
                            address,
                          );
                        }
                      },
                      child: Text(
                        'submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> postData(name, phone, email, emID, notes, address) async {
  Curd curd = Curd();
  final String apiUrl = 'https://salon-app.nanots.ae/api/v1/user/customer';

  final Map<String, dynamic> postData = {
    "name": name,
    "phone": phone,
    "email": email,
    "emirate_id": emID,
    "notes": notes ?? "",
    "address": address
  };

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: curd.myheaders3,
    body: jsonEncode(postData),
  );

  if (response.statusCode == 200) {
    // Parse response body
    Map<String, dynamic> responseBody = jsonDecode(response.body);

    // Access message from response body
    String message = responseBody['message'];

    // Show toast
    showToast(message);
  } else {
    // Request failed, handle error here
    print('Failed to post data: ${response.statusCode}');
  }
}

class MyDropdown extends StatefulWidget {
  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  // SiginUpController _ = Get.put(SiginUpController());
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    Curd curd = Curd();
    String url = "${APiMange.emirates}";
    try {
      var response = await http.get(Uri.parse(url), headers: curd.myheaders3);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        setState(() {
          emirates = data['data'];
          selectedEmirateId = emirates[0]['id']; // تعيين قيمة افتراضية
        });
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -10),
      child: Container(
        height: 60.h,
        width: 0.22.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          // border: Border.all(
          //   color: Colors.grey,
          //   width: 0.5,
          // ),
        ),
        child: DropdownButtonFormField(
          // borderRadius: BorderRadius.circular(12),
          decoration: InputDecoration(
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide.none,
              //   borderRadius: BorderRadius.circular(12),
              // ),
              // // labelText: 'اختر الإمارة',
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(12),
              // ),
              // filled: true,
              // fillColor: Colors.white,
              // hintText: AppStrings.selectEmirate.tr,
              // hintStyle: MangeStyles().getLightStyle(
              //   color: Colors.black,
              //   fontSize: FontSize.s14,
              // ),
              ),
          value: selectedEmirateId,
          items: emirates.map((emirate) {
            return DropdownMenuItem(
              value: emirate['id'],
              child: Row(
                children: [
                  // Icon(
                  //   Icons.home_work_rounded,
                  //   color: Colors.grey,
                  // ),
                  SizedBox(
                    width: 0,
                  ),
                  Text(
                    emirate['title'],
                    style: MangeStyles().getLightStyle(
                      color: ColorManager.background,
                      fontSize: FontSize.s16.sp,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              selectedEmirateId = newValue as int;
            });
          },
        ),
      ),
    );
  }
}
