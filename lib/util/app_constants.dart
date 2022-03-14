import 'dart:math';

import 'package:doctor_consultation/models/action_model.dart';
import 'package:doctor_consultation/models/relation_model.dart';
import 'package:doctor_consultation/res/image_path.dart';

class AppConstants {
  static const RAZORPAY_KEY_ID = "rzp_test_AbgCshi1ASlOF0";

  static String getRandomString(int length) {
    var _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    var _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  static List<RelationModel> getRelations() {
    List<RelationModel> data = [];
    final List<String> relations = [
      "Grand Parent",
      "Father",
      "Mother",
      "Brother",
      "Sister",
      "Family Member",
      "Neighbour",
      "Other",
    ];

    relations
        .asMap()
        .forEach((index, value) => data.add(RelationModel(index + 1, value)));

    return data;
  }

  static List<ActionModel> getQuickActions() {
    List<ActionModel> data = [];
    data.add(ActionModel(
        "View Schedule", AppImages.icSchedule, AppNavActions.viewSchedule));
    data.add(ActionModel(
        "Upload Video", AppImages.icVoiceCall, AppNavActions.uploadVideo));

    return data;
  }

  static const pending = 0;
  static const approved = 1;
  static const cancelled = 2;
  static const ongoing = 3;
  static const closed = 4;
}

enum AppNavActions { viewSchedule, uploadVideo }
