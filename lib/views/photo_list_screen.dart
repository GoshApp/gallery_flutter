import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/photo_list_viewmodel.dart';

class PhotoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PhotoListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Unsplash Gallery'),
      ),
      body: Center(
        child: viewModel.isLoading
            ? CircularProgressIndicator()
            : ListView.builder(
          itemCount: viewModel.photos.length,
          itemBuilder: (context, index) {
            final photo = viewModel.photos[index];
            return ListTile(
              leading: Image.network(photo.urls['small']),
              title: Text(photo.description ?? ''),
              subtitle: Text(photo.user['name']),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/photo',
                  arguments: photo,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
