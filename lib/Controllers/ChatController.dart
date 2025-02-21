import 'package:alkebulan/Models/MessageModel.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  var messages = <MessageModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void sendMessage(String message) {
    if (message.trim().isEmpty) return;

    messages.add(MessageModel(sender: "user", message: message));
    update();

    Future.delayed(Duration(milliseconds: 500), () {
      receiveBotReply();
    });
  }

  void receiveBotReply() {
    messages.add(MessageModel(
        sender: "bot",
        message: "That's a great question! Here's more information."));
    update();
  }
}
