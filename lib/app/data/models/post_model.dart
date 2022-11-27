import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:future_chat/app/data/models/user_model.dart';

//Social media post model
enum PostReactions { like, love, haha, wow, sad, angry }

class PostModel {
  String? id;
  String? uid;
  String? title;
  String? description;
  String? imageUrl;
  String? postUrl;
  SocialMediaUser? user;
  String? sharedFrom;
  String? sharedComment;
  DateTime? createdAt;
  List<Comment>? comments;
  List<Reaction>? reactions;
  PostModel({
    this.id,
    this.uid,
    this.title,
    this.description,
    this.imageUrl,
    this.postUrl,
    this.user,
    this.sharedFrom,
    this.sharedComment,
    this.createdAt,
    this.comments,
    this.reactions,
  });

  PostModel copyWith({
    String? id,
    String? uid,
    String? title,
    String? description,
    String? imageUrl,
    String? postUrl,
    SocialMediaUser? user,
    String? sharedFrom,
    String? sharedComment,
    DateTime? createdAt,
    List<Comment>? comments,
    List<Reaction>? reactions,
  }) {
    return PostModel(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      postUrl: postUrl ?? this.postUrl,
      user: user ?? this.user,
      sharedFrom: sharedFrom ?? this.sharedFrom,
      sharedComment: sharedComment ?? this.sharedComment,
      createdAt: createdAt ?? this.createdAt,
      comments: comments ?? this.comments,
      reactions: reactions ?? this.reactions,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'uid': uid});
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'imageUrl': imageUrl});
    result.addAll({'postUrl': postUrl});
    result.addAll({'user': user?.toMap()});
    result.addAll({'sharedFrom': sharedFrom});
    result.addAll({'sharedComment': sharedComment});
    result.addAll({'createdAt': DateTime.now().millisecondsSinceEpoch});
    result.addAll({'comments': comments?.map((x) => x.toMap()).toList()});
    result.addAll({'reactions': reactions?.map((x) => x.toMap()).toList()});

    return result;
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'],
      uid: map['uid'],
      title: map['title'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      postUrl: map['postUrl'],
      user: map['user'] != null ? SocialMediaUser.fromMap(map['user']) : null,
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
    return 'PostModel(id: $id, uid: $uid, title: $title, description: $description, imageUrl: $imageUrl, postUrl: $postUrl, user: $user, sharedFrom: $sharedFrom, sharedComment: $sharedComment, createdAt: $createdAt, comments: $comments, reactions: $reactions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostModel &&
        other.id == id &&
        other.uid == uid &&
        other.title == title &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.postUrl == postUrl &&
        other.user == user &&
        other.sharedFrom == sharedFrom &&
        other.sharedComment == sharedComment &&
        other.createdAt == createdAt &&
        listEquals(other.comments, comments) &&
        listEquals(other.reactions, reactions);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uid.hashCode ^
        title.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
        postUrl.hashCode ^
        user.hashCode ^
        sharedFrom.hashCode ^
        sharedComment.hashCode ^
        createdAt.hashCode ^
        comments.hashCode ^
        reactions.hashCode;
  }
}

class Comment {
  String? id;

  String? uid;
  String? postId;
  SocialMediaUser? user;
  String? commentImageUrl;
  String? comment;
  DateTime? createdAt;
  List<Reaction>? reactions;
  Comment({
    this.id,
    this.uid,
    this.postId,
    this.user,
    this.commentImageUrl,
    this.comment,
    this.createdAt,
    this.reactions,
  });

  Comment copyWith({
    String? id,
    String? uid,
    String? postId,
    SocialMediaUser? user,
    String? commentImageUrl,
    String? comment,
    DateTime? createdAt,
    List<Reaction>? reactions,
  }) {
    return Comment(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      postId: postId ?? this.postId,
      user: user ?? this.user,
      commentImageUrl: commentImageUrl ?? this.commentImageUrl,
      comment: comment ?? this.comment,
      createdAt: createdAt ?? this.createdAt,
      reactions: reactions ?? this.reactions,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (uid != null) {
      result.addAll({'uid': uid});
    }
    if (postId != null) {
      result.addAll({'postId': postId});
    }
    if (user != null) {
      result.addAll({'user': user!.toMap()});
    }
    if (commentImageUrl != null) {
      result.addAll({'commentImageUrl': commentImageUrl});
    }
    if (comment != null) {
      result.addAll({'comment': comment});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt!.millisecondsSinceEpoch});
    }
    if (reactions != null) {
      result.addAll({'reactions': reactions!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id'],
      uid: map['uid'],
      postId: map['postId'],
      user: map['user'] != null ? SocialMediaUser.fromMap(map['user']) : null,
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
    return 'Comment(id: $id, uid: $uid, postId: $postId, user: $user, commentImageUrl: $commentImageUrl, comment: $comment, createdAt: $createdAt, reactions: $reactions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Comment &&
        other.id == id &&
        other.uid == uid &&
        other.postId == postId &&
        other.user == user &&
        other.commentImageUrl == commentImageUrl &&
        other.comment == comment &&
        other.createdAt == createdAt &&
        listEquals(other.reactions, reactions);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uid.hashCode ^
        postId.hashCode ^
        user.hashCode ^
        commentImageUrl.hashCode ^
        comment.hashCode ^
        createdAt.hashCode ^
        reactions.hashCode;
  }
}

class Reaction {
  String? id;
  String? postId;

  String? uid;
  SocialMediaUser? user;
  String? reaction;
  DateTime? createdAt;
  Reaction({
    this.id,
    this.postId,
    this.uid,
    this.user,
    this.reaction,
    this.createdAt,
  });

  Reaction copyWith({
    String? id,
    String? postId,
    String? uid,
    SocialMediaUser? user,
    String? reaction,
    DateTime? createdAt,
  }) {
    return Reaction(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      uid: uid ?? this.uid,
      user: user ?? this.user,
      reaction: reaction ?? this.reaction,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (postId != null) {
      result.addAll({'postId': postId});
    }
    if (uid != null) {
      result.addAll({'uid': uid});
    }
    if (user != null) {
      result.addAll({'user': user!.toMap()});
    }
    if (reaction != null) {
      result.addAll({'reaction': reaction});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt!.millisecondsSinceEpoch});
    }

    return result;
  }

  factory Reaction.fromMap(Map<String, dynamic> map) {
    return Reaction(
      id: map['id'],
      postId: map['postId'],
      uid: map['uid'],
      user: map['user'] != null ? SocialMediaUser.fromMap(map['user']) : null,
      reaction: map['reaction'],
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
    return 'Reaction(id: $id, postId: $postId, uid: $uid, user: $user, reaction: $reaction, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Reaction &&
        other.id == id &&
        other.postId == postId &&
        other.uid == uid &&
        other.user == user &&
        other.reaction == reaction &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        postId.hashCode ^
        uid.hashCode ^
        user.hashCode ^
        reaction.hashCode ^
        createdAt.hashCode;
  }
}

class StoryModel {
  String? id;
  String? uid;
  SocialMediaUser? user;
  String? storyImageUrl;
  String? storyText;
  DateTime? createdAt;
  StoryModel({
    this.id,
    this.uid,
    this.user,
    this.storyImageUrl,
    this.storyText,
    this.createdAt,
  });

  StoryModel copyWith({
    String? id,
    String? uid,
    SocialMediaUser? user,
    String? storyImageUrl,
    String? storyText,
    DateTime? createdAt,
  }) {
    return StoryModel(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      user: user ?? this.user,
      storyImageUrl: storyImageUrl ?? this.storyImageUrl,
      storyText: storyText ?? this.storyText,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (uid != null) {
      result.addAll({'uid': uid});
    }
    if (user != null) {
      result.addAll({'user': user!.toMap()});
    }
    if (storyImageUrl != null) {
      result.addAll({'storyImageUrl': storyImageUrl});
    }
    if (storyText != null) {
      result.addAll({'storyText': storyText});
    }
    result.addAll({'createdAt': DateTime.now().millisecondsSinceEpoch});

    return result;
  }

  factory StoryModel.fromMap(Map<String, dynamic> map) {
    return StoryModel(
      id: map['id'],
      uid: map['uid'],
      user: map['user'] != null ? SocialMediaUser.fromMap(map['user']) : null,
      storyImageUrl: map['storyImageUrl'],
      storyText: map['storyText'],
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoryModel.fromJson(String source) =>
      StoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Story(id: $id, uid: $uid, user: $user, storyImageUrl: $storyImageUrl, storyText: $storyText, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StoryModel &&
        other.id == id &&
        other.uid == uid &&
        other.user == user &&
        other.storyImageUrl == storyImageUrl &&
        other.storyText == storyText &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uid.hashCode ^
        user.hashCode ^
        storyImageUrl.hashCode ^
        storyText.hashCode ^
        createdAt.hashCode;
  }
}
