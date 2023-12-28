import 'package:pos_animal/presentation_layer/src/style_packge.dart';

class HelperTime {
  Future<DateTime> convertTDataTime(
      String timeString, String dateString) async {
// Split the date string and parse the values
    List<String> dateParts = dateString.split('/');
    int year = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int day = int.parse(dateParts[2]);

// Split the time string and parse the values
    List<String> timeParts = timeString.split(':');
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1].split(' ')[0]);
    String period = timeParts[1].split(' ')[1];

// Adjust the hour based on the period
    if (period == 'PM' && hour != 12) {
      hour += 12;
    } else if (period == 'AM' && hour == 12) {
      hour = 0;
    }

// Create a DateTime object
    // DateTime now = DateTime.now();
    DateTime combinedDateTime = DateTime(year, month, day, hour, minute);
    // print(combinedDateTime);
    // print('a----------> $now');
    // print('b----------> $combinedDateTime');
    // print('c----------> ${combinedDateTime.difference(now)}');
    return combinedDateTime; // This is your desired DateTime object
  }

  String convertTo12HourFormat(int hour, int minute) {
    String suffix;
    if (hour >= 0 && hour <= 11) {
      if (hour == 0) {
        hour = 12;
      }
      suffix = "AM";
    } else if (hour == 12) {
      suffix = "PM";
    } else {
      hour -= 12;
      suffix = "PM";
    }
    return "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $suffix";
  }

  String formatTimeOfDay(TimeOfDay timeOfDay) {
    String period = timeOfDay.hour >= 12 ? 'PM' : 'AM';
    int hour = timeOfDay.hourOfPeriod;
    int minute = timeOfDay.minute;
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
  }

  String formatTime(int timestampInMillis, String language) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestampInMillis);
    int hour = dateTime.hour;
    int minute = dateTime.minute;
    String formattedMinute = minute.toString().padLeft(2, '0');

    // English formatting
    if (language == 'en') {
      if (hour >= 12) {
        return '${hour > 12 ? hour - 12 : hour}:$formattedMinute ${hour >= 12 ? 'pm' : 'am'}';
      } else {
        return '$hour:$formattedMinute ${hour >= 12 ? 'pm' : 'am'}';
      }
    }
    // Arabic formatting
    else if (language == 'ar') {
      if (hour >= 12) {
        return '${hour > 12 ? hour - 12 : hour}:$formattedMinute ${hour >= 12 ? 'م' : 'ص'}';
      } else {
        return '$hour:$formattedMinute ${hour >= 12 ? 'م' : 'ص'}';
      }
    }
    // Invalid language
    else {
      return 'Invalid language specified';
    }
  }
}
