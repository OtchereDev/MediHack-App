

class UserResponse {
    String accessToken;
    User user;

    UserResponse({
        required this.accessToken,
        required this.user,
    });

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        accessToken: json["access_token"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "user": user.toJson(),
    };
}

class User {
    int id;
    String email;
    String name;
    DateTime createdAt;
    DateTime updatedAt;

    User({
        required this.id,
        required this.email,
        required this.name,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
