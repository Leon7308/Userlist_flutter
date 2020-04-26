class user {
  int id;
  String name;
  String phone;

  User(int id, String name, String email) {
    this.id = id;
    this.name = name;
    this.phone = email;
  }

  user.fromJson(Map json):
        id = json['id'],
        name = json['name'],
        phone = json['phone'];

  Map toJson() {
    return {'id': id, 'name': name, 'phone': phone};
  }
}