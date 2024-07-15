
class EmergencyContactResponse {
    String? message;
    Response? response;

    EmergencyContactResponse({
         this.message,
         this.response,
    });

    factory EmergencyContactResponse.fromJson(Map<String, dynamic> json) => EmergencyContactResponse(
        message: json["message"],
        response: Response.fromJson(json["response"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "response": response?.toJson(),
    };
}

class Response {
    List<Contact>? contacts;

    Response({
         this.contacts,
    });

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        contacts: List<Contact>.from(json["contacts"].map((x) => Contact.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "contacts": List<dynamic>.from(contacts!.map((x) => x.toJson())),
    };
}

class Contact {
    int? id;
    String? name;
    String? phone;
    String? address;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? userId;

    Contact({
         this.id,
         this.name,
         this.phone,
         this.address,
         this.createdAt,
         this.updatedAt,
         this.userId,
    });

    factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "address": address,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "userId": userId,
    };
}
