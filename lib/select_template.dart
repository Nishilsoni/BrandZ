class FestivalImage {
  final String name;
  final String description;
  final String imageUrl;

  FestivalImage({required this.name, required this.description, required this.imageUrl});

  factory FestivalImage.fromJson(Map<String, dynamic> json) {
    return FestivalImage(
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }
}

