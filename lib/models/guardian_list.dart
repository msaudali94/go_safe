
class GuardianListModel {
  String? name;
  String? number;
  GuardianListModel({this.name, this.number}) ;

  Map<String, dynamic> toJson() => {
    'name': name,
    'number': number,
  };

  fromJson(dynamic parsedJson) {
    name = parsedJson['name'] ?? '';
    number = parsedJson['number'] ?? '';
  }
}
