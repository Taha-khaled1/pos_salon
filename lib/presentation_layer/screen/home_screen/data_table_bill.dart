import 'package:pos_animal/presentation_layer/src/account_url.dart';

class CustomDataTableBill extends StatelessWidget {
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
              "Bills List",
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
              for (int i = 0; i < 5; i++)
                DataRow(
                  cells: [
                    DataCell(Text('${i + 1}')),
                    DataCell(Text('17 May 2022')),
                    DataCell(Text('routain')),
                    DataCell(Text('Masud')),
                    DataCell(Text('2')),
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
