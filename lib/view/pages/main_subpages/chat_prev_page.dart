import 'package:flutter/material.dart';

class ChatPrevPage extends StatelessWidget {
  const ChatPrevPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("채팅"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: const [
            Text("아이디 입력")
          ],
        ),
      ),
    );
  }
}
