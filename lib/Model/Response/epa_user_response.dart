

class EpaUserResponse {
    String accessToken;
    User user;

    EpaUserResponse({
        required this.accessToken,
        required this.user,
    });

    factory EpaUserResponse.fromJson(Map<String, dynamic> json) => EpaUserResponse(
        accessToken: json["access_token"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "user": user.toJson(),
    };
}

class User {
    int? id;
    String? email;
    String? name;
    String? phone;
    String? type;
    String? status;
    DateTime createdAt;
    DateTime updatedAt;

    User({
        this.id,
        this.email,
        this.name,
        this.phone,
        this.type,
        this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
        type: json["type"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "phone": phone,
        "type": type,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
