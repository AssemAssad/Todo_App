class UserModel{
  String? name;
  String? email;
  String? phone;

  UserModel.fromMap(Map map) {
    name = map['name'];
    email = map['email'];
    phone = map['phone'];
  }
}