import 'package:doctor_consultation/models/batch_model.dart';
import 'package:doctor_consultation/models/day_model.dart';
import 'package:intl/intl.dart';

class DateTimeHelper {
  static String getGreeting() {
    DateTime now = DateTime.now();
    var timeNow = int.parse(DateFormat('kk').format(now));
    var message = '';
    if (timeNow <= 12) {
      message = 'Good Morning 🌞';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      message = 'Good Afternoon 🌤';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      message = 'Good Evening 🌜';
    } else {
      message = 'Good Night 🌛';
    }

    return message;
  }

  static String convertDate(String inputDate) {
    var inputFormat = DateFormat('dd-MM-yyyy');
    var date1 = inputFormat.parse(inputDate);

    var outputFormat = DateFormat('MMM dd,yyyy | EEEE');
    var date2 = outputFormat.format(date1);
    return date2.toString();
  }

  static String getCurrentDate() {
    var date1 = DateTime.now();

    var outputFormat = DateFormat('EEE,dd MMM');
    var date2 = outputFormat.format(date1);
    return date2.toString();
  }

  static String getCurrentTime() {
    var date1 = DateTime.now();

    var outputFormat = DateFormat('dd-MM-yyy hh:mm:ss a');
    var date2 = outputFormat.format(date1);
    return date2.toString();
  }

  static String formatTime(String time, String oFormat) {
    final now = DateTime.now();

    final dt = DateTime(now.year, now.month, now.day);
    final format = DateFormat(oFormat); //"6:00 AM"
    return format.format(dt);
  }

  static List<DayModel> getWeekdays() {
    List<DayModel> days = [];
    days.add(DayModel(1, "Monday", isActive: true));
    days.add(DayModel(2, "Tuesday"));
    days.add(DayModel(3, "Wednesday"));
    days.add(DayModel(4, "Thursday"));
    days.add(DayModel(5, "Friday"));
    days.add(DayModel(6, "Saturday"));
    days.add(DayModel(7, "Sunday"));
    return days;
  }

  static int getDayIdByName(DateTime dateTime) {
    var day = DateFormat("EEEE").format(dateTime).toString();
    var days = getWeekdays();
    int dayId = 0;
    for (var item in days) {
      if (item.name == day) {
        dayId = item.id;
      }
    }

    return dayId;
  }

  static List<BatchModel> getBatches() {
    List<BatchModel> batches = [];
    batches.add(BatchModel(1, "Morning"));
    batches.add(BatchModel(2, "Afternoon"));
    batches.add(BatchModel(3, "Evening"));
    return batches;
  }
}
