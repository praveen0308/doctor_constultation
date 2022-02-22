class DayModel {
  int id;
  String name;
  bool isActive;

  DayModel(this.id, this.name, {this.isActive = false});
  @override
  String toString() {
    return name.toString();
  }
}
