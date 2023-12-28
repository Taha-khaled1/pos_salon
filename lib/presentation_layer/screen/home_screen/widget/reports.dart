import '../../../src/account_url.dart';

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
          height: 20,
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

List<CardStatic> statics = [
  CardStatic(
    title: 'TODAY SELLING',
    money: '2189',
    precetge: '',
  ),
  CardStatic(
    title: 'Today Visitors',
    money: '512',
    precetge: '',
  ),
  CardStatic(
    title: 'Today Transactions',
    money: '325',
    precetge: '',
  ),
  CardStatic(
    title: 'Total Services',
    money: '268',
    precetge: '',
  ),
];

class CardStatic extends StatelessWidget {
  const CardStatic({
    super.key,
    required this.title,
    required this.money,
    required this.precetge,
  });
  final String title, money, precetge;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF6B6B6B),
              fontSize: 12.53,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w600,
              // height: 0.13,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '\$$money',
            style: TextStyle(
              color: Color(0xFF18120F),
              fontSize: 35.07,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w800,
              // height: 0.03,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 127.77,
            height: 20.54,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 8.47),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '+12%',
                          style: TextStyle(
                            color: Color(0xFF15CAB8),
                            fontSize: 11.69,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w600,
                            // height: 0.11,
                          ),
                        ),
                        const SizedBox(width: 4.24),
                        Text(
                          'vc yesterday',
                          style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 11.69,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                            // height: 0.12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
