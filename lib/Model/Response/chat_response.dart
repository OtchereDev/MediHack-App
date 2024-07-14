

class ChatResponse {
    Response? response;

    ChatResponse({
         this.response,
    });

    factory ChatResponse.fromJson(Map<String, dynamic> json) => ChatResponse(
        response: Response.fromJson(json["response"]),
    );

    Map<String, dynamic> toJson() => {
        "response": response!.toJson(),
    };
}

class Response {
    Thread? thread;
    List<Message>? messages;

    Response({
         this.thread,
         this.messages,
    });

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        thread: Thread.fromJson(json["thread"]),
        messages: List<Message>.from(json["messages"].map((x) => Message.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "thread": thread?.toJson(),
        "messages": List<dynamic>.from(messages!.map((x) => x.toJson())),
    };
}

class Message {
    String? id;
    String? object;
    int? createdAt;
    String? assistantId;
    String? threadId;
    String? runId;
    String? role;
    List<Content>? content;
    List<dynamic>? attachments;
    Metadata? metadata;

    Message({
         this.id,
         this.object,
         this.createdAt,
         this.assistantId,
         this.threadId,
         this.runId,
         this.role,
         this.content,
         this.attachments,
         this.metadata,
    });

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        object: json["object"],
        createdAt: json["created_at"],
        assistantId: json["assistant_id"],
        threadId: json["thread_id"],
        runId: json["run_id"],
        role: json["role"],
        content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        metadata: Metadata.fromJson(json["metadata"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "created_at": createdAt,
        "assistant_id": assistantId,
        "thread_id": threadId,
        "run_id": runId,
        "role": role,
        "content": List<dynamic>.from(content!.map((x) => x.toJson())),
        "attachments": List<dynamic>.from(attachments!.map((x) => x)),
        "metadata": metadata?.toJson(),
    };
}

class Content {
    String? type;
    Text? text;

    Content({
         this.type,
         this.text,
    });

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        type: json["type"],
        text: Text.fromJson(json["text"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "text": text?.toJson(),
    };
}

class Text {
    String value;
    List<dynamic> annotations;

    Text({
        required this.value,
        required this.annotations,
    });

    factory Text.fromJson(Map<String, dynamic> json) => Text(
        value: json["value"],
        annotations: List<dynamic>.from(json["annotations"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "annotations": List<dynamic>.from(annotations.map((x) => x)),
    };
}

class Metadata {
    Metadata();

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Thread {
    String id;
    String object;
    int createdAt;
    Metadata metadata;
    Metadata toolResources;

    Thread({
        required this.id,
        required this.object,
        required this.createdAt,
        required this.metadata,
        required this.toolResources,
    });

    factory Thread.fromJson(Map<String, dynamic> json) => Thread(
        id: json["id"],
        object: json["object"],
        createdAt: json["created_at"],
        metadata: Metadata.fromJson(json["metadata"]),
        toolResources: Metadata.fromJson(json["tool_resources"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "created_at": createdAt,
        "metadata": metadata.toJson(),
        "tool_resources": toolResources.toJson(),
    };
}
