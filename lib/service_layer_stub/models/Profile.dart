// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Profile {
  int p_uid;
  String username;
  String bio;
  String role;
  String qualifications;
  String skills;
  Profile({
    required this.p_uid,
    required this.username,
    required this.bio,
    required this.role,
    required this.qualifications,
    required this.skills,
  });

  Profile copyWith({
    int? p_uid,
    String? username,
    String? bio,
    String? role,
    String? qualifications,
    String? skills,
  }) {
    return Profile(
      p_uid: p_uid ?? this.p_uid,
      username: username ?? this.username,
      bio: bio ?? this.bio,
      role: role ?? this.role,
      qualifications: qualifications ?? this.qualifications,
      skills: skills ?? this.skills,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'p_uid': p_uid,
      'username': username,
      'bio': bio,
      'role': role,
      'qualifications': qualifications,
      'skills': skills,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      p_uid: map['p_uid'] as int,
      username: map['username'] as String,
      bio: map['bio'] as String,
      role: map['role'] as String,
      qualifications: map['qualifications'] as String,
      skills: map['skills'] as String,
    );
  }

  static fromMapList(rawData) {
    List parsedJsonList = rawData;
    List dartObjList = parsedJsonList.map((i) => Profile.fromMap(i)).toList();
    return dartObjList;
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Profile(p_uid: $p_uid, username: $username, bio: $bio, role: $role, qualifications: $qualifications, skills: $skills)';
  }

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.p_uid == p_uid &&
        other.username == username &&
        other.bio == bio &&
        other.role == role &&
        other.qualifications == qualifications &&
        other.skills == skills;
  }

  @override
  int get hashCode {
    return p_uid.hashCode ^
        username.hashCode ^
        bio.hashCode ^
        role.hashCode ^
        qualifications.hashCode ^
        skills.hashCode;
  }
}
