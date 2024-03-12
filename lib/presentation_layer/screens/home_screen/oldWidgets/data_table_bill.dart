import 'package:pos_animal/presentation_layer/src/account_url.dart';

import '../../../../data_layer/database/database.dart';

class CustomDataTableBill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future getOrderData() async {
      Curd curd = Curd();
      var response = await curd.getrequest(
        "https://salon-app.nanots.ae/api/v1/user/bill",
      );
      // print("========== $response ============");
      return response;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Bills List",
              style: MangeStyles().getBoldStyle(
                color: ColorManager.black,
                fontSize: FontSize.s20,
              ),
            ),
          ),
        ),
        FutureBuilder(
          builder: (ctx, snapshot) {
            // Checking if future is resolved or not
            if (snapshot.connectionState == ConnectionState.done) {
              // If we got an error
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error} occurred',
                    style: TextStyle(fontSize: 18),
                  ),
                );

                // if we got our data
              } else if (snapshot.hasData) {
                // Extracting data from snapshot object
                final data = snapshot.data;
                print(data['data'].length);
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                    dataTextStyle:
                        TextStyle(fontSize: 14.0, color: Colors.black),
                    columnSpacing: 37,
                    columns: [
                      DataColumn(
                        label: Text(
                          'Bill ID',
                          style: MangeStyles().getBoldStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s12,
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
                          'Member',
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
                      for (int i = 0; i < data['data'].length; i++)
                        DataRow(
                          cells: [
                            DataCell(Text('${data['data'][i]['id']}')),
                            DataCell(
                                Text('${data['data'][i]['order']['date']}')),
                            DataCell(Text('routain')),
                            DataCell(Text(
                                '${data['data'][i]['order']['customer']['name']}')),
                            DataCell(Text(
                                '${data['data'][i]['order']['number_of_individuals']}')),
                            DataCell(Text(
                                '${data['data'][i]['bill_payment_status']}')),
                            DataCell(
                                Text('\$ ${data['data'][i]['total_cost']}')),
                          ],
                        ),
                      // Add more DataRow widgets here for additional rows
                    ],
                  ),
                );
              }
            }

            // Displaying LoadingSpinner to indicate waiting state
            return Center(
              child: CircularProgressIndicator(),
            );
          },

          // Future that needs to be resolved
          // inorder to display something on the Canvas
          future: getOrderData(),
        ),
      ],
    );
  }
}
