// To parse this JSON data, do
//
//     final chatResponse = chatResponseFromJson(jsonString);

import 'dart:convert';

ChatResponse chatResponseFromJson(String str) => ChatResponse.fromJson(json.decode(str));

String chatResponseToJson(ChatResponse data) => json.encode(data.toJson());

class ChatResponse {
    List<Chat>? chats;

    ChatResponse({
         this.chats,
    });

    factory ChatResponse.fromJson(Map<String, dynamic> json) => ChatResponse(
        chats: List<Chat>.from(json["chats"].map((x) => Chat.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "chats": List<dynamic>.from(chats!.map((x) => x.toJson())),
    };
}

class Chat {
    int index;
    Message message;
    dynamic logprobs;
    String finishReason;

    Chat({
        required this.index,
        required this.message,
        required this.logprobs,
        required this.finishReason,
    });

    factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        index: json["index"],
        message: Message.fromJson(json["message"]),
        logprobs: json["logprobs"],
        finishReason: json["finish_reason"],
    );

    Map<String, dynamic> toJson() => {
        "index": index,
        "message": message.toJson(),
        "logprobs": logprobs,
        "finish_reason": finishReason,
    };
}

class Message {
    String role;
    String content;

    Message({
        required this.role,
        required this.content,
    });

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        role: json["role"],
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "role": role,
        "content": content,
    };
}
