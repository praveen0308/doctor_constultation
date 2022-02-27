class RelationModel {
  int relationId;
  String name;

  RelationModel(this.relationId, this.name);

  @override
  String toString() {
    return name.toString();
  }
}
