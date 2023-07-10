import'package:flutter/material.dart';
import '../models/photo_model.dart';

class PhotoViewModel extends ChangeNotifier {
  final PhotoModel photo;
  PhotoViewModel(this.photo);
}
