// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Chats {
  int? senderId;
  String senderName;
  String? message;
  int? createdAt;
  Chats({
    this.senderId,
    required this.senderName,
    this.message,
    this.createdAt,
  });

  Chats copyWith({
    int? senderId,
    String? senderName,
    String? message,
    int? createdAt,
  }) {
    return Chats(
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'senderName': senderName,
      'message': message,
      'createdAt': createdAt,
    };
  }

  factory Chats.fromMap(Map<String, dynamic> map) {
    return Chats(
      senderId: map['senderId'] != null ? map['senderId'] as int : null,
      senderName: map['senderName'] as String,
      message: map['message'] != null ? map['message'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Chats.fromJson(String source) =>
      Chats.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Chats(senderId: $senderId, senderName: $senderName, message: $message, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant Chats other) {
    if (identical(this, other)) return true;

    return other.senderId == senderId &&
        other.senderName == senderName &&
        other.message == message &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return senderId.hashCode ^
        senderName.hashCode ^
        message.hashCode ^
        createdAt.hashCode;
  }
}
