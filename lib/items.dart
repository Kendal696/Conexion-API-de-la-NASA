class NasaItem {
  final String nasaId;
  final String title;
  final String description;
  final String mediaType;
  final String dateCreated;
  final String? imageUrl;
  NasaItem({
    required this.nasaId,
    required this.title,
    required this.description,
    required this.mediaType,
    required this.dateCreated,
    this.imageUrl,
  });

  factory NasaItem.fromJson(Map<String, dynamic> json) {
    return NasaItem(
      nasaId: json['nasa_id'] ??
          "", // Proporcionar un valor predeterminado si es nulo
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      mediaType: json['media_type'] ?? "",
      dateCreated: json['date_created'] ?? "",
      imageUrl: json['href'] as String?, // Castear como String nullable
    );
  }
}
