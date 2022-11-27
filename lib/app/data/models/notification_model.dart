import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:future_chat/app/data/models/user_model.dart';

class NotificationModel {
  final String? id;
  final String? title;
  final String? body;
  final String? type;
  final String? data;
  final SocialMediaUser? fromUser;
  final List<String>? toUsers;
  final DateTime? createdAt;
  final String? imageUrl;
  NotificationModel({
    this.id,
    this.title,
    this.body,
    this.type,
    this.data,
    this.fromUser,
    this.toUsers,
    this.createdAt,
    this.imageUrl,
  });

  NotificationModel copyWith({
    String? id,
    String? title,
    String? body,
    String? type,
    String? data,
    SocialMediaUser? fromUser,
    List<String>? toUsers,
    DateTime? createdAt,
    String? imageUrl,
  }) {
    return NotificationModel(
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
    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'body': body});
    result.addAll({'type': type});
    result.addAll({'data': data});
    result.addAll({'fromUser': fromUser!.toMap()});
    result.addAll({'toUsers': toUsers});
    result.addAll({'createdAt': createdAt!.millisecondsSinceEpoch});
    result.addAll({'imageUrl': imageUrl});

    return result;
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      type: map['type'],
      data: map['data'],
      fromUser: map['fromUser'] != null
          ? SocialMediaUser.fromMap(map['fromUser'])
          : null,
      toUsers: List<String>.from(map['toUsers']),
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
          : null,
      imageUrl: map['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NotificationModel(id: $id, title: $title, body: $body, type: $type, data: $data, fromUser: $fromUser, toUsers: $toUsers, createdAt: $createdAt, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NotificationModel &&
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
