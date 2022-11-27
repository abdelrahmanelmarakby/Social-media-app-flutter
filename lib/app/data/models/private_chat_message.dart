import 'package:cloud_firestore/cloud_firestore.dart';

class PrivateMessage {
  final String? sender;
  final DateTime?
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  String? text;
  String? image;
  String? video;
  String? audio;

  PrivateMessage({
    this.sender,
    this.time,
    this.text,
    this.image,
    this.video,
    this.audio,
  });

  List<PrivateMessage> fromQuery(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return PrivateMessage(
        sender: doc.get('sender') ?? '',
        time: doc.get('time').toDate() ?? '',
        text: doc.get('text'),
        image: doc.get('image'),
        video: doc.get('video'),
        audio: doc.get('audio'),
      );
    }).toList();
  }

  PrivateMessage.fromJson(Map<String, dynamic> json)
      : sender = json['sender'],
        time = json['time'].toDate(),
        text = json['text'],
        image = json['image'],
        video = json['video'],
        audio = json['audio'];

  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'time': time,
      'text': text,
      'image': image,
      'video': video,
      'audio': audio,
    };
  }
}
