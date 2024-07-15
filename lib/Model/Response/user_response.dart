

import 'package:emergency_alert/Model/Response/epa_user_response.dart';

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
