import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';
import 'package:wings/respositoryImpl/chat_repository.dart';

import '../../models/chats/message.dart';

final chatRepositoryProvider = Provider<ChatRepository>(
  (ref) => ChatRepository(
    firestore: FirebaseFirestore.instance,
    auth: FirebaseAuth.instance,
  ),
);

final chatListProvider = StreamProvider(
  (ref) => ref.read(chatRepositoryProvider).getChatContacts(),
);


final getChats = StreamProvider.family<List<Message>, String>((ref, id) {
  return ref.read(chatRepositoryProvider).getChatStream(id);
});
