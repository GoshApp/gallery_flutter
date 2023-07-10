class PhotoModel {
  final String id;
  final String createdAt;
  final String updatedAt;
  final int width;
  final int height;
  final String color;
  final String blurHash;
  final int downloads;
  final int likes;
  final bool likedByUser;
  final String description;
  final Map<String, dynamic> exif;
  final Map<String, dynamic> location;
  final List<dynamic> currentUserCollections;
  final Map<String, dynamic> urls;
  final Map<String, dynamic> links;
  final Map<String, dynamic> user;

  PhotoModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    required this.downloads,
    required this.likes,
    required this.likedByUser,
    required this.description,
    required this.exif,
    required this.location,
    required this.currentUserCollections,
    required this.urls,
    required this.links,
    required this.user,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      width: json['width'],
      height: json['height'],
      color: json['color'],
      blurHash: json['blur_hash'],
      downloads: json['downloads'],
      likes: json['likes'],
      likedByUser: json['liked_by_user'],
      description: json['description'],
      exif: json['exif'],
      location: json['location'],
      currentUserCollections: json['current_user_collections'],
      urls: json['urls'],
      links: json['links'],
      user: json['user'],
    );
  }
}
