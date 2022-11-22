// NetworkService _networkService =
//     NetworkService(baseUrl: 'http://143.198.249.188:4020/v1', httpHeaders: {
//   'Content-Type': 'application/json',
//   'Accept': 'application/json',
//   'Authorization': 'Bearer ${SharedPrefService(prefs: globalPrefs).getToken()}',
// });

import '../services/network_service.dart/dio_network_service.dart';

NetworkService networkService = NetworkService(
  baseUrl: 'http://143.198.249.188:4020/v1/',
  httpHeaders: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRoIjoibWFnaWMiLCJleHAiOjE2Njc5MDY0NTksInVzZXIiOnsiaWQiOjIwMDc0LCJwaG9uZSI6IjA1OTA4MDk3NTYiLCJuYW1lIjoiQWJkZWxoYWsiLCJpZF9udW1iZXIiOm51bGwsImNpdHlfaWQiOjEsInJvbGVfaWQiOjEsImlzX2FkbWluIjpmYWxzZSwidmVyaWZpY2F0aW9uX3N0YXR1cyI6IjEiLCJzdGF0dXMiOjEsImVtYWlsIjpudWxsLCJpc19lbWFpbF92ZXJpZmllZCI6ZmFsc2UsImVtYWlsX3ZlcmlmaWNhdGlvbl9jb2RlIjpudWxsLCJwYXNzd29yZCI6bnVsbCwicGVyc29uYWxfaW1hZ2UiOm51bGwsImlkX2ltYWdlIjpudWxsLCJibG9ja19yZWFzb24iOm51bGwsImRldmljZV9rZXkiOm51bGwsImRldmljZV90eXBlIjoidW5rbm93biIsImNyZWF0ZWRfYXQiOiIyMDIyLTA5LTI4VDA2OjU0OjIzLjAwMFoiLCJ1cGRhdGVkX2F0IjoiMjAyMi0wOS0yOFQwNjo1NDoyMy4wMDBaIiwiZGVsZXRlZF9hdCI6bnVsbCwiZHJpdmVyIjpudWxsfSwiaWF0IjoxNjY1MzE0NDU5fQ.vB7utSpjYxPS4-NP3ammmsGjvh71K351jatrNoFUw6E'
    // '${SharedPrefService(prefs: globalPrefs).getToken()}'
    ,
  },
);
const String agoraID = "2a5f6928a6c741ac9a0a51a48a3b68cd";
const String agoraCertificate = "122f4ad456f6434098d361e9a63f4136";
const String agoraToken =
    "007eJxTYNhcw/nTrjrteNkZjvhjG0RMrcKvO285+rSqev6PClbnynQFBqNE0zQzSyOLRLNkcxPDxGTLRINEU8NEE4tE4yQzi+SUq+tqkhsCGRlirnUyMEIhiK/AkJliZWRgaGBpYmlqaWZmqQ3lG1qaG5hZmBhpMzAAAE/5Jgw=";
