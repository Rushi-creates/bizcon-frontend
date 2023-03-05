// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Post {
  int? id;
  String title;
  String description;
  String salary_method;
  String goals;
  String qualifications_req;
  String skills_req;
  int max_users;
  bool isOpen;
  bool isCompanyRegistered;
  String recordDate;
  int post_fk;
  String? owner_username;
  String? owner_bio;
  Post({
    this.id,
    required this.title,
    required this.description,
    required this.salary_method,
    required this.goals,
    required this.qualifications_req,
    required this.skills_req,
    required this.max_users,
    required this.isOpen,
    required this.isCompanyRegistered,
    required this.recordDate,
    required this.post_fk,
    this.owner_username,
    this.owner_bio,
  });

  Post copyWith({
    int? id,
    String? title,
    String? description,
    String? salary_method,
    String? goals,
    String? qualifications_req,
    String? skills_req,
    int? max_users,
    bool? isOpen,
    bool? isCompanyRegistered,
    String? recordDate,
    int? post_fk,
    String? owner_username,
    String? owner_bio,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      salary_method: salary_method ?? this.salary_method,
      goals: goals ?? this.goals,
      qualifications_req: qualifications_req ?? this.qualifications_req,
      skills_req: skills_req ?? this.skills_req,
      max_users: max_users ?? this.max_users,
      isOpen: isOpen ?? this.isOpen,
      isCompanyRegistered: isCompanyRegistered ?? this.isCompanyRegistered,
      recordDate: recordDate ?? this.recordDate,
      post_fk: post_fk ?? this.post_fk,
      owner_username: owner_username ?? this.owner_username,
      owner_bio: owner_bio ?? this.owner_bio,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'salary_method': salary_method,
      'goals': goals,
      'qualifications_req': qualifications_req,
      'skills_req': skills_req,
      'max_users': max_users,
      'isOpen': isOpen,
      'isCompanyRegistered': isCompanyRegistered,
      'recordDate': recordDate,
      'post_fk': post_fk,
      'owner_username': owner_username,
      'owner_bio': owner_bio,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] as String,
      description: map['description'] as String,
      salary_method: map['salary_method'] as String,
      goals: map['goals'] as String,
      qualifications_req: map['qualifications_req'] as String,
      skills_req: map['skills_req'] as String,
      max_users: map['max_users'] as int,
      isOpen: map['isOpen'] as bool,
      isCompanyRegistered: map['isCompanyRegistered'] as bool,
      recordDate: map['recordDate'] as String,
      post_fk: map['post_fk'] as int,
      owner_username: map['owner_username'] != null
          ? map['owner_username'] as String
          : null,
      owner_bio: map['owner_bio'] != null ? map['owner_bio'] as String : null,
    );
  }
  static fromMapList(rawData) {
    List parsedJsonList = rawData;
    List dartObjList = parsedJsonList.map((i) => Post.fromMap(i)).toList();
    return dartObjList;
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Post(id: $id, title: $title, description: $description, salary_method: $salary_method, goals: $goals, qualifications_req: $qualifications_req, skills_req: $skills_req, max_users: $max_users, isOpen: $isOpen, isCompanyRegistered: $isCompanyRegistered, recordDate: $recordDate, post_fk: $post_fk, owner_username: $owner_username, owner_bio: $owner_bio)';
  }

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.salary_method == salary_method &&
        other.goals == goals &&
        other.qualifications_req == qualifications_req &&
        other.skills_req == skills_req &&
        other.max_users == max_users &&
        other.isOpen == isOpen &&
        other.isCompanyRegistered == isCompanyRegistered &&
        other.recordDate == recordDate &&
        other.post_fk == post_fk &&
        other.owner_username == owner_username &&
        other.owner_bio == owner_bio;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        salary_method.hashCode ^
        goals.hashCode ^
        qualifications_req.hashCode ^
        skills_req.hashCode ^
        max_users.hashCode ^
        isOpen.hashCode ^
        isCompanyRegistered.hashCode ^
        recordDate.hashCode ^
        post_fk.hashCode ^
        owner_username.hashCode ^
        owner_bio.hashCode;
  }
}
