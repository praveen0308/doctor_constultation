import 'package:doctor_consultation/models/relation_model.dart';

class AppConstants {
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

  static const pending = 0;
  static const approved = 1;
  static const cancelled = 2;
  static const ongoing = 3;
  static const closed = 4;

}
