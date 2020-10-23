class Gategory {
  String id;
  String name;
  Gategory();
  Gategory.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson['id'];
    this.name = parsedJson['name'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
