import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/photo_model.dart';
import '../view_models/photo_viewmodel.dart';

class PhotoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final photo = ModalRoute.of(context)!.settings.arguments as PhotoModel;
    final viewModel = PhotoViewModel(photo);

    return Scaffold(
      appBar: AppBar(
        title: Text('Photo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: photo.urls['regular'],
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                  ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  photo.description ?? '',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'By ${photo.user['name']}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
