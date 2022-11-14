import 'dart:convert';

class Notification {
  final String id;
  final String title;
  final String body;
  final String type;
  final String data;
  final String createdAt;
  final String imageUrl;
  Notification({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    required this.data,
    required this.createdAt,
    required this.imageUrl,
  });

  Notification copyWith({
    String? id,
    String? title,
    String? body,
    String? type,
    String? data,
    String? createdAt,
    String? imageUrl,
  }) {
    return Notification(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      type: type ?? this.type,
      data: data ?? this.data,
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
    result.addAll({'createdAt': createdAt});
    result.addAll({'imageUrl': imageUrl});

    return result;
  }

  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      type: map['type'] ?? '',
      data: map['data'] ?? '',
      createdAt: map['createdAt'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Notification.fromJson(String source) =>
      Notification.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Notification(id: $id, title: $title, body: $body, type: $type, data: $data, createdAt: $createdAt, imageUrl: $imageUrl)';
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
        createdAt.hashCode ^
        imageUrl.hashCode;
  }
}
