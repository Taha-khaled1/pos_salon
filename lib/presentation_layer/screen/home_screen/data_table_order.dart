import 'package:pos_animal/presentation_layer/src/account_url.dart';

import '../../../data_layer/database/database.dart';

class CustomDataTableOrder extends StatefulWidget {
  @override
  State<CustomDataTableOrder> createState() => _CustomDataTableOrderState();
}

class _CustomDataTableOrderState extends State<CustomDataTableOrder> {
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
                    "Order List",
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.black,
                      fontSize: FontSize.s20,
                    ),
                  ),
                ),
              ),
              // x.length
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
                        'Order ID',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s14,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Date/Time',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s14,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Service',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s14,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Employee',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s14,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Status',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s14,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Payment',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s14,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Amount',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s14,
                        ),
                      ),
                    ),
                  ],
                  rows: [
                    for (int i = 0; i < 5; i++)
                      DataRow(
                        cells: [
                          DataCell(Text('${i + 1}')),
                          DataCell(Text('17 May 2022')),
                          DataCell(Text('routain')),
                          DataCell(Text('Masud')),
                          DataCell(Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.green.withOpacity(0.5),
                              ),
                              child: Text('Complete'))),
                          DataCell(Text('Paid')),
                          DataCell(Text('\$265')),
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

List x = [];
