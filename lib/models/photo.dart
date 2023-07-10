import 'package:gallery_flutter/models/urls.dart';
import 'package:gallery_flutter/models/user.dart';

class Photo {
  final String id;
  final String description;
  final User user;
  final Urls urls;

  Photo({
    required this.id,
    required this.description,
    required this.user,
    required this.urls,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      description: json['description'] ?? '',
      user: User.fromJson(json['user']),
      urls: Urls.fromJson(json['urls']),
    );
  }
}