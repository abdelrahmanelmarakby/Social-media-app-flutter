import 'dart:convert';

import 'package:flutter/foundation.dart';

class GroupChatModel {
  final String? id;
  final String? creatorId;
  final String? name;
  final String? image;
  final String? lastMessage;
  final String? lastMessageTime;
  final String? lastMessageSender;
  final int? unreadMessages;
  final List<String>? members;
  final List<String>? admins;
  final List<String>? blocked;
  final List<String>? muted;
  final List<String>? keywords;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  GroupChatModel({
    required this.id,
    this.creatorId,
    this.name,
    this.image,
    this.lastMessage,
    this.lastMessageTime,
    this.lastMessageSender,
    this.unreadMessages,
    this.members,
    this.admins,
    this.blocked,
    this.muted,
    this.keywords,
    this.createdAt,
    this.updatedAt,
  });

  GroupChatModel copyWith({
    String? id,
    String? creatorId,
    String? name,
    String? image,
    String? lastMessage,
    String? lastMessageTime,
    String? lastMessageSender,
    int? unreadMessages,
    List<String>? members,
    List<String>? admins,
    List<String>? blocked,
    List<String>? muted,
    List<String>? keywords,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return GroupChatModel(
      id: id ?? this.id,
      creatorId: creatorId ?? this.creatorId,
      name: name ?? this.name,
      image: image ?? this.image,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      lastMessageSender: lastMessageSender ?? this.lastMessageSender,
      unreadMessages: unreadMessages ?? this.unreadMessages,
      members: members ?? this.members,
      admins: admins ?? this.admins,
      blocked: blocked ?? this.blocked,
      muted: muted ?? this.muted,
      keywords: keywords ?? this.keywords,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (creatorId != null) {
      result.addAll({'creatorId': creatorId});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (image != null) {
      result.addAll({'image': image});
    }
    if (lastMessage != null) {
      result.addAll({'lastMessage': lastMessage});
    }
    if (lastMessageTime != null) {
      result.addAll({'lastMessageTime': lastMessageTime});
    }
    if (lastMessageSender != null) {
      result.addAll({'lastMessageSender': lastMessageSender});
    }
    if (unreadMessages != null) {
      result.addAll({'unreadMessages': unreadMessages});
    }
    if (members != null) {
      result.addAll({'members': members});
    }
    if (admins != null) {
      result.addAll({'admins': admins});
    }
    if (blocked != null) {
      result.addAll({'blocked': blocked});
    }
    if (muted != null) {
      result.addAll({'muted': muted});
    }
    if (keywords != null) {
      result.addAll({'keywords': keywords});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt!.millisecondsSinceEpoch});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt!.millisecondsSinceEpoch});
    }

    return result;
  }

  factory GroupChatModel.fromMap(Map<String, dynamic> map) {
    return GroupChatModel(
      id: map['id'],
      creatorId: map['creatorId'],
      name: map['name'],
      image: map['image'],
      lastMessage: map['lastMessage'],
      lastMessageTime: map['lastMessageTime'],
      lastMessageSender: map['lastMessageSender'],
      unreadMessages: map['unreadMessages']?.toInt(),
      members: List<String>.from(map['members']),
      admins: List<String>.from(map['admins']),
      blocked: List<String>.from(map['blocked']),
      muted: List<String>.from(map['muted']),
      keywords: List<String>.from(map['keywords']),
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
          : null,
      updatedAt: map['updatedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupChatModel.fromJson(String source) =>
      GroupChatModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GroupChatModel(id: $id, creatorId: $creatorId, name: $name, image: $image, lastMessage: $lastMessage, lastMessageTime: $lastMessageTime, lastMessageSender: $lastMessageSender, unreadMessages: $unreadMessages, members: $members, admins: $admins, blocked: $blocked, muted: $muted, keywords: $keywords, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GroupChatModel &&
        other.id == id &&
        other.creatorId == creatorId &&
        other.name == name &&
        other.image == image &&
        other.lastMessage == lastMessage &&
        other.lastMessageTime == lastMessageTime &&
        other.lastMessageSender == lastMessageSender &&
        other.unreadMessages == unreadMessages &&
        listEquals(other.members, members) &&
        listEquals(other.admins, admins) &&
        listEquals(other.blocked, blocked) &&
        listEquals(other.muted, muted) &&
        listEquals(other.keywords, keywords) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        creatorId.hashCode ^
        name.hashCode ^
        image.hashCode ^
        lastMessage.hashCode ^
        lastMessageTime.hashCode ^
        lastMessageSender.hashCode ^
        unreadMessages.hashCode ^
        members.hashCode ^
        admins.hashCode ^
        blocked.hashCode ^
        muted.hashCode ^
        keywords.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
