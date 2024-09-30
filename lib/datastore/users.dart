List<Map<String, String>> users = [
  {
    "username": "admin",
    "password": "admin",
  }
];

class User {
  String username;
  String password;

  User({
    required this.username,
    required this.password,
  });

  Map<String, String> toJson() {
    return {
      "username": username,
      "password": password,
    };
  }
}
