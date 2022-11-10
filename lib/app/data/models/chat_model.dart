import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoom {
  String? id, userA, userB, aName, bName, aImage, bImage, lastMsg, lastSender;
  DateTime? lastChat;
  List? keywords;
  bool read;

  ChatRoom(
      {this.id,
      this.userA,
      this.keywords,
      this.userB,
      this.lastChat,
      this.aImage,
      this.aName,
      this.bImage,
      this.bName,
      this.lastMsg,
      this.lastSender,
      this.read = false});

  ChatRoom.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userA = json['userA'],
        userB = json['userB'],
        lastMsg = json['lastMsg'],
        lastSender = json['lastSender'],
        keywords = json['keywords'],
        aName = json['aName'],
        bName = json['bName'],
        aImage = json['aImage'],
        bImage = json['bImage'],
        lastChat = json['lastChat'].toDate(),
        read = json['read'] ?? true;

  List<ChatRoom> fromQuery(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return ChatRoom(
        userA: doc.get('userA') ?? '',
        userB: doc.get('userB') ?? '',
        keywords: doc.get('keywords') ?? [],
        aName: doc.get('aName') ?? '',
        lastSender: doc.get('lastSender') ?? '',
        lastMsg: doc.get('lastMsg') ?? '',
        bName: doc.get('bName') ?? '',
        aImage: doc.get('aImage') ?? '',
        bImage: doc.get('bImage') ?? '',
        lastChat: doc.get('lastChat') != null
            ? doc.get('lastChat').toDate()
            : DateTime.now(),
        read: doc.get('read') ?? true,
      );
    }).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userA": userA,
      "userB": userB,
      "aName": aName,
      "keywords": keywords,
      "bName": bName,
      "lastSender": lastSender,
      "lastMsg": lastMsg,
      "aImage": aImage,
      "bImage": bImage,
      "lastChat": lastChat,
      "read": read
    };
  }

  @override
  String toString() {
    return 'ChatRoom(lastSender: $lastSender, lastChat: $lastChat, keywords: $keywords, read: $read)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatRoom &&
        other.lastSender == lastSender &&
        other.lastChat == lastChat &&
        other.keywords == keywords &&
        other.read == read;
  }

  @override
  int get hashCode {
    return lastSender.hashCode ^
        lastChat.hashCode ^
        keywords.hashCode ^
        read.hashCode;
  }
}

class Fluff {
  final String? sender;
  final DateTime?
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  String? text;
  String? image;
  String? video;
  bool read;
  Fluff({
    this.sender,
    this.time,
    this.text,
    this.image,
    this.video,
    this.read = true,
  });

  List<Fluff> fromQuery(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Fluff(
        sender: doc.get('sender') ?? '',
        time: doc.get('time').toDate() ?? '',
        text: doc.get('text'),
        image: doc.get('image'),
        video: doc.get('video'),
        read: doc.get('read') ?? false,
      );
    }).toList();
  }

  Fluff.fromJson(Map<String, dynamic> json)
      : sender = json['sender'],
        time = json['time'].toDate(),
        text = json['text'],
        image = json['image'],
        video = json['video'],
        read = json['read'] ?? false;

  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'time': time,
      'text': text,
      'image': image,
      'video': video,
      'read': read,
    };
  }

  Fluff copyWith({
    String? sender,
    //? time,
    String? text,
    String? image,
    String? video,
    bool? read,
  }) {
    return Fluff(
      sender: sender ?? this.sender,
      time: time ?? time,
      text: text ?? this.text,
      image: image ?? this.image,
      video: video ?? this.video,
      read: read ?? this.read,
    );
  }

  @override
  String toString() {
    return 'Fluff(sender: $sender, time: $time, text: $text, image: $image, video: $video, read: $read)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Fluff &&
        other.sender == sender &&
        other.time == time &&
        other.text == text &&
        other.image == image &&
        other.video == video &&
        other.read == read;
  }

  @override
  int get hashCode {
    return sender.hashCode ^
        time.hashCode ^
        text.hashCode ^
        image.hashCode ^
        video.hashCode ^
        read.hashCode;
  }
}
