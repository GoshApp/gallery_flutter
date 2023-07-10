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