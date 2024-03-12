import 'package:flutter/material.dart';
import 'package:pos_animal/application_layer/utils/valid.dart';
import 'package:pos_animal/presentation_layer/components/custom_butten.dart';
import 'package:pos_animal/presentation_layer/components/custom_text_field.dart';
import 'package:pos_animal/presentation_layer/resources/color_manager.dart';
import 'package:pos_animal/presentation_layer/resources/font_manager.dart';
import 'package:pos_animal/presentation_layer/resources/styles_manager.dart';
import 'package:pos_animal/presentation_layer/utils/responsive_design/ui_components/info_widget.dart';

class StoreOrderScreen extends StatefulWidget {
  const StoreOrderScreen({Key? key}) : super(key: key);

  @override
  State<StoreOrderScreen> createState() => _StoreOrderScreenState();
}

class _StoreOrderScreenState extends State<StoreOrderScreen> {
  String? dateController;

  DateTime? dataTime;

  Future<void> selectDate(BuildContext context) async {
    print('object');
    dataTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (dataTime != null && dataTime != DateTime.now()) {
      // Update the selected date in the text field

      dateController = "${dataTime!.day}/${dataTime!.month}/${dataTime!.year}";
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StoreOrderScreen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextfield(
              validator: (value) {
                return null;
              },
              onSaved: (value) {
                return null;
              },
              onChanged: (value) {
                // phone = value.toString();
              },
              titel: "Enter phone",
              width: 500,
            ),
            CustomTextfield(
              readOnly: true,
              validator: (value) {
                return null;
              },
              onSaved: (value) {
                return null;
              },
              onTap: () => selectDate(context),
              titel: dateController ?? 'Date',
              width: 500,
              icon: Icons.calendar_month,
            ),
            SizedBox(
              height: 400,
            ),
          ],
        ),
      ),
    );
  }
}

String formatTimeOfDay(TimeOfDay timeOfDay) {
  String period = timeOfDay.hour >= 12 ? 'PM' : 'AM';
  int hour = timeOfDay.hourOfPeriod;
  int minute = timeOfDay.minute;
  return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
}
