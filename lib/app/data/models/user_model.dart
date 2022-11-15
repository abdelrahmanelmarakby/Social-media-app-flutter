import 'dart:convert';

import 'package:flutter/foundation.dart';

//Social Media User Model
class SocialMediaUser {
  String? firstName;
  String? lastName;
  String? email;
  String? photoUrl;
  String? provider;
  String? uid;
  String? phoneNumber;
  String? address;
  String? bio;
  List<String>? following;
  List<String>? followers;

  //List<ChatRoom> chats;

  SocialMediaUser({
    this.firstName,
    this.lastName,
    this.email,
    this.photoUrl,
    this.provider,
    this.uid,
    this.phoneNumber,
    this.address,
    this.bio,
    this.following,
    this.followers,
  });

  SocialMediaUser copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? photoUrl,
    String? provider,
    String? uid,
    String? phoneNumber,
    String? address,
    String? bio,
    List<String>? following,
    List<String>? followers,
  }) {
    return SocialMediaUser(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      provider: provider ?? this.provider,
      uid: uid ?? this.uid,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      bio: bio ?? this.bio,
      following: following ?? this.following,
      followers: followers ?? this.followers,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (firstName != null) {
      result.addAll({'firstName': firstName});
    }
    if (lastName != null) {
      result.addAll({'lastName': lastName});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (photoUrl != null) {
      result.addAll({'photoUrl': photoUrl});
    }
    if (provider != null) {
      result.addAll({'provider': provider});
    }
    if (uid != null) {
      result.addAll({'uid': uid});
    }
    if (phoneNumber != null) {
      result.addAll({'phoneNumber': phoneNumber});
    }
    if (address != null) {
      result.addAll({'address': address});
    }
    if (bio != null) {
      result.addAll({'bio': bio});
    }
    if (following != null) {
      result.addAll({'following': following});
    }
    if (followers != null) {
      result.addAll({'followers': followers});
    }

    return result;
  }

  factory SocialMediaUser.fromMap(Map<String, dynamic> map) {
    return SocialMediaUser(
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      photoUrl: map['photoUrl'],
      provider: map['provider'],
      uid: map['uid'],
      phoneNumber: map['phoneNumber'],
      address: map['address'],
      bio: map['bio'],
      following: List<String>.from(map['following']),
      followers: List<String>.from(map['followers']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialMediaUser.fromJson(String source) =>
      SocialMediaUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SocialMediaUser(firstName: $firstName, lastName: $lastName, email: $email, photoUrl: $photoUrl, provider: $provider, uid: $uid, phoneNumber: $phoneNumber, address: $address, bio: $bio, following: $following, followers: $followers)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SocialMediaUser &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.photoUrl == photoUrl &&
        other.provider == provider &&
        other.uid == uid &&
        other.phoneNumber == phoneNumber &&
        other.address == address &&
        other.bio == bio &&
        listEquals(other.following, following) &&
        listEquals(other.followers, followers);
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        photoUrl.hashCode ^
        provider.hashCode ^
        uid.hashCode ^
        phoneNumber.hashCode ^
        address.hashCode ^
        bio.hashCode ^
        following.hashCode ^
        followers.hashCode;
  }
}
