import 'package:alkebulan/Controllers/ChatController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
              top: screenHeight * 0.08,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back)),
                Text(
                  "Akua GPT",
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Get.toNamed('/settings');
                    },
                    child: Icon(Icons.settings_outlined)),
              ],
            ),
          ),

          // Chat Messages
          Expanded(
            child: Obx(() {
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  final message = chatController.messages[index];
                  bool isUser = message.sender == "user";
                  return Align(
                    alignment:
                        isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      constraints: BoxConstraints(
                        maxWidth: screenWidth * 0.75,
                      ),
                      child: Text(
                        message.message,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),

          // Chat Input Field
          _buildChatInput(),
        ],
      ),
    );
  }

  Widget _buildChatInput() {
    TextEditingController messageController = TextEditingController();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: Colors.black,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Message Akua",
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_upward, color: Colors.white),
            onPressed: () {
              if (messageController.text.trim().isNotEmpty) {
                chatController.sendMessage(messageController.text.trim());
                messageController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
