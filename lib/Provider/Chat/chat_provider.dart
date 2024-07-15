import 'package:emergency_alert/Model/Response/chat_request.dart';
import 'package:emergency_alert/Model/Response/chat_responsee.dart';
import 'package:emergency_alert/Services/Remote/Profile/profile_service.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final profile = ProfileService();
  String _reply = '';

  bool _loadPage = false;
  bool get isLoading => _loadPage;

  bool _loadReplyMessage = false;
  bool get loadReplyMessage => _loadReplyMessage;

  ChatResponse _chatResponse = ChatResponse();
  ChatResponse get chatResponse => _chatResponse;

  String _threadID = "";
  String get threadID => _threadID;

  List<ChatMessage> _messages = [ChatMessage(content: "You are nurse, that provide assistance only for first aid issues.", role: "system")];

  List<ChatMessage> get messages => _messages;

  void addMessage(ChatMessage message) {
    _messages.add(message);
    notifyListeners();
  }

  setLoadingPage(bool value) {
    _loadPage = value;
    notifyListeners();
  }

  setLoadingReplyMessage(bool value) {
    _loadReplyMessage = value;
    notifyListeners();
  }

  String get reply => _reply;

  Future<void> getReply(context, String message) async {
    addMessage(ChatMessage(content: message, role: "user"));
    setLoadingReplyMessage(true);
    await profile.replyChat(context, ChatRequest(
      chats: _messages
    ).toJson()).then((value) {
      setLoadingReplyMessage(false);
      // print("=============${value['data']['chats'][0]['message']['content']}");

      if (value['status'] == true) {
        // var mes = value['data']["response"][0];
        addMessage(ChatMessage(content:value['data']['chats'][0]['message']['content'],role: "assistant" ));
        _chatResponse = ChatResponse.fromJson(value['data']);
        notifyListeners();
      } else {
        print(value);
      }
    });
  }

  clearChat(){
    _messages.removeRange(1, _messages.length);
    notifyListeners();
  }

  // Future<bool> initChat(context) async {
  //   _messages.clear();
  //   setLoadingPage(true);
  //   bool isSuccess = false;
  //   await profile.initChat(context).then((value) {
  //     if (value['status'] == true) {
  //       setLoadingPage(false);
  //       isSuccess = true;
  //       // _chatResponse = ChatResponse.fromJson(value['data']);
  //       var mes = value['data']["response"]['messages'][0];
  //       addMessage(ChatMessage(
  //           text: mes['content'][0]['text']['value'],
  //           isUser: mes['user'] == true));
  //       _threadID = value['data']['response']['thread']['id'];
  //       notifyListeners();
  //     }
  //   });
  //   return isSuccess;
  // }
}

// To parse this JSON data, do
//
//     final chatMessage = chatMessageFromJson(jsonString);
