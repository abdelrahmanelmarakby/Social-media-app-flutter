import 'dart:convert';

import 'package:future_chat/app/data/models/user_model.dart';

class GroupChatMessage {
  final String groupChatId;
  final String? id;
  final SocialMediaUser sender;
  final String text;
  final DateTime sentAt;
  final bool isLiked;
  final bool unread;
  final String? imageUrl;
  GroupChatMessage({
    required this.groupChatId,
    this.id,
    required this.sender,
    required this.text,
    required this.sentAt,
    required this.isLiked,
    required this.unread,
    this.imageUrl,
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
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'groupChatId': groupChatId});
    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'sender': sender.toMap()});
    result.addAll({'text': text});
    result.addAll({'sentAt': DateTime.now().millisecondsSinceEpoch});
    result.addAll({'isLiked': isLiked});
    result.addAll({'unread': unread});
    if (imageUrl != null) {
      result.addAll({'imageUrl': imageUrl});
    }

    return result;
  }

  factory GroupChatMessage.fromMap(Map<String, dynamic> map) {
    return GroupChatMessage(
      groupChatId: map['groupChatId'] ?? '',
      id: map['id'],
      sender: SocialMediaUser.fromMap(map['sender']),
      text: map['text'] ?? '',
      sentAt: DateTime.fromMillisecondsSinceEpoch(map['sentAt']),
      isLiked: map['isLiked'] ?? false,
      unread: map['unread'] ?? false,
      imageUrl: map['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupChatMessage.fromJson(String source) =>
      GroupChatMessage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GroupChatMessage(groupChatId: $groupChatId, id: $id, sender: $sender, text: $text, sentAt: $sentAt, isLiked: $isLiked, unread: $unread, imageUrl: $imageUrl)';
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
        other.imageUrl == imageUrl;
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
        imageUrl.hashCode;
  }
}
