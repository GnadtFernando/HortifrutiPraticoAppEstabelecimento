class UserModel {
  String name;
  String email;

  UserModel({
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['nome'],
        email: json['email'],
      );
}
