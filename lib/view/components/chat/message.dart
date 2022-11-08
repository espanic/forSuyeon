import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:for_suyeon/view/components/chat/chat_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return GestureDetector(
      onTap: () {
        final focusScope = FocusScope.of(context);
        if (focusScope.hasFocus) {
          focusScope.unfocus();
        }
      },
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('time', descending: true)
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final chatDocs = snapshot.data!.docs;

          return ListView.builder(
            reverse: true,
            itemCount: chatDocs.length,
            itemBuilder: (context, index) {
              bool showAvatar = false;
              var text = chatDocs[index]['text'];
              var uid = chatDocs[index]['userID'];
              if (index == 0 || chatDocs[index - 1]['userID'] != uid) {
                if (user!.uid != uid) {
                  showAvatar = true;
                }
              }
              return Row(
                children: [
                  ChatBubble(
                    text,
                    uid,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
