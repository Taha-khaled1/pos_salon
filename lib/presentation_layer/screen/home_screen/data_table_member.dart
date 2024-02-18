import 'package:pos_animal/data_layer/database/database.dart';
import 'package:pos_animal/presentation_layer/src/account_url.dart';

class CustomDataTableMember extends StatefulWidget {
  @override
  State<CustomDataTableMember> createState() => _CustomDataTableMemberState();
}

class _CustomDataTableMemberState extends State<CustomDataTableMember> {
  Future getOrderData() async {
    Curd curd = Curd();
    var response = await curd.getrequest(
      "https://salon-app.nanots.ae/api/v1/user/customer",
    );
    // print("========== $response ============");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      for (int i = 0; i < data['data'].length; i++)
                        DataRow(
                          cells: [
                            DataCell(Text('${data['data'][i]['id']}')),
                            DataCell(Text('${data['data'][i]['name']}')),
                            DataCell(Text('${data['data'][i]['email']}')),
                            DataCell(Text('${data['data'][i]['phone']}')),
                            DataCell(Text(
                                '${data['data'][i]['location']['address']}')),
                            DataCell(
                                Text('${data['data'][i]['emirate']['title']}')),
                            // DataCell(Text('Paid')),
                            // DataCell(Text('\$265')),
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
