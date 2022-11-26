import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';

import 'package:future_chat/app/data/models/user_model.dart';

class Notification {
  final String? id;
  final String? title;
  final String? body;
  final String? type;
  final String? data;
  final SocialMediaUser? fromUser;
  final List<String>? toUsers;
  final String? createdAt;
  final String? imageUrl;
  Notification({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    required this.data,
    this.fromUser,
    this.toUsers,
    required this.createdAt,
    required this.imageUrl,
  });

  Notification copyWith({
    String? id,
    String? title,
    String? body,
    String? type,
    String? data,
    SocialMediaUser? fromUser,
    List<String>? toUsers,
    String? createdAt,
    String? imageUrl,
  }) {
    return Notification(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      type: type ?? this.type,
      data: data ?? this.data,
      fromUser: fromUser ?? this.fromUser,
      toUsers: toUsers ?? this.toUsers,
      createdAt: createdAt ?? this.createdAt,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (body != null) {
      result.addAll({'body': body});
    }
    if (type != null) {
      result.addAll({'type': type});
    }
    if (data != null) {
      result.addAll({'data': data});
    }
    if (fromUser != null) {
      result.addAll({'fromUser': fromUser!.toMap()});
    }
    if (toUsers != null) {
      result.addAll({'toUsers': toUsers});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (imageUrl != null) {
      result.addAll({'imageUrl': imageUrl});
    }

    return result;
  }

  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      type: map['type'],
      data: map['data'],
      fromUser: map['fromUser'] != null
          ? SocialMediaUser.fromMap(map['fromUser'])
          : null,
      toUsers: List<String>.from(map['toUsers']),
      createdAt: map['createdAt'],
      imageUrl: map['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Notification.fromJson(String source) =>
      Notification.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Notification(id: $id, title: $title, body: $body, type: $type, data: $data, fromUser: $fromUser, toUsers: $toUsers, createdAt: $createdAt, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Notification &&
        other.id == id &&
        other.title == title &&
        other.body == body &&
        other.type == type &&
        other.data == data &&
        other.fromUser == fromUser &&
        listEquals(other.toUsers, toUsers) &&
        other.createdAt == createdAt &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        body.hashCode ^
        type.hashCode ^
        data.hashCode ^
        fromUser.hashCode ^
        toUsers.hashCode ^
        createdAt.hashCode ^
        imageUrl.hashCode;
  }
}
