// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostMembers {
  int? id;
  int post_fk;
  String? post_title;
  String? post_description;
  int member_fk;
  String? member_username;
  bool? isAccepted;
  String joinedTime;
  PostMembers({
    this.id,
    required this.post_fk,
    this.post_title,
    this.post_description,
    required this.member_fk,
    this.member_username,
    this.isAccepted,
    required this.joinedTime,
  });

  PostMembers copyWith({
    int? id,
    int? post_fk,
    String? post_title,
    String? post_description,
    int? member_fk,
    String? member_username,
    bool? isAccepted,
    String? joinedTime,
  }) {
    return PostMembers(
      id: id ?? this.id,
      post_fk: post_fk ?? this.post_fk,
      post_title: post_title ?? this.post_title,
      post_description: post_description ?? this.post_description,
      member_fk: member_fk ?? this.member_fk,
      member_username: member_username ?? this.member_username,
      isAccepted: isAccepted ?? this.isAccepted,
      joinedTime: joinedTime ?? this.joinedTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'post_fk': post_fk,
      'post_title': post_title,
      'post_description': post_description,
      'member_fk': member_fk,
      'member_username': member_username,
      'isAccepted': isAccepted,
      'joinedTime': joinedTime,
    };
  }

  factory PostMembers.fromMap(Map<String, dynamic> map) {
    return PostMembers(
      id: map['id'] != null ? map['id'] as int : null,
      post_fk: map['post_fk'] as int,
      post_title:
          map['post_title'] != null ? map['post_title'] as String : null,
      post_description: map['post_description'] != null
          ? map['post_description'] as String
          : null,
      member_fk: map['member_fk'] as int,
      member_username: map['member_username'] != null
          ? map['member_username'] as String
          : null,
      isAccepted: map['isAccepted'] != null ? map['isAccepted'] as bool : null,
      joinedTime: map['joinedTime'] as String,
    );
  }

  static fromMapList(rawData) {
    List parsedJsonList = rawData;
    List dartObjList =
        parsedJsonList.map((i) => PostMembers.fromMap(i)).toList();
    return dartObjList;
  }

  String toJson() => json.encode(toMap());

  factory PostMembers.fromJson(String source) =>
      PostMembers.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostMembers(id: $id, post_fk: $post_fk, post_title: $post_title, post_description: $post_description, member_fk: $member_fk, member_username: $member_username, isAccepted: $isAccepted, joinedTime: $joinedTime)';
  }

  @override
  bool operator ==(covariant PostMembers other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.post_fk == post_fk &&
        other.post_title == post_title &&
        other.post_description == post_description &&
        other.member_fk == member_fk &&
        other.member_username == member_username &&
        other.isAccepted == isAccepted &&
        other.joinedTime == joinedTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        post_fk.hashCode ^
        post_title.hashCode ^
        post_description.hashCode ^
        member_fk.hashCode ^
        member_username.hashCode ^
        isAccepted.hashCode ^
        joinedTime.hashCode;
  }
}
