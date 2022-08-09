import 'dart:math';

import 'package:doctor_consultation/models/action_model.dart';
import 'package:doctor_consultation/models/relation_model.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AppConstants {
  static const doctorName = "Dr. Priyanka Yaduwanshi";
  static const aboutDoctor = "Dr Priyanka Yaduvanshi is one among the few Doctors globally practising Classical Homoeopathy in its true essence. A compassionate physician, presently in India and travels extensively across the country serving different segments of the society through free Homeopathic Camps and Clinic. She believes in the power of Classical Homoeopathy and combines it with her knowledge of Vedic Scriptures and Ayurveda to restore and solve complex Chronic illnesses. In addition to being a qualified doctor, she is an Astrologer and Palmist. People seek her advise for marriage, a new venture, business, Vastu and family matters. A doctor with sincere empathy who wants to propagate Homoeopathy in its purest form. Very dear to everyone because of her Caring and Loving aura.";


  static const msgNoChatAvailable =
      "Chat is not available for this patient. Book appointment to connect with doctor. Chat will be available until appointment subscription expired.";

  // static const RAZORPAY_KEY_ID = "rzp_test_WK75xX84FGDTsB";
   static const RAZORPAY_KEY_ID = "rzp_live_eSD5cAGj3dGPo4";
  // static const RAZORPAY_KEY_ID = "rzp_live_8aAdWb0YdmkzxG";

  static String getRandomString(int length) {
    var _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    var _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  static String getThumbnailUrl(String url) {
    String videoId = YoutubePlayer.convertUrlToId(url)!;

    return "https://img.youtube.com/vi/$videoId/0.jpg";
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

    data.add(ActionModel("Manage Schedule", AppImages.icSchedule, AppNavActions.viewSchedule));
    data.add(ActionModel("Manage Patients", AppImages.icPatientCount, AppNavActions.managePatients));
    data.add(ActionModel("View Users", AppImages.icPatientCount, AppNavActions.manageUsers));
    data.add(ActionModel("Manage Videos", AppImages.icUnMuteVideoCall, AppNavActions.manageVideos));
    data.add(ActionModel("Transactions", AppImages.icTransactions, AppNavActions.transactions));

    return data;
  }

  static const pending = 0;
  static const approved = 1;
  static const cancelled = 2;
  static const ongoing = 3;
  static const closed = 4;
}

enum IOperations { create, read, update, delete }
enum AppNavActions { viewSchedule, uploadVideo, manageVideos,manageUsers,managePatients,appointments,transactions }

class SocialLink {
  static const instagram = "https://www.google.com/";
  static const facebook = "https://www.google.com/";
  static const youtube = "https://www.google.com/";
  static const twitter = "https://www.google.com/";
}
