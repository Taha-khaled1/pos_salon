import 'package:pos_animal/data_layer/database/database.dart';
import 'package:pos_animal/presentation_layer/src/account_url.dart';

class CustomDataTableMember extends StatefulWidget {
  @override
  State<CustomDataTableMember> createState() => _CustomDataTableMemberState();
}

class _CustomDataTableMemberState extends State<CustomDataTableMember> {
  var response;
  bool load = true;
  dynamic getHome() async {
    Curd curd = Curd();
    var respons = await curd.getrequest(
      "https://salon-app.nanots.ae/api/v1/user/order",
    );

    return respons;
  }

  @override
  void initState() {
    print("=================== > ${DateTime.now()}");
    response = getHome();
    load = false;
    setState(() {});
    // statusRequest = handlingData(response);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return load
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Members List",
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.black,
                      fontSize: FontSize.s20,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                  dataTextStyle: TextStyle(fontSize: 14.0, color: Colors.black),
                  columnSpacing: 37,
                  columns: [
                    DataColumn(
                      label: Text(
                        'ID',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s12,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Name',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s12,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Email',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s14,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Phone Number',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s14,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Country',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s14,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'City',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s14,
                        ),
                      ),
                    ),
                    // DataColumn(
                    //   label: Text(
                    //     'Payment',
                    //     style: MangeStyles().getBoldStyle(
                    //       color: ColorManager.black,
                    //       fontSize: FontSize.s14,
                    //     ),
                    //   ),
                    // ),
                    // DataColumn(
                    //   label: Text(
                    //     'Amount',
                    //     style: MangeStyles().getBoldStyle(
                    //       color: ColorManager.black,
                    //       fontSize: FontSize.s14,
                    //     ),
                    //   ),
                    // ),
                  ],
                  rows: [
                    for (int i = 0; i < 5; i++)
                      DataRow(
                        cells: [
                          DataCell(Text('$i')),
                          DataCell(Text('Ahmed')),
                          DataCell(Text('ahmedmo@gmail.com')),
                          DataCell(Text('01251645983')),
                          DataCell(Text('Emirates')),
                          DataCell(Text('Abu Dhabi')),
                          // DataCell(Text('Paid')),
                          // DataCell(Text('\$265')),
                        ],
                      ),
                    // Add more DataRow widgets here for additional rows
                  ],
                ),
              ),
            ],
          );
  }
}
