import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../src/account_url.dart';
import '../../reports/widgets/card_static.dart';

class ReportWidget extends StatelessWidget {
  const ReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Reports",
              style: MangeStyles().getBoldStyle(
                color: ColorManager.black,
                fontSize: FontSize.s20,
              ),
            ),
          ),
        ),
        Wrap(
          children: [for (int i = 0; i < statics.length; i++) statics[i]],
        ),
        SizedBox(
          height: 20.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Top Members",
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




