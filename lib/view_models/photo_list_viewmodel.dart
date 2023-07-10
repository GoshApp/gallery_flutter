import 'package:flutter/material.dart';
import '../models/photo_model.dart';
import '../models/unsplash_service.dart';

class PhotoListViewModel extends ChangeNotifier {
  final UnsplashService _unsplashService;
  List<PhotoModel> _photos = [];
  bool _isLoading = false;

  List<PhotoModel> get photos => _photos;
  bool get isLoading => _isLoading;

  PhotoListViewModel(this._unsplashService);

  Future<void> fetchRandomPhotos(int count) async {
    _isLoading = true;
    notifyListeners();

    try {
      _photos = await _unsplashService.getRandomPhotos(count);
    } catch (e) {
      print('Failed to fetch photos: $e');
      _photos = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
