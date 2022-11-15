import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:future_chat/app/data/models/user_model.dart';

//Social media post model
enum PostReactions { like, love, haha, wow, sad, angry }

class PostModel {
  String? id;
  String? title;
  String? description;
  String? imageUrl;
  SocialMediaUser? user;
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
    this.user,
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
    SocialMediaUser? user,
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
    if (user != null) {
      result.addAll({'user': user!.toMap()});
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
    return 'PostModel(id: $id, title: $title, description: $description, imageUrl: $imageUrl, user: $user, sharedFrom: $sharedFrom, sharedComment: $sharedComment, createdAt: $createdAt, comments: $comments, reactions: $reactions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostModel &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.imageUrl == imageUrl &&
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
        title.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
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
  String? postId;
  SocialMediaUser? user;
  String? commentImageUrl;
  String? comment;
  DateTime? createdAt;
  List<Reaction>? reactions;
  Comment({
    this.id,
    this.postId,
    this.user,
    this.commentImageUrl,
    this.comment,
    this.createdAt,
    this.reactions,
  });

  Comment copyWith({
    String? id,
    String? postId,
    SocialMediaUser? user,
    String? commentImageUrl,
    String? comment,
    DateTime? createdAt,
    List<Reaction>? reactions,
  }) {
    return Comment(
      id: id ?? this.id,
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
    return 'Comment(id: $id, postId: $postId, user: $user, commentImageUrl: $commentImageUrl, comment: $comment, createdAt: $createdAt, reactions: $reactions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Comment &&
        other.id == id &&
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
  SocialMediaUser? user;
  String? reaction;
  DateTime? createdAt;
  Reaction({
    this.id,
    this.postId,
    this.user,
    this.reaction,
    this.createdAt,
  });

  Reaction copyWith({
    String? id,
    String? postId,
    SocialMediaUser? user,
    String? reaction,
    DateTime? createdAt,
  }) {
    return Reaction(
      id: id ?? this.id,
      postId: postId ?? this.postId,
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
    return 'Reaction(id: $id, postId: $postId, user: $user, reaction: $reaction, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Reaction &&
        other.id == id &&
        other.postId == postId &&
        other.user == user &&
        other.reaction == reaction &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        postId.hashCode ^
        user.hashCode ^
        reaction.hashCode ^
        createdAt.hashCode;
  }
}

class Story {
  String? id;
  SocialMediaUser? user;
  String? storyImageUrl;
  String? storyText;
  DateTime? createdAt;
  Story({
    this.id,
    this.user,
    this.storyImageUrl,
    this.storyText,
    this.createdAt,
  });

  Story copyWith({
    String? id,
    SocialMediaUser? user,
    String? storyImageUrl,
    String? storyText,
    DateTime? createdAt,
  }) {
    return Story(
      id: id ?? this.id,
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
    if (user != null) {
      result.addAll({'user': user!.toMap()});
    }
    if (storyImageUrl != null) {
      result.addAll({'storyImageUrl': storyImageUrl});
    }
    if (storyText != null) {
      result.addAll({'storyText': storyText});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt!.millisecondsSinceEpoch});
    }

    return result;
  }

  factory Story.fromMap(Map<String, dynamic> map) {
    return Story(
      id: map['id'],
      user: map['user'] != null ? SocialMediaUser.fromMap(map['user']) : null,
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
    return 'Story(id: $id, user: $user, storyImageUrl: $storyImageUrl, storyText: $storyText, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Story &&
        other.id == id &&
        other.user == user &&
        other.storyImageUrl == storyImageUrl &&
        other.storyText == storyText &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user.hashCode ^
        storyImageUrl.hashCode ^
        storyText.hashCode ^
        createdAt.hashCode;
  }
}
