class BatchModel {
  int id;
  String name;

  BatchModel(this.id, this.name);
  @override
  String toString() {
    return name.toString();
  }
}
