class PasswordModel {
  final int? id;
  final String account;
  final String username;
  final String password;
  final String category;

  PasswordModel({
    this.id,
    required this.account,
    required this.username,
    required this.password,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'account': account,
      'username': username,
      'password': password,
      'category': category,
    };
  }

  factory PasswordModel.fromMap(Map<String, dynamic> map) {
    return PasswordModel(
      id: map['id'],
      account: map['account'],
      username: map['username'],
      password: map['password'],
      category: map['category'],
    );
  }
}
