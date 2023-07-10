import 'dart:convert';
import 'package:gallery_flutter/models/photo_model.dart';
import 'package:http/http.dart' as http;

class UnsplashService {
  final String accessKey;

  UnsplashService(this.accessKey);

  Future<List<PhotoModel>> getRandomPhotos(int count) async {
    final response = await http.get(
      Uri.https('api.unsplash.com', '/photos/random', {'count': '$count'}),
      headers: {'Authorization': 'Client-ID $accessKey'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => PhotoModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
