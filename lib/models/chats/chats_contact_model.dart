// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatContact {
  final String name;
  final String profilePic;
  final String contactId;
  final DateTime? timeSent;
  final String? lastMessage;
  final String fcm;
  ChatContact({
    required this.name,
    required this.profilePic,
    required this.contactId,
     this.timeSent,
     this.lastMessage,
    required this.fcm,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'profilePic': profilePic,
      'contactId': contactId,
      'timeSent': timeSent?.millisecondsSinceEpoch,
      'lastMessage': lastMessage,
      "fcmToken": fcm,
    };
  }

  factory ChatContact.fromMap(Map<String, dynamic> map) {
    return ChatContact(
      fcm: map['fcmToken'],
      name: map['name'] ?? '',
      profilePic: map['profilePic'] ?? '',
      contactId: map['contactId'] ?? '',
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent']),
      lastMessage: map['lastMessage'] ?? '',
    );
  }
}
