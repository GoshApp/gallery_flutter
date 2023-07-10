class UserModel {
  final String id;
  final String updatedAt;
  final String username;
  final String name;
  final String portfolioUrl;
  final String bio;
  final String location;
  final int totalLikes;
  final int totalPhotos;
  final int totalCollections;
  final String instagramUsername;
  final String twitterUsername;
  final Map<String, dynamic> links;

  UserModel({
    required this.id,
    required this.updatedAt,
    required this.username,
    required this.name,
    required this.portfolioUrl,
    required this.bio,
    required this.location,
    required this.totalLikes,
    required this.totalPhotos,
    required this.totalCollections,
    required this.instagramUsername,
    required this.twitterUsername,
    required this.links,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      updatedAt: json['updated_at'],
      username: json['username'],
      name: json['name'],
      portfolioUrl: json['portfolio_url'],
      bio: json['bio'],
      location: json['location'],
      totalLikes: json['total_likes'],
      totalPhotos: json['total_photos'],
      totalCollections: json['total_collections'],
      instagramUsername: json['instagram_username'],
      twitterUsername: json['twitter_username'],
      links: json['links'],
    );
  }
}
