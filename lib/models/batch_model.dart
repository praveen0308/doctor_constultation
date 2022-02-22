import 'package:doctor_consultation/models/api/slot_model.dart';

class BatchModel {
  int id;
  String name;

  List<SlotModel> slots = [];

  BatchModel(this.id, this.name);
  @override
  String toString() {
    return name.toString();
  }
}
