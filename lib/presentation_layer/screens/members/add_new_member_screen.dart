import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_animal/presentation_layer/components/custom_text_field.dart';

import '../../resources/color_manager.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name", style: TextStyle(
                        fontSize: 16.sp,
                        color: Color(0xff2E2E2E)
                    ),),
                    CustomTextfield(
                      validator: (text) {
                        return null;
                      },
                      onSaved: (text) {
                        return null;
                      },
                      titel: "",
                      width: 0.22.sw,
                      height: 45.h,
                      borderRadius: 5,
                      fontSize: 16.sp,
                      verticalPadding: 2.h,
                      horizontalPadding: 10.w,)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Phone Number", style: TextStyle(
                        fontSize: 16.sp,
                        color: Color(0xff2E2E2E)
                    ),),
                    CustomTextfield(
                      validator: (text) {
                        return null;
                      },
                      onSaved: (text) {
                        return null;
                      },
                      titel: "",
                      width: 0.22.sw,
                      height: 45.h,
                      borderRadius: 5,
                      fontSize: 16.sp,
                      verticalPadding: 2.h,
                      horizontalPadding: 10.w,)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email", style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xff2E2E2E)
                    ),),
                    CustomTextfield(
                      validator: (text) {
                        return null;
                      },
                      onSaved: (text) {
                        return null;
                      },
                      titel: "",
                      width: 0.40.sw,
                      height: 45.h,
                      borderRadius: 5,
                      fontSize: 16.sp,
                      verticalPadding: 2.h,
                      horizontalPadding: 10.w,)
                  ],
                )
              ],
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Country", style: TextStyle(
                        fontSize: 16.sp,
                        color: Color(0xff2E2E2E)
                    ),),
                    Container(
                      height: 45.h,
                      width: 0.22.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _selectedCountryItem,
                            hint: Text('choose Country', style: TextStyle(
                                color: Colors.grey, fontSize: 16.sp
                            ),),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedCountryItem = newValue.toString();
                              });
                            },
                            items: _dropdownCountriesItems.map<
                                DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: TextStyle(
                                    color: Colors.grey, fontSize: 16.sp),),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("city", style: TextStyle(
                        fontSize: 16.sp,
                        color: Color(0xff2E2E2E)
                    ),),
                    Container(
                      height: 45.h,
                      width: 0.22.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _selectedCountryItem,
                            hint: Text('choose Country', style: TextStyle(
                                color: Colors.grey, fontSize: 16.sp
                            ),),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedCountryItem = newValue.toString();
                              });
                            },
                            items: _dropdownCountriesItems.map<
                                DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: TextStyle(
                                    color: Colors.grey, fontSize: 16.sp),),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Address", style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xff2E2E2E)
                    ),),
                    CustomTextfield(
                      validator: (text) {
                        return null;
                      },
                      onSaved: (text) {
                        return null;
                      },
                      titel: "",
                      width: 0.40.sw,
                      height: 45.h,
                      borderRadius: 5,
                      fontSize: 16.sp,
                      verticalPadding: 2.h,
                      horizontalPadding: 10.w,)
                  ],
                )
              ],
            ),
            SizedBox(height: 10.h,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("note", style: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xff2E2E2E)
                ),),
                CustomTextfield(
                  validator: (text) {
                    return null;
                  },
                  onSaved: (text) {
                    return null;
                  },
                  titel: "",
                  height: 140.h,
                  borderRadius: 5,
                  fontSize: 16.sp,
                  verticalPadding: 2.h,
                  horizontalPadding: 10.w,
                  width: 0.9.sw,
                  maxLines: 4,)
              ],
            )


          ],
        ),
      ),
    );
  }
}
