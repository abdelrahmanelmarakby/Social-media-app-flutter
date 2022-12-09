import 'dart:convert';

import 'package:future_chat/app/data/models/user_model.dart';

class GroupChatMessage {
  final String? groupChatId;
  final String? id;
  final SocialMediaUser? sender;
  final String? text;
  final DateTime? sentAt;
  final bool? isLiked;
  final bool? unread;
  final String? imageUrl;
  final String? videoUrl;
  final String? audioUrl;
  GroupChatMessage({
    required this.groupChatId,
    this.id,
    required this.sender,
    required this.text,
    required this.sentAt,
    required this.isLiked,
    required this.unread,
    this.imageUrl,
    this.videoUrl,
    this.audioUrl,
  });

  GroupChatMessage copyWith({
    String? groupChatId,
    String? id,
    SocialMediaUser? sender,
    String? text,
    DateTime? sentAt,
    bool? isLiked,
    bool? unread,
    String? imageUrl,
    String? videoUrl,
    String? audioUrl,
  }) {
    return GroupChatMessage(
      groupChatId: groupChatId ?? this.groupChatId,
      id: id ?? this.id,
      sender: sender ?? this.sender,
      text: text ?? this.text,
      sentAt: sentAt ?? this.sentAt,
      isLiked: isLiked ?? this.isLiked,
      unread: unread ?? this.unread,
      imageUrl: imageUrl ?? this.imageUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      audioUrl: audioUrl ?? this.audioUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'groupChatId': groupChatId});
    result.addAll({'id': id});
    result.addAll({'sender': sender?.toMap()});
    result.addAll({'text': text});
    result.addAll({'sentAt': sentAt!.millisecondsSinceEpoch});
    result.addAll({'isLiked': isLiked});
    result.addAll({'unread': unread});
    result.addAll({'imageUrl': imageUrl});
    result.addAll({'videoUrl': videoUrl});
    result.addAll({'audioUrl': audioUrl});

    return result;
  }

  factory GroupChatMessage.fromMap(Map<String, dynamic> map) {
    return GroupChatMessage(
      groupChatId: map['groupChatId'],
      id: map['id'],
      sender:
          map['sender'] != null ? SocialMediaUser.fromMap(map['sender']) : null,
      text: map['text'],
      sentAt: map['sentAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['sentAt'])
          : null,
      isLiked: map['isLiked'],
      unread: map['unread'],
      imageUrl: map['imageUrl'],
      videoUrl: map['videoUrl'],
      audioUrl: map['audioUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupChatMessage.fromJson(String source) =>
      GroupChatMessage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GroupChatMessage(groupChatId: $groupChatId, id: $id, sender: $sender, text: $text, sentAt: $sentAt, isLiked: $isLiked, unread: $unread, imageUrl: $imageUrl, videoUrl: $videoUrl, audioUrl: $audioUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GroupChatMessage &&
        other.groupChatId == groupChatId &&
        other.id == id &&
        other.sender == sender &&
        other.text == text &&
        other.sentAt == sentAt &&
        other.isLiked == isLiked &&
        other.unread == unread &&
        other.imageUrl == imageUrl &&
        other.videoUrl == videoUrl &&
        other.audioUrl == audioUrl;
  }

  @override
  int get hashCode {
    return groupChatId.hashCode ^
        id.hashCode ^
        sender.hashCode ^
        text.hashCode ^
        sentAt.hashCode ^
        isLiked.hashCode ^
        unread.hashCode ^
        imageUrl.hashCode ^
        videoUrl.hashCode ^
        audioUrl.hashCode;
  }
}
