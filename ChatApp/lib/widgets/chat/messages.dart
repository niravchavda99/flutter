import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './message_bubble.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (ctx, chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator());
        final chatDocs = chatSnapshot.data.docs;
        final user = FirebaseAuth.instance.currentUser;
        return ListView.builder(
          reverse: true,
          itemCount: chatDocs.length,
          itemBuilder: (c, i) => MessageBubble(
            chatDocs[i]['text'],
            chatDocs[i]['username'],
            chatDocs[i]['userImage'],
            chatDocs[i]['userId'] == user.uid,
            key: ValueKey(chatDocs[i].id),
          ),
        );
      },
    );
  }
}
