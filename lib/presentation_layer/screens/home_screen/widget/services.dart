import 'package:pos_animal/application_layer/utils/valid.dart';
import 'package:pos_animal/data_layer/database/sqlflite.dart';
import 'package:pos_animal/presentation_layer/components/custom_text_field.dart';
import 'package:pos_animal/presentation_layer/screens/home_screen/controller/home_controller.dart';
import 'package:pos_animal/presentation_layer/screens/login/login.dart';
import 'package:pos_animal/presentation_layer/screens/store_order/store_order.dart';
import 'package:pos_animal/presentation_layer/src/account_url.dart';
import 'package:quickalert/models/quickalert_type.dart';

class ServiceWidget extends StatefulWidget {
  const ServiceWidget({super.key});

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  String? a, x, y;
  String? timeController;
  Future<void> selectTime(BuildContext context) async {
    TimeOfDay? timeOfDay;
    timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (timeOfDay != null) {
      // Update the selected time in the text field
      // print(timeOfDay!.periodOffset);
      // print(timeOfDay!.hourOfPeriod);
      // print(timeOfDay!.period.name);
      String formattedTime = formatTimeOfDay(timeOfDay!);
      x = formattedTime;
    }
    setState(() {});
  }

  Future<void> selectTime2(BuildContext context) async {
    TimeOfDay? timeOfDay;
    timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (timeOfDay != null) {
      // Update the selected time in the text field
      // print(timeOfDay!.periodOffset);
      // print(timeOfDay!.hourOfPeriod);
      // print(timeOfDay!.period.name);
      String formattedTime = formatTimeOfDay(timeOfDay);
      y = formattedTime;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return _.load
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Services",
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 670,
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
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
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: InfoWidget(
                                      builder: (context, deviceInfo) {
                                        return SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              SizedBox(height: 10),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'add cart',
                                                  style: MangeStyles()
                                                      .getBoldStyle(
                                                    color:
                                                        ColorManager.kPrimary,
                                                    fontSize: FontSize.s18,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              CustomTextfield(
                                                validator: (value) {
                                                  return validInput(
                                                      value.toString(),
                                                      8,
                                                      100,
                                                      "password");
                                                },
                                                onSaved: (value) {
                                                  return null;
                                                },
                                                titel: "employee name",
                                                width: deviceInfo.localWidth *
                                                    0.85,
                                                onChanged: (value) {
                                                  a = value;
                                                  setState(() {});
                                                },
                                              ),
                                              SizedBox(height: 10),
                                              CustomTextfield(
                                                readOnly: true,
                                                onChanged: (value) {
                                                  x = value;
                                                  setState(() {});
                                                },
                                                // textController: controller.timeController,
                                                validator: (value) {
                                                  return null;
                                                },
                                                onSaved: (value) {
                                                  return null;
                                                },
                                                onTap: () async {
                                                  await selectTime(context);
                                                  setState(() {});
                                                },
                                                titel: x ?? 'Start Time',
                                                width: deviceInfo.localWidth *
                                                    0.43,
                                                icon: Icons.access_time_sharp,
                                                // height: 60,
                                              ),
                                              SizedBox(height: 10),
                                              CustomTextfield(
                                                readOnly: true,
                                                onChanged: (value) {
                                                  y = value;
                                                  print("yyyyyyy");
                                                  setState(() {});
                                                },
                                                // textController: controller.timeController,
                                                validator: (value) {
                                                  return null;
                                                },
                                                onSaved: (value) {
                                                  return null;
                                                },
                                                onTap: () async {
                                                  await selectTime2(context);
                                                  setState(() {});
                                                },
                                                titel: y ?? 'end Time',
                                                width: deviceInfo.localWidth *
                                                    0.43,
                                                icon: Icons.access_time_sharp,
                                                // height: 60,
                                              ),
                                              SizedBox(height: 10),
                                              CustomButton(
                                                backgroundColor:
                                                    ColorManager.kPrimary,
                                                width: deviceInfo.localWidth *
                                                    0.42,
                                                rectangel: 25,
                                                height: 55,
                                                text: "confairmtion",
                                                press: () async {
                                                  try {
                                                    if (x != null &&
                                                        y != null &&
                                                        a != null) {
                                                      int respons =
                                                          await SqlDb().insert(
                                                        'services',
                                                        {
                                                          "service_id": _
                                                              .response['data']
                                                                  [index]['id']
                                                              .toString(),
                                                          // "notes": "Some notes",
                                                          "employee_name": a,
                                                          "time_from": x,
                                                          "time_to": y
                                                        },
                                                      );
                                                      print(respons);
                                                      if (respons > 1) {
                                                      } else {}
                                                      showDilog(
                                                          context, "succss");
                                                    }
                                                  } catch (e) {
                                                    showDilog(
                                                      context,
                                                      "erorr",
                                                      type:
                                                          QuickAlertType.error,
                                                    );
                                                  }
                                                },
                                              ),
                                              SizedBox(height: 10),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                });
                              },
                            );
                          },
                          child: Container(
                            width: 219,
                            height: 250,
                            padding: const EdgeInsets.only(
                              top: 12,
                              left: 8,
                              right: 8,
                              bottom: 16,
                            ),
                            decoration: ShapeDecoration(
                              color: Color(0xFFF5F5F5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 203,
                                  height: 158,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 203,
                                        height: 158,
                                        decoration: ShapeDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              _.response['data'][index]
                                                  ['image'],
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Container(
                                  width: double.infinity,
                                  height: 52,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          _.response['data'][index]['title'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF18181B),
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            // height: 0.09,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          '\$ ${_.response['data'][index]['price']}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF0E5D6A),
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            // height: 0.09,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
      },
    );
  }
}
