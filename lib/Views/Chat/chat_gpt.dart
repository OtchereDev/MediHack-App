import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Component/textformfield.dart';
import 'package:emergency_alert/Provider/Chat/chat_provider.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: AppBar(
        backgroundColor: AppColors.WHITE,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.PRIMARYCOLOR,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          "Investment Assistant AI",
          style: TextStyle(
              color: AppColors.PRIMARYCOLOR,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Consumer<ChatProvider>(builder: (context, chatProvider, _) {
        return chatProvider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: chatProvider.messages.length,
                      itemBuilder: (context, index) {
                        var chatData = chatProvider.messages[index];
                        return BubbleSpecialThree(
                          text: chatData.text,
                          color: chatData.isUser
                              ? AppColors.SECONDARYCOLOR
                              : AppColors.ASH,
                          tail: false,
                          isSender: chatData.isUser,
                          textStyle: TextStyle(color: chatData.isUser ? Colors.white : Colors.black),
                        );

                        // ChatBubble(
                        //   message: chatData.text,
                        //   isUser: chatData.isUser,
                        // );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormWidget(
                      _controller,
                      "",
                      false,
                      hint: "Type your question",
                      icon: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.SECONDARYCOLOR),
                        child: IconButton(
                          icon: chatProvider.loadReplyMessage
                              ? CupertinoActivityIndicator(
                                  color: AppColors.WHITE,
                                )
                              : Icon(
                                  FeatherIcons.send,
                                  color: AppColors.WHITE,
                                ),
                          onPressed: () async {
                            await chatProvider.getReply(
                                context, _controller.text);
                            _controller.clear();
                          },
                        ),
                      ),
                    ),
                  ),
                  AppSpaces.height8,
                ],
              );
      }),
    );
  }
}
