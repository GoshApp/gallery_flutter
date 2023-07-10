import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_flutter/views/photo_screen.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import '../models/photo.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}
class _GalleryScreenState extends State<GalleryScreen> {
  List<Photo> _photos = [];

  @override
  void initState() {
    super.initState();
    fetchPhotos();
  }

  Future<void> fetchPhotos() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.unsplash.com/photos/random?count=10'),
        headers: {
          'Authorization': 'Client-ID 4-3PVUModbOZ3NaQdeM0P0rqOSAboVFxzLNfQZkTKRg',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        setState(() {
          _photos = jsonData.map((data) => Photo.fromJson(data)).toList();
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void navigateToPhotoScreen(Photo photo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoScreen(photo: photo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unsplash Gallery'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: _photos.map((photo) {
          return GestureDetector(
            onTap: () => navigateToPhotoScreen(photo),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl: photo.urls.small,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    photo.user.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}