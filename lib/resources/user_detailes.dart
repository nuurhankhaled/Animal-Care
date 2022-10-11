class UserDetailsModel {
  final String name;
  final String phone;
  final String type;
  UserDetailsModel({required this.name, required this.type, required this.phone, });

  Map<String, dynamic> getJson() => {
    'name': name,
    'phone': phone,
    'type' : type,
  };

  factory UserDetailsModel.getModelFromJson(Map<String, dynamic> json) {
    return UserDetailsModel(name: json["name"], phone: json["phone"], type: json["type"]);
  }
}