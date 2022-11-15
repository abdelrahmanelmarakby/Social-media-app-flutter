import 'dart:convert';

import 'package:flutter/foundation.dart';

//Social media post model
enum PostReactions { like, love, haha, wow, sad, angry }

extension ParseToString on PostReactions {
  String toShortString() {
    return toString().split('.').last;
  }
}

class PostModel {
  String? id;
  String? title;
  String? description;
  String? imageUrl;
  String? userId;
  String? userName;
  String? userPhotoUrl;
  String? sharedFrom;
  String? sharedComment;
  DateTime? createdAt;
  List<Comment>? comments;
  List<Reaction>? reactions;
  PostModel({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.userId,
    this.userName,
    this.userPhotoUrl,
    this.sharedFrom,
    this.sharedComment,
    this.createdAt,
    this.comments,
    this.reactions,
  });

  PostModel copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    String? userId,
    String? userName,
    String? userPhotoUrl,
    String? sharedFrom,
    String? sharedComment,
    DateTime? createdAt,
    List<Comment>? comments,
    List<Reaction>? reactions,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userPhotoUrl: userPhotoUrl ?? this.userPhotoUrl,
      sharedFrom: sharedFrom ?? this.sharedFrom,
      sharedComment: sharedComment ?? this.sharedComment,
      createdAt: createdAt ?? this.createdAt,
      comments: comments ?? this.comments,
      reactions: reactions ?? this.reactions,
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
    if (description != null) {
      result.addAll({'description': description});
    }
    if (imageUrl != null) {
      result.addAll({'imageUrl': imageUrl});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (userName != null) {
      result.addAll({'userName': userName});
    }
    if (userPhotoUrl != null) {
      result.addAll({'userPhotoUrl': userPhotoUrl});
    }
    if (sharedFrom != null) {
      result.addAll({'sharedFrom': sharedFrom});
    }
    if (sharedComment != null) {
      result.addAll({'sharedComment': sharedComment});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt!.millisecondsSinceEpoch});
    }
    if (comments != null) {
      result.addAll({'comments': comments!.map((x) => x.toMap()).toList()});
    }
    if (reactions != null) {
      result.addAll({'reactions': reactions!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      userId: map['userId'],
      userName: map['userName'],
      userPhotoUrl: map['userPhotoUrl'],
      sharedFrom: map['sharedFrom'],
      sharedComment: map['sharedComment'],
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
          : null,
      comments: map['comments'] != null
          ? List<Comment>.from(map['comments']?.map((x) => Comment.fromMap(x)))
          : null,
      reactions: map['reactions'] != null
          ? List<Reaction>.from(
              map['reactions']?.map((x) => Reaction.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostModel(id: $id, title: $title, description: $description, imageUrl: $imageUrl, userId: $userId, userName: $userName, userPhotoUrl: $userPhotoUrl, sharedFrom: $sharedFrom, sharedComment: $sharedComment, createdAt: $createdAt, comments: $comments, reactions: $reactions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostModel &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.userId == userId &&
        other.userName == userName &&
        other.userPhotoUrl == userPhotoUrl &&
        other.sharedFrom == sharedFrom &&
        other.sharedComment == sharedComment &&
        other.createdAt == createdAt &&
        listEquals(other.comments, comments) &&
        listEquals(other.reactions, reactions);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
        userId.hashCode ^
        userName.hashCode ^
        userPhotoUrl.hashCode ^
        sharedFrom.hashCode ^
        sharedComment.hashCode ^
        createdAt.hashCode ^
        comments.hashCode ^
        reactions.hashCode;
  }
}

class Comment {
  String? id;
  String? postId;
  String? userId;
  String? userName;
  String? userPhotoUrl;
  String? commentImageUrl;
  String? comment;
  DateTime? createdAt;
  List<Reaction>? reactions;
  Comment({
    this.id,
    this.postId,
    this.userId,
    this.userName,
    this.userPhotoUrl,
    this.commentImageUrl,
    this.comment,
    this.createdAt,
    this.reactions,
  });

  Comment copyWith({
    String? id,
    String? postId,
    String? userId,
    String? userName,
    String? userPhotoUrl,
    String? commentImageUrl,
    String? comment,
    DateTime? createdAt,
    List<Reaction>? reactions,
  }) {
    return Comment(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userPhotoUrl: userPhotoUrl ?? this.userPhotoUrl,
      commentImageUrl: commentImageUrl ?? this.commentImageUrl,
      comment: comment ?? this.comment,
      createdAt: createdAt ?? this.createdAt,
      reactions: reactions ?? this.reactions,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'postId': postId});
    result.addAll({'userId': userId});
    result.addAll({'userName': userName});
    result.addAll({'userPhotoUrl': userPhotoUrl});
    result.addAll({'commentImageUrl': commentImageUrl});
    result.addAll({'comment': comment});
    result.addAll({'createdAt': createdAt!.millisecondsSinceEpoch});
    result.addAll({'reactions': reactions!.map((x) => x.toMap()).toList()});

    return result;
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id'],
      postId: map['postId'],
      userId: map['userId'],
      userName: map['userName'],
      userPhotoUrl: map['userPhotoUrl'],
      commentImageUrl: map['commentImageUrl'],
      comment: map['comment'],
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
          : null,
      reactions: map['reactions'] != null
          ? List<Reaction>.from(
              map['reactions']?.map((x) => Reaction.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Comment(id: $id, postId: $postId, userId: $userId, userName: $userName, userPhotoUrl: $userPhotoUrl, commentImageUrl: $commentImageUrl, comment: $comment, createdAt: $createdAt, reactions: $reactions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Comment &&
        other.id == id &&
        other.postId == postId &&
        other.userId == userId &&
        other.userName == userName &&
        other.userPhotoUrl == userPhotoUrl &&
        other.commentImageUrl == commentImageUrl &&
        other.comment == comment &&
        other.createdAt == createdAt &&
        listEquals(other.reactions, reactions);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        postId.hashCode ^
        userId.hashCode ^
        userName.hashCode ^
        userPhotoUrl.hashCode ^
        commentImageUrl.hashCode ^
        comment.hashCode ^
        createdAt.hashCode ^
        reactions.hashCode;
  }
}

class Reaction {
  String? id;
  String? postId;
  String? userId;
  String? userName;
  String? userPhotoUrl;
  PostReactions? reaction;
  DateTime? createdAt;
  Reaction({
    this.id,
    this.postId,
    this.userId,
    this.userName,
    this.userPhotoUrl,
    this.reaction,
    this.createdAt,
  });

  Reaction copyWith({
    String? id,
    String? postId,
    String? userId,
    String? userName,
    String? userPhotoUrl,
    PostReactions? reaction,
    DateTime? createdAt,
  }) {
    return Reaction(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userPhotoUrl: userPhotoUrl ?? this.userPhotoUrl,
      reaction: reaction ?? this.reaction,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'postId': postId});
    result.addAll({'userId': userId});
    result.addAll({'userName': userName});
    result.addAll({'userPhotoUrl': userPhotoUrl});
    result.addAll({'reaction': reaction?.toShortString()});
    result.addAll({'createdAt': createdAt!.millisecondsSinceEpoch});

    return result;
  }

  factory Reaction.fromMap(Map<String, dynamic> map) {
    return Reaction(
      id: map['id'],
      postId: map['postId'],
      userId: map['userId'],
      userName: map['userName'],
      userPhotoUrl: map['userPhotoUrl'],
      reaction: map['reaction'] ?? map['reaction'],
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reaction.fromJson(String source) =>
      Reaction.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Reaction(id: $id, postId: $postId, userId: $userId, userName: $userName, userPhotoUrl: $userPhotoUrl, reaction: $reaction, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Reaction &&
        other.id == id &&
        other.postId == postId &&
        other.userId == userId &&
        other.userName == userName &&
        other.userPhotoUrl == userPhotoUrl &&
        other.reaction == reaction &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        postId.hashCode ^
        userId.hashCode ^
        userName.hashCode ^
        userPhotoUrl.hashCode ^
        reaction.hashCode ^
        createdAt.hashCode;
  }
}

class Story {
  String? id;
  String? userId;
  String? userName;
  String? userPhotoUrl;
  String? storyImageUrl;
  String? storyText;
  DateTime? createdAt;
  Story({
    this.id,
    this.userId,
    this.userName,
    this.userPhotoUrl,
    this.storyImageUrl,
    this.storyText,
    this.createdAt,
  });

  Story copyWith({
    String? id,
    String? userId,
    String? userName,
    String? userPhotoUrl,
    String? storyImageUrl,
    String? storyText,
    DateTime? createdAt,
  }) {
    return Story(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userPhotoUrl: userPhotoUrl ?? this.userPhotoUrl,
      storyImageUrl: storyImageUrl ?? this.storyImageUrl,
      storyText: storyText ?? this.storyText,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'userId': userId});
    result.addAll({'userName': userName});
    result.addAll({'userPhotoUrl': userPhotoUrl});
    result.addAll({'storyImageUrl': storyImageUrl});
    result.addAll({'storyText': storyText});
    result.addAll({'createdAt': DateTime.now().millisecondsSinceEpoch});

    return result;
  }

  factory Story.fromMap(Map<String, dynamic> map) {
    return Story(
      id: map['id'],
      userId: map['userId'],
      userName: map['userName'],
      userPhotoUrl: map['userPhotoUrl'],
      storyImageUrl: map['storyImageUrl'],
      storyText: map['storyText'],
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Story.fromJson(String source) => Story.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Story(id: $id, userId: $userId, userName: $userName, userPhotoUrl: $userPhotoUrl, storyImageUrl: $storyImageUrl, storyText: $storyText, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Story &&
        other.id == id &&
        other.userId == userId &&
        other.userName == userName &&
        other.userPhotoUrl == userPhotoUrl &&
        other.storyImageUrl == storyImageUrl &&
        other.storyText == storyText &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        userName.hashCode ^
        userPhotoUrl.hashCode ^
        storyImageUrl.hashCode ^
        storyText.hashCode ^
        createdAt.hashCode;
  }
}
