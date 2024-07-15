

class ChatRequest {
    List<ChatMessage> chats;

    ChatRequest({
        required this.chats,
    });

    factory ChatRequest.fromJson(Map<String, dynamic> json) => ChatRequest(
        chats: List<ChatMessage>.from(json["chats"].map((x) => ChatMessage.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "chats": List<dynamic>.from(chats.map((x) => x.toJson())),
    };
}

class ChatMessage {
    String content;
    String role;

    ChatMessage({
        required this.content,
        required this.role,
    });

    factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        content: json["content"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "content": content,
        "role": role,
    };
}
