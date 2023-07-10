import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unsplash Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GalleryScreen(),
    );
  }
}

class GalleryScreen extends StatefulWidget {
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
        title: Text('Unsplash Gallery'),
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
                    '${photo.user.name}',
                    style: TextStyle(fontWeight: FontWeight.bold),
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

class PhotoScreen extends StatelessWidget {
  final Photo photo;

  const PhotoScreen({required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo'),
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: photo.urls.full,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

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

class User {
  final String name;

  User({required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
    );
  }
}

class Urls {
  final String small;
  final String full;

  Urls({required this.small, required this.full});

  factory Urls.fromJson(Map<String, dynamic> json) {
    return Urls(
      small: json['small'],
      full: json['full'],
    );
  }
}



//
// void main() {
//   runApp(UnsplashGalleryApp());
// }
//
// class UnsplashGalleryApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (_) => PhotoListViewModel(
//             UnsplashService('4-3PVUModbOZ3NaQdeM0P0rqOSAboVFxzLNfQZkTKRg'),
//           ),
//         ),
//       ],
//       child: MaterialApp(
//         title: 'Unsplash Gallery',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         initialRoute: '/',
//         routes: {
//           '/': (context) => PhotoListScreen(),
//           '/photo': (context) => PhotoScreen(), // Update the route configuration
//         },
//       ),
//     );
//   }
// }
//
//
//
