import 'package:uuid/uuid.dart' show Uuid;

class User {
  String? id;
  String? name;
  String? email;
  String? role;
  User({this.id, this.name, this.role, this.email}) {
    id = id ??= Uuid().v1();
  }

  Map<String, dynamic> toJson() => {
        'id':id,
        'name': name,
        'role': role,
        'email': email,
      };

  fromJson(dynamic parsedJson) {
    id = parsedJson['id'] ?? '';
    name = parsedJson['name'] ?? '';
    email = parsedJson['email'] ?? '';
    role = parsedJson['role'] ?? '';
  }
}
